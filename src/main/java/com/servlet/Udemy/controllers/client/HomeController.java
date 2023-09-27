/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.Udemy.controllers.client;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.context.AppContext;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.UserService;
import com.servlet.Udemy.utils.NumberUtil;

/**
 *
 * @author Masato
 */

@WebServlet("/home")
public class HomeController extends HttpServlet{

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServletContext servletContext = req.getServletContext();
        AppContext appContext = AppContext.getInstance();
        appContext.setAppRealPath(servletContext.getRealPath("/"));

        Page page = new Page(req, resp, "home.jsp", "master.jsp");
        page.setObject("randomNumber", NumberUtil.random());
        page.setObject("users", userService.findAll());
        page.render();
    }
}
