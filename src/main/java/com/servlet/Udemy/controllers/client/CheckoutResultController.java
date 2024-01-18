package com.servlet.Udemy.controllers.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.models.CheckoutModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CartDetailService;
import com.servlet.Udemy.services.CheckoutService;

@WebServlet("/checkout/result")
public class CheckoutResultController extends HttpServlet {

    private CheckoutService checkoutService = new CheckoutService();
    private CartDetailService cartDetailService = new CartDetailService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String responseCode = req.getParameter("vnp_ResponseCode");
        HttpSession session = req.getSession();
        if(responseCode.equals("00")) {
            int checkoutId = (int) session.getAttribute("checkoutId");
            CheckoutModel checkoutModel = checkoutService.findById(checkoutId);
            checkoutModel.setPaymentStatus("PAID");
            checkoutService.update(checkoutModel);
            session.removeAttribute("checkoutId");

            int cartId = checkoutModel.getCartId();
            cartDetailService.deleteByCartId(cartId);
            
            Page page = new ClientPage(req, resp, "checkout-success.jsp", "blank.jsp");
            page.setObject("checkoutId", checkoutId);
            page.render();
        }
    }
}
