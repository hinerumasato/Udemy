package com.servlet.Udemy.services;

import java.util.List;
import java.util.Map;

import com.servlet.Udemy.DAO.ReviewDAO;
import com.servlet.Udemy.models.ReviewModel;

public class ReviewService implements IService<ReviewModel> {

    private ReviewDAO reviewDAO = new ReviewDAO("reviews");

    @Override
    public List<ReviewModel> findAll() {
        return reviewDAO.findAll();
    }

    @Override
    public ReviewModel findById(int id) {
        return reviewDAO.findById(id);
    }

    @Override
    public ReviewModel findLast() {
        return reviewDAO.findLast();
    }

    @Override
    public ReviewModel findFirst() {
        return reviewDAO.findFirst();
    }

    @Override
    public List<ReviewModel> findByMap(Map<String, String> findMap) {
        return reviewDAO.findByMap(findMap);
    }

    @Override
    public boolean insert(ReviewModel model) {
        return reviewDAO.insert(model);
    }

    @Override
    public boolean update(ReviewModel model) {
        return reviewDAO.update(model);
    }

    @Override
    public boolean delete(int id) {
        return reviewDAO.delete(id);
    }

    @Override
    public IService<ReviewModel> paginate(int page, int limit) {
        return reviewDAO.paginate(this, page, limit);
    }
    
}
