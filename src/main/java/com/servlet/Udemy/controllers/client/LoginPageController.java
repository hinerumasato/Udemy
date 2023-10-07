package com.servlet.Udemy.controllers.client;

import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.utils.NumberUtil;
import com.servlet.Udemy.utils.StringUtil;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginPageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Page page = new Page(req, resp, "login.jsp", "master.jsp");
        page.setObject("title", "Đăng nhập");
        page.setObject("randomNumber", NumberUtil.random());
        page.setObject("googleAuthLink", StringUtil.getGoogleAuthLink());
        page.setObject("error", session.getAttribute("loginError"));
        page.setObject("message", session.getAttribute("registerSuccessfully"));
        page.render();
        session.removeAttribute("loginError");
        session.removeAttribute("registerSuccessfully");
    }
    
}
