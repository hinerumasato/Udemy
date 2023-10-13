package com.servlet.Udemy.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import com.servlet.Udemy.context.AppContext;
import com.servlet.Udemy.utils.NumberUtil;

@WebFilter(urlPatterns = "*")
public class AllFilter implements Filter {

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        AppContext appContext = AppContext.getInstance();
        appContext.setAppRealPath(req.getServletContext().getRealPath("/"));
        req.setAttribute("randomNumber", NumberUtil.random());
        chain.doFilter(req, resp);
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        
    }
    
}
