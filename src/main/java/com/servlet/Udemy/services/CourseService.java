package com.servlet.Udemy.services;

import java.util.List;
import java.util.Map;

import com.servlet.Udemy.DAO.CourseDAO;
import com.servlet.Udemy.models.CourseModel;

public class CourseService implements IService<CourseModel> {
    private CourseDAO courseDAO = new CourseDAO("courses");

    @Override
    public List<CourseModel> findAll() {
        return courseDAO.findAll();
    }

    public List<CourseModel> findAllActive() {
        return courseDAO.findAllActive();
    }

    public List<CourseModel> findAllDeleted() {
        return courseDAO.findAllDeleted();
    }

    @Override
    public CourseModel findById(int id) {
        return courseDAO.findById(id);
    }

    @Override
    public void insert(CourseModel model) {
        courseDAO.insert(model);
    }

    public CourseModel findLast() {
        return courseDAO.findLast();
    }

    public List<CourseModel> findByCategoryCode(String code) {
        return courseDAO.findByCategoryCode(code);
    }

    public List<CourseModel> findByMap(Map<String, String> conditionMap) {
        return courseDAO.findByMap(conditionMap);
    }

    @Override
    public void update(CourseModel model) {
        courseDAO.update(model);
    }

    @Override
    public void delete(int id) {
        courseDAO.delete(id);
    }

    @Override
    public CourseModel findFirst() {
        return courseDAO.findFirst();
    }

    @Override
    public IService<CourseModel> paginate(int page, int limit) {
        return courseDAO.paginate(this, page, limit);
    }

    public void softDelete(int id) {
        courseDAO.softDelete(id);
    }

    public void restore(int id) {
        courseDAO.restore(id);
    }

    public CourseModel findBySlug(String slug) {
        return courseDAO.findBySlug(slug);
    }
}
