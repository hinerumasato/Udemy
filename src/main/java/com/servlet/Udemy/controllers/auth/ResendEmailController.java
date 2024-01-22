package com.servlet.Udemy.controllers.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.models.VerifyEmailModel;
import com.servlet.Udemy.services.VerifyEmailService;

@WebServlet("/verify/email/resend")
public class ResendEmailController extends HttpServlet {

    private VerifyEmailService verifyEmailService = new VerifyEmailService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserModel loginUser = (UserModel) session.getAttribute("loginUser");
        
        VerifyEmailModel verifyEmailModel = verifyEmailService.findByUserId(loginUser.getId());
        if(verifyEmailModel != null)
            verifyEmailService.delete(verifyEmailModel.getId());
        resp.sendRedirect("/verify/email");
    }
}
