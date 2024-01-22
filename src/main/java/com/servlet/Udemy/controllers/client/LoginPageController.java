package com.servlet.Udemy.controllers.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.utils.StringUtil;

@WebServlet("/login")
public class LoginPageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Page page = new ClientPage(req, resp, "login.jsp", "master.jsp");
        page.setObject("title", "Đăng nhập");
        page.setObject("googleAuthLink", StringUtil.getGoogleAuthLink());
        page.setObject("error", session.getAttribute("loginError"));
        page.render();
        session.removeAttribute("loginError");
        session.removeAttribute("registerSuccessfully");
        session.removeAttribute("resetPasswordSuccess");
    }
    
}
