package com.servlet.Udemy.controllers.client;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.constants.PaymentStatus;
import com.servlet.Udemy.models.CartModel;
import com.servlet.Udemy.models.CategoryModel;
import com.servlet.Udemy.models.CheckoutDetailModel;
import com.servlet.Udemy.models.CheckoutModel;
import com.servlet.Udemy.models.CourseModel;
import com.servlet.Udemy.models.LevelModel;
import com.servlet.Udemy.models.TeacherModel;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CartService;
import com.servlet.Udemy.services.CategoryService;
import com.servlet.Udemy.services.CheckoutDetailService;
import com.servlet.Udemy.services.CheckoutService;
import com.servlet.Udemy.services.CourseService;
import com.servlet.Udemy.services.LevelService;
import com.servlet.Udemy.services.TeacherService;

@WebServlet("/courses/details/*")
public class CourseDetailsController extends HttpServlet {

    private CourseService courseService = new CourseService();
    private CategoryService categoryService = new CategoryService();
    private LevelService levelService = new LevelService();
    private TeacherService teacherService = new TeacherService();

    private CartService cartService = new CartService();
    private CheckoutService checkoutService = new CheckoutService();
    private CheckoutDetailService checkoutDetailService = new CheckoutDetailService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String slug = req.getPathInfo().substring(1);
        if (slug.isEmpty() || slug.isBlank())
            resp.sendError(404, "Not found");
        else {
            CourseModel course = courseService.findBySlug(slug);
            if(course != null) {
                Map<CourseModel, CategoryModel> categoryMap = new HashMap<CourseModel, CategoryModel>();
                Map<CourseModel, LevelModel> levelMap = new HashMap<CourseModel, LevelModel>();
                Map<CourseModel, TeacherModel> teacherMap = new HashMap<CourseModel, TeacherModel>();
                categoryMap.put(course, categoryService.findById(course.getCategoryId()));
                levelMap.put(course, levelService.findById(course.getLevelId()));
                teacherMap.put(course, teacherService.findById(course.getTeacherId()));

                Page page = new ClientPage(req, resp, "course-details.jsp", "master.jsp");
                page.setObject("title", course.getName());
                page.setObject("course", course);
                page.setObject("categoryMap", categoryMap);
                page.setObject("levelMap", levelMap);
                page.setObject("teacherMap", teacherMap);
                page.render();
            } else {
                resp.sendError(404, "Not found");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        int courseId = Integer.parseInt(req.getParameter("courseId"));
        int amount = Integer.parseInt(req.getParameter("amount"));
        double totalAmount = Double.parseDouble(req.getParameter("totalAmount"));
        UserModel loginUser = (UserModel) session.getAttribute("loginUser");

        CartModel cartModel = cartService.findByUserId(loginUser.getId());
        if(cartModel == null) {
            cartModel = new CartModel();
            cartModel.setUserId(loginUser.getId());
            cartService.insert(cartModel);
            cartModel = cartService.findLast();
        }

        CheckoutModel checkoutModel = new CheckoutModel();
        checkoutModel.setCartId(cartModel.getId());
        checkoutModel.setDiscount(0);
        checkoutModel.setPaymentStatus(PaymentStatus.NOT_PAID);
        checkoutModel.setTotalAmount(totalAmount);

        checkoutService.insert(checkoutModel);

        checkoutModel = checkoutService.findLast();

        CheckoutDetailModel checkoutDetailModel = new CheckoutDetailModel();
        checkoutDetailModel.setCourseId(courseId);
        checkoutDetailModel.setAmount(amount);
        checkoutDetailModel.setCheckoutId(checkoutModel.getId());
        checkoutDetailService.insert(checkoutDetailModel);

        resp.sendRedirect("/checkout?id=" + checkoutModel.getId());
    }
}
