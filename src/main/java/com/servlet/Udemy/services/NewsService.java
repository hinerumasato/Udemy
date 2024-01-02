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
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findFirst'");
    }

    @Override
    public void insert(NewsModel model) {
        newsDAO.insert(model);
    }

    @Override
    public void update(NewsModel model) {
        newsDAO.update(model);
    }

    @Override
    public void delete(int id) {
        newsDAO.delete(id);
    }

    @Override
    public List<NewsModel> findByMap(Map<String, String> findMap) {
        return newsDAO.findByMap(findMap);
    }

    @Override
    public IService<NewsModel> paginate(int page, int limit) {
        return newsDAO.paginate(this, page, limit);
    }

}
