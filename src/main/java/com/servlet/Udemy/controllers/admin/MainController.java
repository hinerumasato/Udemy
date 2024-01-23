package com.servlet.Udemy.controllers.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.page.AdminPage;
import com.servlet.Udemy.page.Page;

@WebServlet("/admin")
public class MainController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Page page = new AdminPage(req, resp, "main.jsp", "master.jsp");
        page.setObject("title", "Admin");
        page.render();
    } 

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("adminLoginUser");
        resp.sendRedirect("/admin");
    }
}
