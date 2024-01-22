package com.servlet.Udemy.controllers.client;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.constants.ErrorMessage;
import com.servlet.Udemy.constants.LoginType;
import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.mail.Mail;
import com.servlet.Udemy.models.ResetPasswordModel;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.ResetPasswordService;
import com.servlet.Udemy.services.UserService;
import com.servlet.Udemy.utils.FileUtil;
import com.servlet.Udemy.utils.StringUtil;

@WebServlet("/reset-password")
public class ResetPasswordController extends HttpServlet {

    private UserService userService = new UserService();
    private ResetPasswordService resetPasswordService = new ResetPasswordService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Page page = new ClientPage(req, resp, "reset-password.jsp", "master.jsp");
        page.setObject("title", "Lấy lại mật khẩu");
        page.render();

        session.removeAttribute("resetPasswordMessage");
        session.removeAttribute("alertType");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String emailTo = req.getParameter("email");
        UserModel userModel = userService.findByUsernameAndLoginType(emailTo, LoginType.NORMAL);
        if(userModel != null) {
            int userId = userModel.getId();
            resetPasswordService.deleteByUserId(userId);
            String rememberToken = StringUtil.encrypt(Integer.toString(userId));
            String APP_URL = FileUtil.env("APP_URL");
            Map<String, String> map = new HashMap<>();
            map.put("APP_URL", APP_URL);
            map.put("remember_token", rememberToken);

            ResetPasswordModel resetPasswordModel = new ResetPasswordModel();
            resetPasswordModel.setRememberToken(rememberToken);
            resetPasswordModel.setUserId(userId);

            resetPasswordService.insert(resetPasswordModel);

            Mail mail = new Mail("reset-password-mail.jsp", map);
            String emailFrom = FileUtil.env("mail.smtp.username");
            mail.sendMail(emailFrom, emailTo, "Đổi mật khẩu", "Email xác nhận đổi mật khẩu");

            session.setAttribute("resetPasswordMessage", SuccessMessage.RESET_PASSWORD_SUCCESS);
            session.setAttribute("alertType", "success");
            resp.sendRedirect("/reset-password");
        }
        else {
            session.setAttribute("resetPasswordMessage", ErrorMessage.RESET_PASSWORD_ERROR);
            session.setAttribute("alertType", "danger");
            resp.sendRedirect("/reset-password");
        }
    }
}
