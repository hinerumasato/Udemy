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
import com.servlet.Udemy.page.AdminPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CategoryService;
import com.servlet.Udemy.services.CourseService;
import com.servlet.Udemy.services.LevelService;
import com.servlet.Udemy.utils.NumberUtil;

@WebServlet("/admin/courses")
public class CourseController extends HttpServlet {

    private CourseService courseService = new CourseService();
    private CategoryService categoryService = new CategoryService();
    private LevelService levelService = new LevelService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Page page = new AdminPage(req, resp, "courses.jsp", "master.jsp");
        int pageNumber;
        int limit = 10;
        if(req.getParameter("page") == null)
            pageNumber = 1;
        else pageNumber = Integer.parseInt(req.getParameter("page"));

        List<CourseModel> allCourses = courseService.findAllActive();
        int totalPages = NumberUtil.getTotalPageFromCollection(allCourses, limit);
        CourseService courseServicePagination = (CourseService) courseService.paginate(pageNumber, limit);
        List<CourseModel> courses = courseServicePagination.findAllActive();
        Map<CourseModel, CategoryModel> categoryMap = new HashMap<CourseModel, CategoryModel>();
        Map<CourseModel, LevelModel> levelMap = new HashMap<CourseModel, LevelModel>();
        if(courses != null) {
            for (CourseModel courseModel : courses) {
                categoryMap.put(courseModel, categoryService.findById(courseModel.getCategoryId()));
                levelMap.put(courseModel, levelService.findById(courseModel.getLevelId()));
            }
        }

        page.setObject("title", "Tất cả khoá học");
        page.setObject("courses", courses);
        page.setObject("categoryMap", categoryMap);
        page.setObject("levelMap", levelMap);
        page.setObject("totalPages", totalPages);
        page.setObject("currentPage", pageNumber);
        page.render();

        req.getSession().removeAttribute("updateProductMessage");
    }
}
