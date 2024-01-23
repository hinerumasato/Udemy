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
import com.servlet.Udemy.utils.FileUtil;
import com.servlet.Udemy.utils.StringUtil;

@WebServlet("/admin/categories/update")
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 500,
    maxRequestSize = 1024 * 1024 * 500
)
public class UpdateCategoryController extends HttpServlet {

    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryId = Integer.parseInt(req.getParameter("id"));
        CategoryModel categoryModel = categoryService.findById(categoryId);
        Page page = new AdminPage(req, resp, "update-category.jsp", "master.jsp");
        page.setObject("title", "Cập nhật thể loại");
        page.setObject("category", categoryModel);
        page.render();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        String categoryName = req.getParameter("name");
        int categoryId = Integer.parseInt(req.getParameter("id"));
        Part iconPart = req.getPart("icon");
        String uuidFile = "";
        if(iconPart != null && iconPart.getSize() > 0 && iconPart.getSubmittedFileName() != null) {
            String filePath = iconPart.getSubmittedFileName();
            String fileName = FileUtil.getUUIDFileName(filePath);
            uuidFile = fileName;
            String realPath = req.getServletContext().getRealPath("/static/imgs/categories");
            iconPart.write(realPath + File.separator + uuidFile);
        }

        CategoryModel categoryModel = categoryService.findById(categoryId);

        String oldIcon = categoryModel.getIcon();

        deleteOldIcon(oldIcon, req.getServletContext().getRealPath("/"));

        categoryModel.setName(categoryName);
        categoryModel.setIcon("/static/imgs/categories/" + uuidFile);
        categoryModel.setCode(StringUtil.generateSlug(categoryName));

        boolean isUpdate = categoryService.update(categoryModel);
        if(isUpdate) {
            session.setAttribute("updateCategoryMessage", SuccessMessage.UPDATE_CATEGORY_SUCCESS);
            session.setAttribute("alertType", "success");
        } else {
            session.setAttribute("updateCategoryMessage", SuccessMessage.UPDATE_COURSE_SUCCESS);
            session.setAttribute("alertType", "danger");
        }
        resp.sendRedirect("/admin/categories");
    }

    private void deleteOldIcon(String oldIconLink, String realPath) {
        if(oldIconLink != null && !oldIconLink.isEmpty()) {
            File file = new File(realPath + oldIconLink);
            if(file.exists())
                file.delete();
        }
    }
}