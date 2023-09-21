package com.servlet.Udemy.page;

import com.servlet.Udemy.utils.PathUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class Page {

    private HttpServletRequest req;
    private HttpServletResponse res;
    private String page;
    private String layout;

    public Page(HttpServletRequest req, HttpServletResponse res, String page, String layout) throws UnsupportedEncodingException {
        this.req = req;
        this.res = res;
        this.page = page;
        this.layout = layout;

        this.req.setCharacterEncoding("UTF-8");
    }

    public HttpServletRequest getReq() {
        return req;
    }

    public void setReq(HttpServletRequest req) {
        this.req = req;
    }

    public HttpServletResponse getRes() {
        return res;
    }

    public void setRes(HttpServletResponse res) {
        this.res = res;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public String getLayout() {
        return layout;
    }

    public void setLayout(String layout) {
        this.layout = layout;
    }

    public void render() throws ServletException, IOException {
        req.setAttribute("contentPage", PathUtil.getClientPagePath(page));
        RequestDispatcher rd = req.getRequestDispatcher(PathUtil.getClientLayoutPath(layout));
        rd.forward(req, res);
    }
}
