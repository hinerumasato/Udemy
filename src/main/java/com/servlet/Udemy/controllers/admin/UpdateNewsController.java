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
import com.servlet.Udemy.utils.FileUtil;
import com.servlet.Udemy.utils.StringUtil;

@WebServlet("/admin/news/update")
@MultipartConfig(maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500)
public class UpdateNewsController extends HttpServlet {
    private NewsService newsService = new NewsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        NewsModel news = newsService.findById(id);
        Page page = new AdminPage(req, resp, "update-news.jsp", "master.jsp");
        page.setObject("title", "Cập nhật tin tức");
        page.setObject("news", news);
        page.render();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        doPut(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        int newsId = Integer.parseInt(req.getParameter("id"));
        String newsTitle = req.getParameter("title");
        String newsAuthor = req.getParameter("author");
        String createdDate = req.getParameter("created_date");
        boolean isSpecialNews = req.getParameter("is_special_news") == null ? false : true;
        String content = req.getParameter("content");
        Part imgPart = req.getPart("image");
        String uuidFile = "";

        if (imgPart != null && imgPart.getSize() > 0 && imgPart.getSubmittedFileName() != null) {
            String filePath = imgPart.getSubmittedFileName();
            String fileName = FileUtil.getUUIDFileName(filePath);
            uuidFile = fileName;
            String realPath = req.getServletContext().getRealPath("/static/imgs/news");
            imgPart.write(realPath + File.separator + uuidFile);
        }

        NewsModel newsModel = newsService.findById(newsId);
        String oldImg = newsModel.getImgURL();
        deleteImg(oldImg, req.getServletContext().getRealPath("/"));

        newsModel.setTitle(newsTitle);
        newsModel.setAuthor(newsAuthor);
        newsModel.setCreatedDate(createdDate);
        newsModel.setImgURL("/static/imgs/news/" + uuidFile);
        newsModel.setContent(content);
        newsModel.setSpecialNews(isSpecialNews);
        newsModel.setSlug(StringUtil.generateSlug(newsTitle));

        boolean isUpdate = newsService.update(newsModel);
        if (isUpdate) {
            session.setAttribute("updateNewsMessage", SuccessMessage.UPDATE_NEWS_SUCCESS);
            session.setAttribute("alertType", "success");
        }

        resp.sendRedirect("/admin/news");
    }

    private void deleteImg(String link, String realPath) {
        if (link != null && !link.isEmpty()) {
            File file = new File(realPath + link);
            if (file.exists()) {
                file.delete();
            }
        }
    }
}
