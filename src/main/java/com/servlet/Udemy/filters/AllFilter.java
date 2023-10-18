package com.servlet.Udemy.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.context.AppContext;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.utils.FileUtil;
import com.servlet.Udemy.utils.NumberUtil;
import com.servlet.Udemy.utils.StringUtil;

@WebFilter(urlPatterns = "*")
public class AllFilter implements Filter {

    private HttpServletRequest request;
    private HttpServletResponse response;

    @Override
    public void destroy() {

    }

    private boolean isVerifyEmailUrl() {
        return request.getRequestURI().equals("/verify/email");
    }

    private boolean isVerifyProcessUrl() {
        return request.getRequestURI().contains("/verify/email/process");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {

        this.request = (HttpServletRequest) req;
        this.response = (HttpServletResponse) resp;

        HttpSession session = request.getSession();

        AppContext appContext = AppContext.getInstance();
        appContext.setAppRealPath(req.getServletContext().getRealPath("/"));
        req.setAttribute("randomNumber", NumberUtil.random());

        String url = FileUtil.getAppProperties().getProperty("APP_URL") + request.getRequestURI();

        if (StringUtil.isStaticUrl(url)) {
            chain.doFilter(req, resp);
            return;
        }

        if (isVerifyProcessUrl()) {
            chain.doFilter(req, resp);
            return;
        }

        UserModel loginUser = (UserModel) session.getAttribute("loginUser");

        if (isVerifyEmailUrl()) {
            if (loginUser != null) {
                if (loginUser.isEmailVerified()) {
                    response.sendRedirect("/home");
                    return;
                } else {
                    chain.doFilter(req, resp);
                    return;
                }

            } else {
                response.sendRedirect("/home");
                return;
            }

        }

        if (loginUser != null) {
            req.setAttribute("loginUser", loginUser);

            if (request.getRequestURI().equals("/auth/logout")) {
                chain.doFilter(req, resp);
                return;
            }

            if (!loginUser.isEmailVerified()) {
                response.sendRedirect("/verify/email");
            } else {
                chain.doFilter(req, resp);
            }
        } else {
            chain.doFilter(req, resp);
        }
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {

    }

}
