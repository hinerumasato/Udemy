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
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findFirst'");
    }
}
