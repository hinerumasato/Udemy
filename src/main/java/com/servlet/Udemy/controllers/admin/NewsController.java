package com.servlet.Udemy.controllers.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.constants.ErrorMessage;
import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.models.NewsModel;
import com.servlet.Udemy.page.AdminPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.NewsService;

@WebServlet("/admin/news")
public class NewsController extends HttpServlet {
    private NewsService newsService = new NewsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Page page = new AdminPage(req, resp, "news.jsp", "master.jsp");

        List<NewsModel> news = newsService.findAll();

        page.setObject("title", "Tất cả tin tức");
        page.setObject("news", news);
        page.render();

        session.removeAttribute("updateNewsMessage");
        session.removeAttribute("alertType");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("_method");
        switch (method) {
            case "DELETE":
                doDelete(req, resp);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        int newsId = Integer.parseInt(req.getParameter("news-id"));
        boolean isDelete = newsService.delete(newsId);
        if (isDelete) {
            session.setAttribute("updateNewsMessage", SuccessMessage.DELETE_CATEGORY_SUCCESS);
            session.setAttribute("alertType", "success");
        } else {
            session.setAttribute("updateNewsMessage", ErrorMessage.DELETE_CATEGORY_ERROR);
            session.setAttribute("alertType", "danger");
        }

        resp.sendRedirect("/admin/news");
    }
}
