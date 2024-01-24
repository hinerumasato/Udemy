package com.servlet.Udemy.controllers.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.models.CourseModel;
import com.servlet.Udemy.models.ThumbnailModel;
import com.servlet.Udemy.services.CourseService;
import com.servlet.Udemy.services.ThumbnailService;

@WebServlet("/admin/courses/delete")
public class HardDeleteCourseController extends HttpServlet {

    private CourseService courseService = new CourseService();
    private ThumbnailService thumbnailService = new ThumbnailService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doDelete(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(req.getParameter("id"));
        CourseModel courseModel = courseService.findById(id);
        for (ThumbnailModel thumbnailModel : courseModel.getThumbnails()) {
            thumbnailService.delete(thumbnailModel.getId());
        }
        courseService.delete(id);
        resp.sendRedirect("/admin/courses/trash");
    }
}
