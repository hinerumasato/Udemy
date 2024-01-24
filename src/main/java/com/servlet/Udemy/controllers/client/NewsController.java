/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.Udemy.controllers.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.DTO.NewsDTO;
import com.servlet.Udemy.mappers.NewsMapper;
import com.servlet.Udemy.models.CategoryModel;
import com.servlet.Udemy.models.NewsModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CategoryService;
import com.servlet.Udemy.services.NewsService;

/**
 *
 * @author Moc Lan
 */

@WebServlet("/news")
public class NewsController extends HttpServlet {
    private NewsService newsService = new NewsService();
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Page page = new ClientPage(req, resp, "news.jsp", "master.jsp");
        List<NewsModel> newsModel = newsService.findAll();
        List<NewsModel> specialNews = new ArrayList<NewsModel>();
        List<CategoryModel> categories = categoryService.findAll();
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
        List<NewsDTO> news = new ArrayList<>();

        if(newsModel != null) {
            news = newsModel.stream().map(item -> NewsMapper.mapToDTO(item)).collect(Collectors.toList());
        }
        page.setObject("title", "Tin tức");
        page.setObject("listNews", news);
        page.setObject("specialNews", specialNews);
        page.setObject("categories", categories);
        page.render();
    }
}
