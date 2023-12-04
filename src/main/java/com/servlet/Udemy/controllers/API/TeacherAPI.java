package com.servlet.Udemy.controllers.API;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.constants.ErrorMessage;
import com.servlet.Udemy.constants.Message;
import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.models.ResponseModel;
import com.servlet.Udemy.models.TeacherModel;
import com.servlet.Udemy.services.TeacherService;
import com.servlet.Udemy.utils.NumberUtil;

@WebServlet(urlPatterns = {"/api/v1/teachers", "/api/v1/teachers/*"})
public class TeacherAPI extends HttpServlet {

    private TeacherService teacherService = new TeacherService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        resp.setContentType("application/json");

        ResponseModel responseModel = new ResponseModel();
        String pathInfo = req.getPathInfo();
        PrintWriter out = resp.getWriter();

        if(pathInfo == null || pathInfo.equals("/")) {
            out.write(responseModel.response(200, SuccessMessage.FIND_TEACHER_SUCCESS, teacherService.findAll()));
        } else {
            String parseStr = pathInfo.substring(1);
            if(NumberUtil.canParse(parseStr)) {
                int id = Integer.parseInt(parseStr);
                TeacherModel teacherModel = teacherService.findById(id);
                if(teacherModel != null)
                    out.write(responseModel.response(200, SuccessMessage.FIND_TEACHER_SUCCESS, teacherModel));
                else out.write(responseModel.response(404, ErrorMessage.FIND_TEACHER_ERROR, null));
            } else {
                out.write(responseModel.response(500, Message.ID_MUST_BE_SPECIAL_CHARACTERS, null));
            }
                
        }
    }
    
}
