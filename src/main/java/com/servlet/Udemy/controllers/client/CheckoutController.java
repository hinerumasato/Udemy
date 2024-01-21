package com.servlet.Udemy.controllers.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.configs.Vnpay;
import com.servlet.Udemy.models.CheckoutDetailModel;
import com.servlet.Udemy.models.CheckoutModel;
import com.servlet.Udemy.models.CourseModel;
import com.servlet.Udemy.models.LevelModel;
import com.servlet.Udemy.models.ThumbnailModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CheckoutDetailService;
import com.servlet.Udemy.services.CheckoutService;
import com.servlet.Udemy.services.CourseService;
import com.servlet.Udemy.services.LevelService;
import com.servlet.Udemy.utils.FileUtil;
import com.servlet.Udemy.utils.NumberUtil;

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {

    private CheckoutService checkoutService = new CheckoutService();
    private CheckoutDetailService checkoutDetailService = new CheckoutDetailService();
    private CourseService courseService = new CourseService();
    private LevelService levelService = new LevelService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int checkoutId = Integer.parseInt(req.getParameter("id"));
        CheckoutModel checkoutModel = checkoutService.findById(checkoutId);
        List<CheckoutDetailModel> checkoutDetails = new ArrayList<>();
        Map<CheckoutDetailModel, CourseModel> courseMap = new HashMap<>();
        Map<CourseModel, LevelModel> levelMap = new HashMap<>();
        Map<CourseModel, ThumbnailModel> thumbnailMap = new HashMap<>();

        checkoutDetails = checkoutDetailService.findByCheckoutId(checkoutId);

        double totalPrice = 0;
        for (CheckoutDetailModel checkoutDetail : checkoutDetails) {
            CourseModel courseModel = courseService.findById(checkoutDetail.getCourseId());
            courseMap.put(checkoutDetail, courseModel);
            levelMap.put(courseModel, levelService.findById(courseModel.getLevelId()));
            thumbnailMap.put(courseModel, courseModel.getThumbnails().get(0));
            totalPrice += checkoutDetail.getAmount() * courseModel.getSalePrice();
        }

        Page page = new ClientPage(req, resp, "checkout.jsp", "blank.jsp");
        page.setObject("title", "Thanh toán đơn hàng");
        page.setObject("checkoutDetails", checkoutDetails);
        page.setObject("checkout", checkoutModel);
        page.setObject("courseMap", courseMap);
        page.setObject("levelMap", levelMap);
        page.setObject("thumbnailMap", thumbnailMap);
        page.setObject("totalPrice", totalPrice);
        page.render();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        double totalPrice = Double.parseDouble(req.getParameter("total-price"));
        String ipAddress = req.getRemoteAddr();
        String tmnCode = FileUtil.env("VNPAY_ID");
        String hashSecret = FileUtil.env("VNPAY_SECRET");
        int checkoutId = Integer.parseInt(req.getParameter("checkoutId"));
        String orderInfo = "Thanh toan hoa don ma " + checkoutId;
        int totalPriceInt = NumberUtil.round(totalPrice);

        Vnpay vnpay = new Vnpay();
        String paymentUrl = vnpay.amount(totalPriceInt * 100)
                                .vnpHashSecret(hashSecret)
                                .vnpTmnCode(tmnCode)
                                .vnpIpAddr(ipAddress)
                                .vnpOrderInfo(orderInfo)
                                .buildUrl();
        HttpSession session = req.getSession();
        session.setAttribute("checkoutId", checkoutId);
        resp.sendRedirect(paymentUrl);
    }
}
