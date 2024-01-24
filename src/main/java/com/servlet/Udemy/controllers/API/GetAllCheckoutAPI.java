package com.servlet.Udemy.controllers.API;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.constants.PaymentStatus;
import com.servlet.Udemy.models.CheckoutModel;
import com.servlet.Udemy.models.ResponseModel;
import com.servlet.Udemy.services.CheckoutService;

@WebServlet("/api/v1/checkouts/all")
public class GetAllCheckoutAPI extends HttpServlet {

    private CheckoutService checkoutService = new CheckoutService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String paymentStatus = req.getParameter("paymentStatus");
        String date = req.getParameter("date");

        List<CheckoutModel> checkouts = new ArrayList<>();
        if(paymentStatus == null || paymentStatus.isEmpty())
            checkouts = checkoutService.findByDate(date);
        else if(paymentStatus.equals(PaymentStatus.NOT_PAID)) {
            checkouts = checkoutService.findByDateAndNotPaid(date);
        } else checkouts = checkoutService.findByDateAndPaid(date);
        ResponseModel responseModel = new ResponseModel();
        PrintWriter out = resp.getWriter();
        if(checkouts == null || checkouts.isEmpty())
            out.println(responseModel.response(404, "Not found", null));
        else out.println(responseModel.response(200, "success", checkouts));
    }
}
