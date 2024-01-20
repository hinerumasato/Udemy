package com.servlet.Udemy.controllers.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

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
        String createdDate = req.getParameter("createdDate");
        boolean isSpecialNews = req.getParameter("is_special_news") == null ? false : true;
        String content = req.getParameter("content");

        String fileName = "default.png";
        Part imagePart = req.getPart("image");

        String location = "/static/imgs/teachers";

        if (imagePart != null && imagePart.getSize() > 0 && imagePart.getSubmittedFileName() != null) {
            fileName = imagePart.getSubmittedFileName();
            String realPath = req.getServletContext().getRealPath(location);
            imagePart.write(realPath + File.separator + fileName);
        }

        NewsModel newsModel = new NewsModel();
        String slug = StringUtil.generateSlug(title);
        newsModel.setTitle(title);
        newsModel.setAuthor(author);
        newsModel.setCreatedDate(createdDate);
        newsModel.setSpecialNews(isSpecialNews);
        newsModel.setContent(content);
        newsModel.setImgURL(location + "/" + fileName);
        newsModel.setSlug(slug);

        newsService.insert(newsModel);

        req.getSession().setAttribute("message", SuccessMessage.ADD_NEW_NEWS_SUCCESS);
        resp.sendRedirect("/admin/news/add-news");
    }
}
