package com.servlet.Udemy.controllers.admin;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.models.CategoryModel;
import com.servlet.Udemy.models.CourseModel;
import com.servlet.Udemy.models.LevelModel;
import com.servlet.Udemy.models.TeacherModel;
import com.servlet.Udemy.models.ThumbnailModel;
import com.servlet.Udemy.page.AdminPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CategoryService;
import com.servlet.Udemy.services.CourseService;
import com.servlet.Udemy.services.LevelService;
import com.servlet.Udemy.services.TeacherService;
import com.servlet.Udemy.services.ThumbnailService;
import com.servlet.Udemy.utils.StringUtil;

@WebServlet("/admin/courses/update")
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 5,
    maxRequestSize = 1024 * 1025 * 10
)
public class UpdateCourseController extends HttpServlet {

    private CourseService courseService = new CourseService();
    private CategoryService categoryService = new CategoryService();
    private LevelService levelService = new LevelService();
    private TeacherService teacherService = new TeacherService();
    private ThumbnailService thumbnailService = new ThumbnailService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<CourseModel, CategoryModel> categoryMap = new HashMap<CourseModel, CategoryModel>();
        Map<CourseModel, LevelModel> levelMap = new HashMap<CourseModel, LevelModel>();
        Map<CourseModel, TeacherModel> teacherMap = new HashMap<CourseModel, TeacherModel>();

        List<CategoryModel> categories = categoryService.findAll();
        List<LevelModel> levels = levelService.findAll();
        List<TeacherModel> teachers = teacherService.findAll();
        
        int id = Integer.parseInt(req.getParameter("id"));
        CourseModel course = courseService.findById(id);
        categoryMap.put(course, categoryService.findById(course.getCategoryId()));
        levelMap.put(course, levelService.findById(course.getLevelId()));
        teacherMap.put(course, teacherService.findById(course.getTeacherId()));

        List<ThumbnailModel> thumbnails = course.getThumbnails();
        
        Page page = new AdminPage(req, resp, "update-course.jsp", "master.jsp");
        page.setObject("title", "Cập nhật khoá học");
        page.setObject("course", course);
        page.setObject("categoryMap", categoryMap);
        page.setObject("levelMap", levelMap);
        page.setObject("teacherMap", teacherMap);
        page.setObject("categories", categories);
        page.setObject("levels", levels);
        page.setObject("teachers", teachers);
        page.setObject("thumbnails", thumbnails);
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
            default:
                break;
        }
    }
    

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        int courseId = Integer.parseInt(req.getParameter("id"));
        String realPath = req.getServletContext().getRealPath("/");
        CourseModel course = courseService.findById(courseId);
        List<String> deleteLinks = thumbnailService.findAllLinksByCourseId(courseId);
        thumbnailService.deleteByCourseId(course.getId());        
        deleteImgs(deleteLinks, realPath);
        Collection<Part> fileParts = req.getParts();
        for (Part part : fileParts) {
            if(part != null && part.getSize() > 0 && part.getSubmittedFileName() != null) {
                String fileName = part.getSubmittedFileName();
                String location = realPath + "/static/imgs/courses/" + fileName;
                part.write(location);
                ThumbnailModel thumbnailModel = new ThumbnailModel();
                thumbnailModel.setImg("/static/imgs/courses/" + fileName);
                thumbnailModel.setCourseId(courseId);
                thumbnailService.insert(thumbnailModel);
            }
        }

        String name = StringUtil.htmlEscape(req.getParameter("name"));
        String description = req.getParameter("description");
        double oldPrice = Double.parseDouble(req.getParameter("old_price"));
        double salePrice = Double.parseDouble(req.getParameter("sale_price"));
        int categoryId = Integer.parseInt(req.getParameter("category_id"));
        int levelId = Integer.parseInt(req.getParameter("level_id"));
        int teacherId = Integer.parseInt(req.getParameter("teacher_id"));
        boolean isNewCourse = req.getParameter("is_new_course") == null ? false : true;
        boolean isPopularCourse = req.getParameter("is_popular_course") == null ? false : true;

        course.setName(name);
        course.setDescription(description);
        course.setPrice(oldPrice);
        course.setSalePrice(salePrice);
        course.setCategoryId(categoryId);
        course.setLevelId(levelId);
        course.setTeacherId(teacherId);
        course.setNewCourse(isNewCourse);
        course.setPopularCourse(isPopularCourse);
        course.setSlug(StringUtil.generateSlug(course.getName()));

        courseService.update(course);

        req.getSession().setAttribute("updateProductMessage", SuccessMessage.UPDATE_COURSE_SUCCESS);
        resp.sendRedirect("/admin/courses");
    }

    private void deleteImgs(List<String> links, String realPath) {
        if(links != null) {
            for (String link : links) {
                String path = realPath + "/" + link;
                File file = new File(path);
                if(file.exists())
                    file.delete();
            }
        }
    }
}
