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

import com.servlet.Udemy.constants.ErrorMessage;
import com.servlet.Udemy.models.CartModel;
import com.servlet.Udemy.models.CourseModel;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CartService;
import com.servlet.Udemy.services.CourseService;

@WebServlet("/cart")
public class CartController extends HttpServlet {

    private CartService cartService = new CartService();
    private CourseService courseService = new CourseService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<CartModel> carts = new ArrayList<CartModel>();
        Map<CartModel, CourseModel> courseMap = new HashMap<CartModel, CourseModel>();
        UserModel loginUser = (UserModel) session.getAttribute("loginUser");
        Page page = new ClientPage(req, resp, "cart.jsp", "master.jsp");
        double totalPrice = 0;
        if(loginUser != null) {
            carts = cartService.findByUserId(loginUser.getId());
            if(carts != null) {
                for (CartModel cart : carts) {
                    CourseModel courseModel = courseService.findById(cart.getCourseId());
                    courseMap.put(cart, courseModel);
                    totalPrice += cart.getAmount() * courseModel.getSalePrice();
                }
            }
        } else page.setObject("notLoginMessage", ErrorMessage.CART_NOT_LOGIN_MESSAGE);
        page.setObject("title", "Giỏ hàng");
        page.setObject("carts", carts);
        page.setObject("courseMap", courseMap);
        page.setObject("totalPrice", totalPrice);
        page.render();
    }
}
