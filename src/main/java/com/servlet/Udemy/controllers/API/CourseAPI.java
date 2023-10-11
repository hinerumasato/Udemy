package com.servlet.Udemy.controllers.API;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.models.CourseModel;
import com.servlet.Udemy.models.ResponseModel;
import com.servlet.Udemy.services.CourseService;

@WebServlet(urlPatterns = {"/api/v1/courses/*", "/api/v1/courses"})
public class CourseAPI extends HttpServlet {

    private CourseService courseService = new CourseService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        ResponseModel responseModel = new ResponseModel();
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        if(pathInfo == null || pathInfo.equals("/")) {
            resp.getWriter().write(responseModel.response(200, "Find user successfully", courseService.findAll()));
        } else {
            String code = pathInfo.substring(1);
            List<CourseModel> courses = courseService.findByCategoryCode(code);
            if(courses != null)
                resp.getWriter().write(responseModel.response(200, "Find user by " + code + " successfully", courses));
            else resp.getWriter().write(responseModel.response(404, "No user found !!!", null));
        }
    }
}
