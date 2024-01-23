package com.servlet.Udemy.controllers.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.models.CategoryModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CategoryService;

@WebServlet("/admin/categories/update")
public class UpdateCategoryController extends HttpServlet {

    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryId = Integer.parseInt(req.getParameter("id"));
        CategoryModel categoryModel = categoryService.findById(categoryId);
        Page page = new ClientPage(req, resp, "update-category.jsp", "master.jsp");
        page.setObject("title", "Cập nhật thể loại");
        page.setObject("category", categoryModel);
        page.render();
    }
}
