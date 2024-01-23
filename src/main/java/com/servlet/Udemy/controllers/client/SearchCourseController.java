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
import javax.servlet.http.HttpSession;

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

@WebServlet("/courses/search")
public class SearchCourseController extends HttpServlet {

    private CourseService courseService = new CourseService();
    private CategoryService categoryService = new CategoryService();
    private LevelService levelService = new LevelService();
    private TeacherService teacherService = new TeacherService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        
        String search = req.getParameter("search");
        List<CourseModel> courses = courseService.searchByName(search);
        Map<CourseModel, CategoryModel> categoryMap = new HashMap<>();
        Map<CourseModel, LevelModel> levelMap = new HashMap<>();
        Map<CourseModel, TeacherModel> teacherMap = new HashMap<>();

        if(courses != null) {
            for (CourseModel course : courses) {
                categoryMap.put(course, categoryService.findById(course.getCategoryId()));
                levelMap.put(course, levelService.findById(course.getLevelId()));
                teacherMap.put(course, teacherService.findById(course.getTeacherId()));
            }
        }

        session.setAttribute("courseMaxWidthMessage", "Có " + courses.size() + " Kết quả tìm kiếm cho từ khoá: " + search);

        Page page = new ClientPage(req, resp, "course-max-width.jsp", "master.jsp");
        page.setObject("title", "Tìm kiếm khoá học");
        page.setObject("courses", courses);
        page.setObject("categoryMap", categoryMap);
        page.setObject("levelMap", levelMap);
        page.setObject("teacherMap", teacherMap);
        page.render();

        session.removeAttribute("courseMaxWidthMessage");
    }
}
