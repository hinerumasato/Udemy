package com.servlet.Udemy.page;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Page {

    protected HttpServletRequest req;
    protected HttpServletResponse res;
    protected String page;
    protected String layout;

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
    
    public void setObject(String key, Object value) {
        this.req.setAttribute(key, value);
    }

    public abstract void render() throws ServletException, IOException;
}
