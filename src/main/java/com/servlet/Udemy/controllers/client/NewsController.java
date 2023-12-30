/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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

/**
 *
 * @author Moc Lan
 */

@WebServlet("/news")
public class NewsController extends HttpServlet {
    private NewsService newsService = new NewsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Page page = new ClientPage(req, resp, "news.jsp", "master.jsp");

        List<NewsModel> news = newsService.findAll();
        List<NewsModel> specialNews = new ArrayList<NewsModel>();
        for (NewsModel newsModel : news) {
            if(newsModel.isSpecialNews()){
                specialNews.add(newsModel);
            }
        }
        page.setObject("title", "Tin tức");
        page.setObject("list_news", news);
        page.setObject("special_news", specialNews);
        page.render();
    }
}
