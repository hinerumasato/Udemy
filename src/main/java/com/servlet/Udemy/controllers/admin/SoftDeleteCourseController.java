package com.servlet.Udemy.controllers.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.services.CourseService;
import com.servlet.Udemy.utils.NumberUtil;

@WebServlet("/admin/courses/soft-delete")
public class SoftDeleteCourseController extends HttpServlet {

    private CourseService courseService = new CourseService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("_method");
        if(method != null) {
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
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String courseIdParam = req.getParameter("id");
        if(courseIdParam != null) {
            // int courseId = Integer.parseInt(courseIdParam);
            List<Integer> ids = NumberUtil.mapToInt(courseIdParam, ",");
            courseService.softDeleteAll(ids);
            resp.sendRedirect("/admin/courses");
            session.setAttribute("updateProductMessage", SuccessMessage.SOFT_DELETE_COURSE_SUCCESS);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doDelete(req, resp);
    }
}
