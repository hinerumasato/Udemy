package com.servlet.Udemy.controllers.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.constants.ErrorMessage;
import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.models.CategoryModel;
import com.servlet.Udemy.page.AdminPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CategoryService;

@WebServlet("/admin/categories")
public class CategoryController extends HttpServlet {

    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<CategoryModel> categories = categoryService.findAll();

        Page page = new AdminPage(req, resp, "categories.jsp", "master.jsp");
        page.setObject("title", "Danh sách thể loại");
        page.setObject("categories", categories);
        page.render();

        session.removeAttribute("deleteCategoryMessage");
        session.removeAttribute("alertType");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("_method");
        switch (method) {
            case "DELETE":
                doDelete(req, resp);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        int categoryId = Integer.parseInt(req.getParameter("category-id"));
        boolean isDelete = categoryService.delete(categoryId);
        if(isDelete) {
            session.setAttribute("deleteCategoryMessage", SuccessMessage.DELETE_CATEGORY_SUCCESS);
            session.setAttribute("alertType", "success");
        }
        else {
            session.setAttribute("deleteCategoryMessage", ErrorMessage.DELETE_CATEGORY_ERROR);
            session.setAttribute("alertType", "danger");
        }

        resp.sendRedirect("/admin/categories");
    }
}
