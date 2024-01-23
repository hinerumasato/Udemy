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
import com.servlet.Udemy.utils.NumberUtil;

@WebServlet("/admin/courses/trash")
public class TrashCourseController extends HttpServlet {

    private CourseService courseService = new CourseService();
    private CategoryService categoryService = new CategoryService();
    private LevelService levelService = new LevelService();
    private TeacherService teacherService = new TeacherService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Page page = new AdminPage(req, resp, "course-trash.jsp", "master.jsp");

        List<CourseModel> courses = courseService.findAllDeleted();
        Map<CourseModel, CategoryModel> categoryMap = new HashMap<CourseModel, CategoryModel>();
        Map<CourseModel, LevelModel> levelMap = new HashMap<CourseModel, LevelModel>();
        Map<CourseModel, TeacherModel> teacherMap = new HashMap<CourseModel, TeacherModel>();

        if (courses != null) {
            for (CourseModel course : courses) {
                categoryMap.put(course, categoryService.findById(course.getCategoryId()));
                levelMap.put(course, levelService.findById(course.getLevelId()));
                teacherMap.put(course, teacherService.findById(course.getTeacherId()));
            }
        }

        page.setObject("title", "Khoá học đã xoá");
        page.setObject("courses", courses);
        page.setObject("categoryMap", categoryMap);
        page.setObject("levelMap", levelMap);
        page.setObject("teacherMap", teacherMap);
        page.render();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String method = req.getParameter("_method");
        switch (method) {
            case "PUT":
                doPut(req, resp);
                break;
            case "DELETE":
                doDelete(req, resp);
                break;
            default:
                break;
        }

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String rawIds = req.getParameter("id");
        List<Integer> ids = NumberUtil.mapToInt(rawIds, ",");
        courseService.restoreAll(ids);
        resp.sendRedirect("/admin/courses/trash");

        // CourseModel course = courseService.findById(id);
        // if(course != null) {
        //     courseService.restore(id);
        //     resp.sendRedirect("/admin/courses/trash");
        // } 
        // else resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Cannot find course");
    }
}
