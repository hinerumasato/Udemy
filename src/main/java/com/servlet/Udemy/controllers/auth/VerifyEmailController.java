package com.servlet.Udemy.controllers.auth;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.mail.Mail;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.models.VerifyEmailModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.VerifyEmailService;
import com.servlet.Udemy.utils.FileUtil;
import com.servlet.Udemy.utils.StringUtil;

@WebServlet("/verify/email")
public class VerifyEmailController extends HttpServlet {

    private VerifyEmailService verifyEmailService = new VerifyEmailService();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserModel loginUser = (UserModel) session.getAttribute("loginUser");
        Properties props = FileUtil.getAppProperties();
        Page page = new ClientPage(req, resp, "email.jsp", "verify.jsp");
        page.setObject("loginUser", loginUser);
        page.render();

        VerifyEmailModel verifyEmailModel = new VerifyEmailModel();
        verifyEmailModel.setRememberToken(StringUtil.encrypt(Integer.toString(loginUser.getId())));
        verifyEmailModel.setUserId(loginUser.getId());

        boolean isFirstMail = false;
        if(verifyEmailService.findByUserId(loginUser.getId()) == null) {
            verifyEmailService.insert(verifyEmailModel);
            isFirstMail = true;
        }
        else verifyEmailService.update(verifyEmailModel);


        if(isFirstMail) {
            Map<String, String> map = new HashMap<String, String>();
            map.put("APP_URL", props.getProperty("APP_URL"));
            map.put("rememberToken", verifyEmailModel.getRememberToken());
    
            Mail mail = new Mail("verify-mail.jsp", map);
    
            String mailAddress = FileUtil.getAppProperties().getProperty("mail.smtp.address");
            mail.sendMail(mailAddress, loginUser.getUsername(), "Xác thực Email", "Xin vui lòng đọc và xác thực email trong nội dung");
        }
    }
}
