package com.servlet.Udemy.services;

import java.util.List;

import com.servlet.Udemy.DAO.CourseDAO;
import com.servlet.Udemy.models.CourseModel;

public class CourseService {
    private CourseDAO courseDAO = new CourseDAO("courses");

    public List<CourseModel> findAll() {
        return courseDAO.findAll();
    }
}
