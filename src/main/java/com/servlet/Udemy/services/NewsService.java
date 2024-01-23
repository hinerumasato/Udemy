package com.servlet.Udemy.services;

import java.util.List;
import java.util.Map;

import com.servlet.Udemy.DAO.NewsDAO;
import com.servlet.Udemy.models.NewsModel;

public class NewsService implements IService<NewsModel> {

    private NewsDAO newsDAO = new NewsDAO("news");

    @Override
    public List<NewsModel> findAll() {
        return newsDAO.findAll();
    }

    @Override
    public NewsModel findById(int id) {
        return newsDAO.findById(id);
    }

    @Override
    public NewsModel findLast() {
        return newsDAO.findLast();
    }

    @Override
    public NewsModel findFirst() {
        return newsDAO.findFirst();
    }

    @Override
    public boolean insert(NewsModel model) {
        return newsDAO.insert(model);
    }

    @Override
    public boolean update(NewsModel model) {
        return newsDAO.update(model);
    }

    @Override
    public boolean delete(int id) {
        return newsDAO.delete(id);
    }

    @Override
    public List<NewsModel> findByMap(Map<String, String> findMap) {
        return newsDAO.findByMap(findMap);
    }

    @Override
    public IService<NewsModel> paginate(int page, int limit) {
        return newsDAO.paginate(this, page, limit);
    }

    public NewsModel findBySlug(String slug) {
        return newsDAO.findBySlug(slug);
    }

    public List<NewsModel> findAllActive(){
        return newsDAO.findAllActive();
    }
}
