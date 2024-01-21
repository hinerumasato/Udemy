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
import com.servlet.Udemy.constants.PaymentStatus;
import com.servlet.Udemy.mappers.CartCheckoutDetailMapper;
import com.servlet.Udemy.models.CartDetailModel;
import com.servlet.Udemy.models.CartModel;
import com.servlet.Udemy.models.CheckoutDetailModel;
import com.servlet.Udemy.models.CheckoutModel;
import com.servlet.Udemy.models.CourseModel;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CartDetailService;
import com.servlet.Udemy.services.CartService;
import com.servlet.Udemy.services.CheckoutDetailService;
import com.servlet.Udemy.services.CheckoutService;
import com.servlet.Udemy.services.CourseService;

@WebServlet("/cart")
public class CartController extends HttpServlet {

    private CartService cartService = new CartService();
    private CartDetailService cartDetailService = new CartDetailService();
    private CourseService courseService = new CourseService();
    private CheckoutService checkoutService = new CheckoutService();
    private CheckoutDetailService checkoutDetailService = new CheckoutDetailService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<CartDetailModel> cartDetails = new ArrayList<CartDetailModel>();
        Map<CartDetailModel, CourseModel> courseMap = new HashMap<CartDetailModel, CourseModel>();
        UserModel loginUser = (UserModel) session.getAttribute("loginUser");
        Page page = new ClientPage(req, resp, "cart.jsp", "master.jsp");
        double totalPrice = 0;
        if(loginUser != null) {
            CartModel cartModel = cartService.findByUserId(loginUser.getId());
            if(cartModel != null) {
                cartDetails = cartDetailService.findByCartId(cartModel.getId());
                if(cartDetails != null) {
                    for (CartDetailModel cartDetail : cartDetails) {
                        CourseModel courseModel = courseService.findById(cartDetail.getCourseId());
                        courseMap.put(cartDetail, courseModel);
                        totalPrice += cartDetail.getAmount() * courseModel.getSalePrice();
                    }
                }
            }
        } else page.setObject("notLoginMessage", ErrorMessage.CART_NOT_LOGIN_MESSAGE);
        page.setObject("title", "Giỏ hàng");
        page.setObject("cartDetails", cartDetails);
        page.setObject("courseMap", courseMap);
        page.setObject("totalPrice", totalPrice);
        page.render();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        double totalPrice = Double.parseDouble(req.getParameter("totalPrice"));

        UserModel loginUser = (UserModel) session.getAttribute("loginUser");
        CartModel cartModel = cartService.findByUserId(loginUser.getId());
        CheckoutModel checkoutModel = new CheckoutModel();
        
        // Create new CheckoutModel
        checkoutModel.setPaymentStatus(PaymentStatus.NOT_PAID);
        checkoutModel.setDiscount(0);
        checkoutModel.setTotalAmount(totalPrice);
        checkoutModel.setCartId(cartModel.getId());
        checkoutService.insert(checkoutModel);

        // Find newest checkout data
        checkoutModel = checkoutService.findLast();
        
        // Map all cart detail data to checkout detail
        List<CartDetailModel> cartDetails = cartDetailService.findByCartId(cartModel.getId());
        List<CheckoutDetailModel> checkoutDetails = CartCheckoutDetailMapper.mapToList(cartDetails);

        for (CheckoutDetailModel checkoutDetail : checkoutDetails) {
            checkoutDetail.setCheckoutId(checkoutModel.getId());
            checkoutDetailService.insert(checkoutDetail);
        }

        // Delete cart detail data
        cartDetailService.deleteByCartId(cartModel.getId());

        resp.sendRedirect("/checkout?id=" + checkoutModel.getId());

    }
}
