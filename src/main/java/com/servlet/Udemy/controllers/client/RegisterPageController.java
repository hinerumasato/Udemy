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

@WebServlet("/register")
public class RegisterPageController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {        
        HttpSession session = req.getSession();        
        String error = (String) session.getAttribute("registerError");
        Page page = new ClientPage(req, resp, "register.jsp", "master.jsp");
        page.setObject("title", "Đăng ký");
        page.setObject("error", error);
        
        page.setObject("googleAuthLink", StringUtil.getGoogleAuthLink());
        page.render();
        session.removeAttribute("registerError");
    }

    
}
