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
import com.servlet.Udemy.models.TeacherModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CategoryService;
import com.servlet.Udemy.services.CourseService;
import com.servlet.Udemy.services.LevelService;
import com.servlet.Udemy.services.TeacherService;

@WebServlet("/courses")
public class CourseController extends HttpServlet {

    private CourseService courseService = new CourseService();
    private CategoryService categoryService = new CategoryService();
    private LevelService levelService = new LevelService();
    private TeacherService teacherService = new TeacherService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Page page = new ClientPage(req, resp, "course.jsp", "master.jsp");

        List<LevelModel> levels = levelService.findAll();
        List<CategoryModel> categories = categoryService.findAll();
        List<TeacherModel> teachers = teacherService.findAll();
        Map<Integer, LevelModel> levelIDToModelMap = new HashMap<Integer, LevelModel>();
        Map<Integer, CategoryModel> categoryIDToModelMap = new HashMap<Integer, CategoryModel>();
        Map<Integer, TeacherModel> teacherIDToModelMap = new HashMap<Integer, TeacherModel>();

        for (LevelModel levelModel : levels)
            levelIDToModelMap.put(levelModel.getId(), levelModel);

        for (CategoryModel categoryModel : categories)
            categoryIDToModelMap.put(categoryModel.getId(), categoryModel);

        for (TeacherModel teacherModel : teachers)
            teacherIDToModelMap.put(teacherModel.getId(), teacherModel);

        HashMap<Integer, String> priceMap = new HashMap<Integer, String>();
        HashMap<Integer, String> priceValueMap = new HashMap<Integer, String>();

        priceMap.put(0, "Giá dưới 100.000đ");
        priceMap.put(1, "100.000đ - 200.000đ");
        priceMap.put(2, "200.000đ - 300.000đ");
        priceMap.put(3, "300.000đ - 500.000đ");
        priceMap.put(4, "500.000đ - 1.000.000đ");
        priceMap.put(5, "Giá trên 1.000.000đ");

        priceValueMap.put(0, "<=100000");
        priceValueMap.put(1, "BETWEEN 100000 AND 200000");
        priceValueMap.put(2, "BETWEEN 200000 AND 300000");
        priceValueMap.put(3, "BETWEEN 300000 AND 500000");
        priceValueMap.put(4, "BETWEEN 500000 AND 1000000");
        priceValueMap.put(5, ">=1000000");

        page.setObject("title", "Khoá học");
        page.setObject("categories", categories);
        page.setObject("levels", levels);
        page.setObject("courses", courseService.findAll());
        page.setObject("levelMap", levelIDToModelMap);
        page.setObject("categoryMap", categoryIDToModelMap);
        page.setObject("teacherMap", teacherIDToModelMap);
        page.setObject("priceMap", priceMap);
        page.setObject("priceValueMap", priceValueMap);
        page.render();
    }

}
