package com.servlet.Udemy.controllers.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.models.NewsModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.NewsService;

@WebServlet("/news/details/*")
public class NewsItemController extends HttpServlet {
    private NewsService newsService = new NewsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String slug = req.getPathInfo().substring(1);
        if (slug.isEmpty() || slug.isBlank())
            resp.sendError(404, "Not found");
        else {
            NewsModel newsModel = newsService.findBySlug(slug);
            if (newsModel != null) {
                List<NewsModel> news = newsService.findAll();
                List<NewsModel> specialNews = new ArrayList<NewsModel>();

                for (int i = news.size() - 1; i >= 0; i--) {
                    int count = 0;
                    if (news.get(i).isSpecialNews()) {
                        specialNews.add(news.get(i));
                        count++;
                    }
                    if (count == 4)
                        break;
                }
                Page page = new ClientPage(req, resp, "news-item.jsp", "master.jsp");
                page.setObject("title", newsModel.getTitle());
                page.setObject("newsItem", newsModel);
                page.setObject("specialNews", specialNews);
                page.render();
            } else {
                resp.sendError(404, "Not found");
            }
        }
    }
}
