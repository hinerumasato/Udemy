package com.servlet.Udemy.controllers.API;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.constants.ErrorMessage;
import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.models.CartDetailModel;
import com.servlet.Udemy.models.CartModel;
import com.servlet.Udemy.models.ResponseModel;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.services.CartDetailService;
import com.servlet.Udemy.services.CartService;
import com.servlet.Udemy.utils.StringUtil;

@WebServlet("/api/v1/cart")
@MultipartConfig(
    maxRequestSize = 1024 * 1024
)
public class CartAPI extends HttpServlet {

    private CartService cartService = new CartService();
    private CartDetailService cartDetailService = new CartDetailService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");

        PrintWriter out = resp.getWriter();
        ResponseModel responseModel = new ResponseModel();

        HttpSession session = req.getSession();
        UserModel loginUser = (UserModel) session.getAttribute("loginUser");
        if(loginUser == null) {
            out.println(responseModel.response(HttpServletResponse.SC_NOT_ACCEPTABLE, ErrorMessage.ADD_TO_CART_NOT_LOGIN_ERROR, null));
        } else {
            InputStream courseIdInputStream = req.getPart("courseId").getInputStream();
            InputStream amountInputStream = req.getPart("amount").getInputStream();
            int courseId = Integer.parseInt(StringUtil.getDataFromInputStream(courseIdInputStream));
            int amount = Integer.parseInt(StringUtil.getDataFromInputStream(amountInputStream));
            int userId = loginUser.getId();
            CartModel cartModel = new CartModel();
            cartModel.setUserId(userId);
            cartService.insertOrUpdateByUserId(cartModel);

            cartModel = cartService.findByUserId(userId);
            
            CartDetailModel cartDetailModel = cartDetailService.findByCartIdAndCourseId(cartModel.getId(), courseId);
            if(cartDetailModel == null) {
                cartDetailModel = new CartDetailModel();
                cartDetailModel.setCartId(cartModel.getId());
                cartDetailModel.setAmount(amount);
                cartDetailModel.setCourseId(courseId);
    
                cartDetailService.insert(cartDetailModel);
            } else {
                int oldAmount = cartDetailModel.getAmount();
                int newAmount = oldAmount + amount;
                cartDetailModel.setAmount(newAmount);
                
                cartDetailService.update(cartDetailModel);
            }
            
            out.println(responseModel.response(HttpServletResponse.SC_OK, SuccessMessage.ADD_TO_CART_SUCCESS, null));
        }
    }
}
