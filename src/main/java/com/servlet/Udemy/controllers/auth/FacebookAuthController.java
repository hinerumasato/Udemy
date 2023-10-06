package com.servlet.Udemy.controllers.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.servlet.Udemy.models.UserModel;

@WebServlet("/auth/facebook")
public class FacebookAuthController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String firstName = req.getParameter("first_name");
        String lastName = req.getParameter("last_name");
        String picture = req.getParameter("picture");

        UserModel userModel = new UserModel(email, null, firstName, lastName, null);
        String json = new Gson().toJson(userModel);
        resp.getWriter().write(json);
    }
    
}
