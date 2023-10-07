package com.servlet.Udemy.controllers.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.services.UserService;

@WebServlet("/auth/login")
public class LoginController extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("email");
        String password = req.getParameter("password");
        UserModel userModel = userService.findByUsernamePassword(username, password);
        if(userModel == null) {
            HttpSession session = req.getSession();
            session.setAttribute("loginError", "Sai tên đăng nhập hoặc mật khẩu");
            resp.sendRedirect("/login");
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("loginUser", userModel);
            resp.sendRedirect("/home");
        }
    }
}
