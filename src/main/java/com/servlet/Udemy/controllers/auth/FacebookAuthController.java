package com.servlet.Udemy.controllers.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.constants.LoginType;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.services.UserService;

@WebServlet("/auth/facebook")
public class FacebookAuthController extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String firstName = req.getParameter("first_name");
        String lastName = req.getParameter("last_name");
        String picture = req.getParameter("picture");
        UserModel userModel = new UserModel(email, null, firstName, lastName, null, picture, true, LoginType.FACEBOOK);
        if(!userService.exists(userModel)) {
            userService.insert(userModel);
        }

        HttpSession session = req.getSession();
        session.setAttribute("loginUser", userModel);
        resp.sendRedirect("/home");
    }
    
}
