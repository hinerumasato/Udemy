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

@WebFilter(urlPatterns = {"/checkout", "/account", "/account/*"})
public class AuthFilter implements Filter {

    @Override
    public void destroy() {
        
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();

        String requestURI = request.getRequestURI();
        if(session.getAttribute("loginUser") == null) {
            switch (requestURI) {
                case "/checkout":
                    response.sendRedirect("/home");
                    break;
                case "/account":
                    response.sendRedirect("/login");
                    break;
                default:
                    response.sendRedirect("/login");
                    break;
            }
        }
        else chain.doFilter(req, resp);
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        
    }
    
}
