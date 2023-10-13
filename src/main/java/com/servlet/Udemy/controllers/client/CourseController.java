package com.servlet.Udemy.controllers.client;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.models.CategoryModel;
import com.servlet.Udemy.models.LevelModel;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CategoryService;
import com.servlet.Udemy.services.CourseService;
import com.servlet.Udemy.services.LevelService;

@WebServlet("/courses")
public class CourseController extends HttpServlet {

    private CourseService courseService = new CourseService();
    private CategoryService categoryService = new CategoryService();
    private LevelService levelService = new LevelService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Page page = new Page(req, resp, "course.jsp", "master.jsp");

        List<LevelModel> levels = levelService.findAll();
        List<CategoryModel> categories = categoryService.findAll();
        Map<Integer, LevelModel> levelIDToModelMap = new HashMap<Integer, LevelModel>();
        Map<Integer, CategoryModel> categoryIDToModelMap = new HashMap<Integer, CategoryModel>();

        for (LevelModel levelModel : levels)
            levelIDToModelMap.put(levelModel.getId(), levelModel);

        for (CategoryModel categoryModel : categories)
            categoryIDToModelMap.put(categoryModel.getId(), categoryModel);

        page.setObject("title", "Khoá học");
        page.setObject("categories", categoryService.findAll());
        page.setObject("courses", courseService.findAll());
        page.setObject("levelMap", levelIDToModelMap);
        page.setObject("categoryMap", categoryIDToModelMap);
        page.render();
    }
    
}
