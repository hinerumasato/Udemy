package com.servlet.Udemy.controllers.API;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.models.ResponseModel;
import com.servlet.Udemy.services.CheckoutService;

@WebServlet("/api/v1/checkout")
public class CheckoutAPI extends HttpServlet {

    private CheckoutService checkoutService = new CheckoutService();

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        int id = Integer.parseInt(req.getParameter("id"));
        checkoutService.delete(id);
        ResponseModel responseModel = new ResponseModel();
        PrintWriter out = resp.getWriter();
        out.println(responseModel.response(HttpServletResponse.SC_OK, SuccessMessage.DELETE_CHECKOUT_SUCCESS, null));
    }
}
