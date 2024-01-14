package com.servlet.Udemy.controllers.admin;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.models.NewsModel;
import com.servlet.Udemy.page.AdminPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.NewsService;
import com.servlet.Udemy.utils.StringUtil;

@WebServlet("/admin/news/add-news")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10)
public class AddNewsController extends HttpServlet {
    private NewsService newsService = new NewsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Page page = new AdminPage(req, resp, "add-news.jsp", "master.jsp");
        page.setObject("titlle", "Thêm tin tức mới");
        page.setObject("news", newsService.findAll());
        page.setObject("message", session.getAttribute("message"));
        page.render();
        session.removeAttribute("message");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String title = req.getParameter("title");
        String author = req.getParameter("author");
        boolean isSpecialNews = req.getParameter("is_special_news") == null ? false : true;
        String content = req.getParameter("content");
        String imgURL = req.getParameter("img_url");

        NewsModel newsModel = new NewsModel();
        String slug = StringUtil.generateSlug(title);
        newsModel.setTitle(title);
        newsModel.setAuthor(author);
        newsModel.setSpecialNews(isSpecialNews);
        newsModel.setContent(content);
        newsModel.setImgURL(imgURL);
        newsModel.setSlug(slug);

        newsService.insert(newsModel);
        NewsModel news = newsService.findLast();

        req.getSession().setAttribute("message", SuccessMessage.ADD_NEW_NEWS_SUCCESS);
        resp.sendRedirect("/admin/news/add-news");
    }
}
