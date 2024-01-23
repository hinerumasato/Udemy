package com.servlet.Udemy.controllers.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.models.CategoryModel;
import com.servlet.Udemy.page.AdminPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CategoryService;
import com.servlet.Udemy.utils.StringUtil;

@WebServlet("/admin/categories/add-category")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10)
public class AddCategoryController extends HttpServlet {

    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Page page = new AdminPage(req, resp, "add-category.jsp", "master.jsp");
        page.setObject("title", "Thêm thể loại");
        page.setObject("message", session.getAttribute("message"));
        page.render();
        session.removeAttribute("message");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();

        String name = req.getParameter("name");
        String fileName = "default.png";            
        Part iconPart = req.getPart("icon");
        if(iconPart != null && iconPart.getSize() > 0 && iconPart.getSubmittedFileName() != null) {
            fileName = iconPart.getSubmittedFileName();
            String realPath = req.getServletContext().getRealPath("/static/imgs/categories");
            iconPart.write(realPath + File.separator + fileName);
        }

        CategoryModel categoryModel = new CategoryModel();
        categoryModel.setName(name);
        categoryModel.setIcon("/static/imgs/categories/" + fileName);
        categoryModel.setCode(StringUtil.generateSlug(name));

        categoryService.insert(categoryModel);

        session.setAttribute("message", SuccessMessage.ADD_NEW_CATEGORY_SUCCESS);
        resp.sendRedirect("/admin/categories/add-category");
    }
}
