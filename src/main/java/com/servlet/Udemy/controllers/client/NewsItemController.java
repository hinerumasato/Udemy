package com.servlet.Udemy.controllers.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.models.NewsModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.NewsService;

@WebServlet("/news-item")
public class NewsItemController extends HttpServlet {
    private NewsService newsService = new NewsService() ;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Page page = new ClientPage(req, resp, "news-item.jsp", "master.jsp");
        int itemId = Integer.parseInt(req.getParameter("item-id"));
        NewsModel newsModel = newsService.findById(itemId);

        page.setObject("title", "Tin tức");
        page.setObject("item", newsModel);
        page.render();
    }
}
