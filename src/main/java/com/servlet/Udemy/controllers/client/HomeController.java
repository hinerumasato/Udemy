/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.Udemy.controllers.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.models.CategoryModel;
import com.servlet.Udemy.models.CourseModel;
import com.servlet.Udemy.models.LevelModel;
import com.servlet.Udemy.models.TeacherModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CategoryService;
import com.servlet.Udemy.services.CourseService;
import com.servlet.Udemy.services.LevelService;
import com.servlet.Udemy.services.TeacherService;

/**
 *
 * @author Masato
 */

@WebServlet("/home")
public class HomeController extends HttpServlet{
    
    private CategoryService categoryService = new CategoryService();
    private CourseService courseService = new CourseService();
    private LevelService levelService = new LevelService();
    private TeacherService teacherService = new TeacherService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Page page = new ClientPage(req, resp, "home.jsp", "master.jsp");
        List<CourseModel> courses = courseService.findAll();
        List<TeacherModel> teachers = new ArrayList<TeacherModel>();
        List<LevelModel> levels  = new ArrayList<LevelModel>();
        List<CategoryModel> courseCategories = new ArrayList<CategoryModel>();
        for (CourseModel course : courses) {
            levels.add(levelService.findById(course.getLevelId()));
            courseCategories.add(categoryService.findById(course.getCategoryId()));
            teachers.add(teacherService.findById(course.getTeacherId()));
        }

        page.setObject("categories", categoryService.findAll());
        page.setObject("courses", courses);
        page.setObject("levels", levels);
        page.setObject("teachers", teachers);
        page.setObject("courseCategories", courseCategories);
        page.setObject("title", "Trang chủ");
        
        page.render();
    }
}
