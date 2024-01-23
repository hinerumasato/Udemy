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
    public boolean insert(CourseModel model) {
        return courseDAO.insert(model);
    }

    public CourseModel findLast() {
        return courseDAO.findLast();
    }

    public List<CourseModel> findByCategoryCode(String code) {
        return courseDAO.findByCategoryCode(code);
    }

    public List<CourseModel> findAllNewCourse() {
        return courseDAO.findAllNewCourse();
    }

    public List<CourseModel> findByMap(Map<String, String> conditionMap) {
        return courseDAO.findByMap(conditionMap);
    }

    @Override
    public boolean update(CourseModel model) {
        return courseDAO.update(model);
    }

    @Override
    public boolean delete(int id) {
        return courseDAO.delete(id);
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

    public void softDeleteAll(List<Integer> ids) {
        courseDAO.softDeleteAll(ids);
    }

    public void restore(int id) {
        courseDAO.restore(id);
    }

    public void restoreAll(List<Integer> ids) {
        courseDAO.restoreAll(ids);
    }

    public CourseModel findBySlug(String slug) {
        return courseDAO.findBySlug(slug);
    }

    public List<CourseModel> findByCategoryId(int categoryId) {
        return courseDAO.findByCategoryId(categoryId);
    }
}
