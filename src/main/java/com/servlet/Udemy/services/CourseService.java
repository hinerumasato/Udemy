package com.servlet.Udemy.services;

import java.util.List;

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
}
