package com.servlet.Udemy.services;

import java.util.List;
import java.util.Map;

import com.servlet.Udemy.DAO.CourseLoveDAO;
import com.servlet.Udemy.models.CourseLoveModel;

public class CourseLoveService implements IService<CourseLoveModel> {

    private CourseLoveDAO courseLoveDAO = new CourseLoveDAO("courses_loves");

    @Override
    public List<CourseLoveModel> findAll() {
        return courseLoveDAO.findAll();
    }

    @Override
    public CourseLoveModel findById(int id) {
        return courseLoveDAO.findById(id);
    }

    @Override
    public CourseLoveModel findLast() {
        return courseLoveDAO.findLast();
    }

    @Override
    public CourseLoveModel findFirst() {
        return courseLoveDAO.findFirst();
    }

    @Override
    public List<CourseLoveModel> findByMap(Map<String, String> findMap) {
        return courseLoveDAO.findByMap(findMap);
    }

    @Override
    public boolean insert(CourseLoveModel model) {
        return courseLoveDAO.insert(model);
    }

    @Override
    public boolean update(CourseLoveModel model) {
        return courseLoveDAO.update(model);
    }

    @Override
    public boolean delete(int id) {
        return courseLoveDAO.delete(id);
    }

    @Override
    public IService<CourseLoveModel> paginate(int page, int limit) {
        return courseLoveDAO.paginate(this, page, limit);
    }

    public List<CourseLoveModel> findByUserId(int userId) {
        return courseLoveDAO.findByUserId(userId);
    }

    public boolean deleteByUserIdAndCourseId(int userId, int courseId) {
        return courseLoveDAO.deleteByUserIdAndCourseId(userId, courseId);
    }

    public CourseLoveModel findByUserIdAndCourseId(int userId, int courseId) {
        return courseLoveDAO.findByUserIdAndCourseId(userId, courseId);
    }
    
}
