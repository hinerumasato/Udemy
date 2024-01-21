package com.servlet.Udemy.controllers.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;

@WebServlet("/account")
public class AccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Page page = new ClientPage(req, resp, "account.jsp", "master.jsp");
        page.setObject("title", "Thông tin tài khoản");
        page.render();
    }    
}
