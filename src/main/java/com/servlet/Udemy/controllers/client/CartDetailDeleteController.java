package com.servlet.Udemy.controllers.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.services.CartDetailService;

@WebServlet("/cart/delete")
public class CartDetailDeleteController extends HttpServlet {

    private CartDetailService cartDetailService = new CartDetailService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doDelete(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        int cartDetailId = Integer.parseInt(req.getParameter("id"));
        cartDetailService.delete(cartDetailId);

        resp.sendRedirect("/cart");
    }
}
