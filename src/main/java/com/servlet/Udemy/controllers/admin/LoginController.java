package com.servlet.Udemy.controllers.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.constants.ErrorMessage;
import com.servlet.Udemy.constants.Role;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.page.AdminPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.UserService;

@WebServlet("/auth/login-admin")
public class LoginController extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Page page = new AdminPage(req, resp, "login.jsp", "blank.jsp");
        page.setObject("login.jsp", "Admin đăng nhập");
        page.setObject("title", "Đăng nhập Admin");
        page.render();

        req.getSession().removeAttribute("adminLoginMessage");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        String username = req.getParameter("adminEmail");
        String password = req.getParameter("adminPassword");

        UserModel userModel = userService.findByUsernamePassword(username, password);
        if(userModel != null) {
            if(userModel.getRole() == null || userModel.getRole().equals(Role.USER)) {
                session.setAttribute("adminLoginMessage", ErrorMessage.ADMIN_LOGIN_WRONG_ROLE);
                resp.sendRedirect("/auth/login-admin");
            }
            else {
                session.setAttribute("adminLoginUser", userModel);
                resp.sendRedirect("/admin");
            } 
        } else {
            session.setAttribute("adminLoginMessage", ErrorMessage.ADMIN_LOGIN_NOT_FOUND);
            resp.sendRedirect("/auth/login-admin");
        }
    }
}
