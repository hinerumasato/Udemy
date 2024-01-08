package com.servlet.Udemy.controllers.client;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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

@WebServlet("/courses/details/*")
public class CourseDetailsController extends HttpServlet {

    private CourseService courseService = new CourseService();
    private CategoryService categoryService = new CategoryService();
    private LevelService levelService = new LevelService();
    private TeacherService teacherService = new TeacherService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String slug = req.getPathInfo().substring(1);
        if (slug.isEmpty() || slug.isBlank())
            resp.sendError(404, "Not found");
        else {
            CourseModel course = courseService.findBySlug(slug);
            if(course != null) {
                Map<CourseModel, CategoryModel> categoryMap = new HashMap<CourseModel, CategoryModel>();
                Map<CourseModel, LevelModel> levelMap = new HashMap<CourseModel, LevelModel>();
                Map<CourseModel, TeacherModel> teacherMap = new HashMap<CourseModel, TeacherModel>();
                categoryMap.put(course, categoryService.findById(course.getCategoryId()));
                levelMap.put(course, levelService.findById(course.getLevelId()));
                teacherMap.put(course, teacherService.findById(course.getTeacherId()));

                Page page = new ClientPage(req, resp, "course-details.jsp", "master.jsp");
                page.setObject("title", course.getName());
                page.setObject("course", course);
                page.setObject("categoryMap", categoryMap);
                page.setObject("levelMap", levelMap);
                page.setObject("teacherMap", teacherMap);
                page.render();
            } else {
                resp.sendError(404, "Not found");
            }
        }
    }
}
