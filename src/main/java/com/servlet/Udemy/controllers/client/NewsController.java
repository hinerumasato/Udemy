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
        List<NewsModel> newsModel = newsService.findAll();
        List<NewsModel> specialNews = new ArrayList<NewsModel>();
        if (newsModel != null) {
            for (int i = newsModel.size() - 1; i >= 0; i--) {
                int count = 0;
                if (newsModel.get(i).isSpecialNews()) {
                    specialNews.add(newsModel.get(i));
                    count++;
                }
                if (count == 4)
                    break;
            }
        }
        page.setObject("title", "Tin tức");
        page.setObject("listNews", newsModel);
        page.setObject("specialNews", specialNews);
        page.render();
    }
}
