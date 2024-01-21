package com.servlet.Udemy.controllers.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.constants.ErrorMessage;
import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.UserService;
import com.servlet.Udemy.utils.StringUtil;

@WebServlet("/account/change-password")
public class ChangePasswordController extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Page page = new ClientPage(req, resp, "change-password.jsp", "master.jsp");
        page.setObject("title", "Đổi mật khẩu");
        page.render();

        session.removeAttribute("changePasswordMessage");
        session.removeAttribute("alertType");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        String oldPassword = req.getParameter("old-password");
        String newPassword = req.getParameter("new-password");
        UserModel loginUser = (UserModel) session.getAttribute("loginUser");

        String loginUserHashedPassword = loginUser.getPassword();
        if(StringUtil.isEncryptEquals(oldPassword, loginUserHashedPassword)) {
            String hashedPassword = StringUtil.encrypt(newPassword);
            loginUser.setPassword(hashedPassword);
            userService.update(loginUser);
            session.setAttribute("changePasswordMessage", SuccessMessage.CHANGE_PASSWORD_SUCCESS);
            session.setAttribute("alertType", "success");
            resp.sendRedirect("/account/change-password");
        } 
        else {
            session.setAttribute("changePasswordMessage", ErrorMessage.CHANGE_PASSWORD_ERROR);
            session.setAttribute("alertType", "danger");
            resp.sendRedirect("/account/change-password");
        }
    }
}
