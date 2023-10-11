package com.servlet.Udemy.controllers.API;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.models.LevelModel;
import com.servlet.Udemy.models.ResponseModel;
import com.servlet.Udemy.services.LevelService;
import com.servlet.Udemy.utils.NumberUtil;

@WebServlet(urlPatterns = {"/api/v1/levels", "/api/v1/levels/*"})
public class LevelAPI extends HttpServlet {

    private LevelService levelService = new LevelService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String pathInfo = req.getPathInfo();

        ResponseModel responseModel = new ResponseModel();

        if(pathInfo == null || pathInfo.equals("/")) {
            resp.getWriter().write(responseModel.response(200, "Get all levels successfully", levelService.findAll()));
        } else {
            String cleanPath = pathInfo.substring(1);
            if(NumberUtil.canParse(cleanPath)) {
                int id = Integer.parseInt(cleanPath);
                LevelModel levelModel = levelService.findById(id);
                if(levelModel != null)
                    resp.getWriter().write(responseModel.response(200, "Get by id = " + id + " successfully", levelModel));
                else resp.getWriter().write(responseModel.response(404, "Level not found !!!", null));
            } else resp.getWriter().write(responseModel.response(500, "ID must not contain special charaters", null));
        }
    }
    
}
