package com.servlet.Udemy.controllers.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.DTO.UserDTO;
import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.mappers.UserMapper;
import com.servlet.Udemy.models.ResetPasswordModel;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.ResetPasswordService;
import com.servlet.Udemy.services.UserService;
import com.servlet.Udemy.utils.StringUtil;

@WebServlet("/reset-password/process")
public class ProcessResetPasswordController extends HttpServlet {

    private UserService userService = new UserService();
    private ResetPasswordService resetPasswordService = new ResetPasswordService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String rememberToken = req.getParameter("remember_token");
        ResetPasswordModel resetPassword = resetPasswordService.findByRememberToken(rememberToken);
        if(resetPassword == null)
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        else {
            UserModel user = userService.findById(resetPassword.getUserId());
            UserDTO userDTO = UserMapper.mapUserToDTO(user);
            Page page = new ClientPage(req, resp, "reset-password-process.jsp", "master.jsp");
            page.setObject("title", "Đặt mật khẩu mới");
            page.setObject("user", userDTO);
            page.render();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        int userId = Integer.parseInt(req.getParameter("user-id"));
        String newPassword = req.getParameter("new-password");
        UserModel userModel = userService.findById(userId);
        userModel.setPassword(StringUtil.encrypt(newPassword));
        userService.update(userModel);

        resetPasswordService.deleteByUserId(userId);

        session.setAttribute("resetPasswordSuccess", SuccessMessage.CHANGE_PASSWORD_SUCCESS);
        resp.sendRedirect("/login");
    }
}
