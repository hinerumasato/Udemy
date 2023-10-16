package com.servlet.Udemy.page;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.utils.PathUtil;

public class AdminPage extends Page {

    public AdminPage(HttpServletRequest req, HttpServletResponse res, String page, String layout)
            throws UnsupportedEncodingException {
        super(req, res, page, layout);
    }

    @Override
    public void render() throws IOException {
        try {
            req.setAttribute("contentPage", PathUtil.getAdminPagePath(page));
            RequestDispatcher rd = req.getRequestDispatcher(PathUtil.getAdminLayoutPath(layout));
            rd.forward(req, res);
        } catch(ServletException e) {
            e.printStackTrace();
        }
    }
    
}
