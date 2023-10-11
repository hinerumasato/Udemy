package com.servlet.Udemy.controllers.API;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.models.CategoryModel;
import com.servlet.Udemy.models.ResponseModel;
import com.servlet.Udemy.services.CategoryService;
import com.servlet.Udemy.utils.NumberUtil;

@WebServlet(urlPatterns = {"/api/v1/categories/*", "/api/v1/categories"})
public class CategoryAPI extends HttpServlet {

    private CategoryService categoryService = new CategoryService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String pathInfo = req.getPathInfo();

        ResponseModel responseModel = new ResponseModel();

        if(pathInfo == null || pathInfo.equals("/")) {
            resp.getWriter().write(responseModel.response(200, "Get all categories successfully", categoryService.findAll()));
        } else {
            String cleanPath = pathInfo.substring(1);
            if(NumberUtil.canParse(cleanPath)) {
                int id = Integer.parseInt(cleanPath);
                CategoryModel categoryModel = categoryService.findById(id);
                if(categoryModel != null)
                    resp.getWriter().write(responseModel.response(200, "Get by id = " + id + " successfully", categoryModel));
                else resp.getWriter().write(responseModel.response(404, "Category not found !!!", null));
            } else resp.getWriter().write(responseModel.response(500, "ID must not contain special charaters", null));
        }
    }
}
