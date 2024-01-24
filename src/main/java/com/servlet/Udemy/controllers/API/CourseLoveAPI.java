package com.servlet.Udemy.controllers.API;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.constants.ErrorMessage;
import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.models.CourseLoveModel;
import com.servlet.Udemy.models.ResponseModel;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.services.CourseLoveService;

@WebServlet("/api/v1/courses/love")
@MultipartConfig(
    maxFileSize = 1024 * 1024,
    maxRequestSize = 1024 * 1024
)
public class CourseLoveAPI extends HttpServlet {

    private CourseLoveService courseLoveService = new CourseLoveService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        UserModel loginUser = (UserModel) session.getAttribute("loginUser");
        int courseId = Integer.parseInt(req.getParameter("courseId"));
        CourseLoveModel courseLoveModel = courseLoveService.findByUserIdAndCourseId(loginUser.getId(), courseId);
        PrintWriter out = resp.getWriter();
        ResponseModel responseModel = new ResponseModel();
        if(courseLoveModel == null) {
            out.println(responseModel.response(404, ErrorMessage.FIND_COURSE_LOVE_ERROR, null));
        }
        else {
            out.println(responseModel.response(200, SuccessMessage.FIND_COURSE_LOVE_SUCCESS, null));
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        UserModel loginUser = (UserModel) session.getAttribute("loginUser");
        int courseId = Integer.parseInt(req.getParameter("courseId"));
        CourseLoveModel courseLoveModel = new CourseLoveModel();
        courseLoveModel.setCourseId(courseId);
        courseLoveModel.setUserId(loginUser.getId());

        boolean inserted = courseLoveService.insert(courseLoveModel);
        PrintWriter out = resp.getWriter();
        ResponseModel responseModel = new ResponseModel();
        if(inserted) {
            out.println(responseModel.response(200, SuccessMessage.ADD_LOVE_COURSE_SUCCESS, null));
        } else {
            out.println(responseModel.response(404, ErrorMessage.ADD_LOVE_COURSE_ERROR, null));
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        UserModel loginUser = (UserModel) session.getAttribute("loginUser");
        int courseId = Integer.parseInt(req.getParameter("courseId"));
        boolean isDelete = courseLoveService.deleteByUserIdAndCourseId(loginUser.getId(), courseId);
        PrintWriter out = resp.getWriter();
        ResponseModel responseModel = new ResponseModel();
        if(isDelete) {
            out.println(responseModel.response(200, SuccessMessage.DELETE_LOVE_COURSE_SUCCESS, null));
        } else {
            out.println(responseModel.response(404, ErrorMessage.DELETE_LOVE_COURSE_ERROR, null));
        }
    }
}
