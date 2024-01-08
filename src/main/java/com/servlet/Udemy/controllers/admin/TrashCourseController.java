package com.servlet.Udemy.controllers.admin;

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
import com.servlet.Udemy.models.CourseModel;
import com.servlet.Udemy.models.LevelModel;
import com.servlet.Udemy.models.TeacherModel;
import com.servlet.Udemy.page.AdminPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CategoryService;
import com.servlet.Udemy.services.CourseService;
import com.servlet.Udemy.services.LevelService;
import com.servlet.Udemy.services.TeacherService;

@WebServlet("/admin/courses/trash")
public class TrashCourseController extends HttpServlet {

    private CourseService courseService = new CourseService();
    private CategoryService categoryService = new CategoryService();
    private LevelService levelService = new LevelService();
    private TeacherService teacherService = new TeacherService();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Page page = new AdminPage(req, resp, "course-trash.jsp", "master.jsp");

        List<CourseModel> courses = courseService.findAllActive();
        Map<CourseModel, CategoryModel> categoryMap = new HashMap<CourseModel, CategoryModel>();
        Map<CourseModel, LevelModel> levelMap = new HashMap<CourseModel, LevelModel>();
        Map<CourseModel, TeacherModel> teacherMap = new HashMap<CourseModel, TeacherModel>();

        for (CourseModel course : courses) {
            categoryMap.put(course, categoryService.findById(course.getCategoryId()));
            levelMap.put(course, levelService.findById(course.getLevelId()));
            teacherMap.put(course, teacherService.findById(course.getTeacherId()));
        }

        page.setObject("title", "Khoá học đã xoá");
        page.setObject("courses", courses);
        page.setObject("categoryMap", categoryMap);
        page.setObject("levelMap", levelMap);
        page.setObject("teacherMap", teacherMap);
        page.render();
    }
}
