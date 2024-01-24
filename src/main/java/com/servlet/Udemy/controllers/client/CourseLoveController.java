package com.servlet.Udemy.controllers.client;

import java.io.IOException;
import java.util.ArrayList;
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
import com.servlet.Udemy.models.CourseLoveModel;
import com.servlet.Udemy.models.CourseModel;
import com.servlet.Udemy.models.LevelModel;
import com.servlet.Udemy.models.TeacherModel;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CategoryService;
import com.servlet.Udemy.services.CourseLoveService;
import com.servlet.Udemy.services.CourseService;
import com.servlet.Udemy.services.LevelService;
import com.servlet.Udemy.services.TeacherService;

@WebServlet("/courses/love")
public class CourseLoveController extends HttpServlet {

    private CourseService courseService = new CourseService();
    private CategoryService categoryService = new CategoryService();
    private LevelService levelService = new LevelService();
    private TeacherService teacherService = new TeacherService();
    private CourseLoveService courseLoveService = new CourseLoveService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserModel loginUser = (UserModel) session.getAttribute("loginUser");
        List<CourseLoveModel> courseLoveModels = courseLoveService.findByUserId(loginUser.getId());
        Map<CourseModel, CategoryModel> categoryMap = new HashMap<>();
        Map<CourseModel, LevelModel> levelMap = new HashMap<>();
        Map<CourseModel, TeacherModel> teacherMap = new HashMap<>();
        List<CourseModel> courses = new ArrayList<>();
        if(courseLoveModels != null) {
            for (CourseLoveModel courseLoveModel : courseLoveModels) {
                CourseModel courseModel = courseService.findById(courseLoveModel.getCourseId());
                if(courseModel != null) {
                    courses.add(courseModel);
                    categoryMap.put(courseModel, categoryService.findById(courseModel.getCategoryId()));
                    levelMap.put(courseModel, levelService.findById(courseModel.getLevelId()));
                    teacherMap.put(courseModel, teacherService.findById(courseModel.getTeacherId()));
                }
            }
        }

        if(courses == null || courses.size() == 0)
            session.setAttribute("courseMaxWidthMessage", "Bạn chưa thêm khoá học yêu thích nào");

        Page page = new ClientPage(req, resp, "course-max-width.jsp", "master.jsp");
        page.setObject("title", "Khoá học yêu thích");
        page.setObject("courses", courses);
        page.setObject("categoryMap", categoryMap);
        page.setObject("levelMap", levelMap);
        page.setObject("teacherMap", teacherMap);
        page.render();

        session.removeAttribute("courseMaxWidthMessage");
    }
}
