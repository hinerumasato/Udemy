package com.servlet.Udemy.controllers.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.constants.ErrorMessage;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.models.VerifyEmailModel;
import com.servlet.Udemy.services.UserService;
import com.servlet.Udemy.services.VerifyEmailService;

@WebServlet("/verify/email/process")
public class ProcessVerifyEmailController extends HttpServlet {

    private VerifyEmailService verifyEmailService = new VerifyEmailService();
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String rememberToken = req.getParameter("remember_token");
        VerifyEmailModel verifyEmailModel = verifyEmailService.findByRememberToken(rememberToken);
        if(verifyEmailModel != null) {
            UserModel userModel = (UserModel) session.getAttribute("loginUser");
            userModel.setEmailVerified(true);
            userService.update(userModel);
            verifyEmailService.delete(verifyEmailModel.getId());

            resp.sendRedirect("/home");
        } else {
            resp.sendError(404, ErrorMessage.VERIFY_EMAIL_PROCESS_FIND_USER_MESSAGE);
        }
    }
}
