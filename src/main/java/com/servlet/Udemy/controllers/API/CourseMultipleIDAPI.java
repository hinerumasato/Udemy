package com.servlet.Udemy.controllers.API;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.models.CourseModel;
import com.servlet.Udemy.models.ResponseModel;
import com.servlet.Udemy.services.CourseService;

@WebServlet("/api/v1/courses/multiple")
public class CourseMultipleIDAPI extends HttpServlet {

    private CourseService courseService = new CourseService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        String idsString = req.getParameter("ids");
        String[] idsSplit = idsString.split(",");
        List<Integer> ids = new ArrayList<>();
        for(String idItem : idsSplit)
            ids.add(Integer.parseInt(idItem));
        List<CourseModel> courses = courseService.findByIds(ids);
        ResponseModel responseModel = new ResponseModel();
        PrintWriter out = resp.getWriter();
        if(courses == null) {
            out.println(responseModel.response(HttpServletResponse.SC_NOT_FOUND, "Not found", null));
        }
        else {
            out.println(responseModel.response(HttpServletResponse.SC_OK, "Find successfully", courses));
        }
    }
}
