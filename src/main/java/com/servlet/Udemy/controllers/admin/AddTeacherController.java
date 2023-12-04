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
import com.servlet.Udemy.models.TeacherModel;
import com.servlet.Udemy.page.AdminPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CategoryService;
import com.servlet.Udemy.services.TeacherService;

@WebServlet("/admin/teacher/add-teacher")
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 5,
    maxRequestSize = 1024 * 1024 * 10
)
public class AddTeacherController extends HttpServlet {

    private CategoryService categoryService = new CategoryService();
    private TeacherService teacherService = new TeacherService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Page page = new AdminPage(req, resp, "add-teacher.jsp", "master.jsp");
        page.setObject("title", "Thêm giáo viên");
        page.setObject("categories", categoryService.findAll());
        page.setObject("message", session.getAttribute("message"));
        page.render();

        session.removeAttribute("message");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession session = req.getSession();

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        int categoryId = Integer.parseInt(req.getParameter("category_id"));
        String fileName = "default.png";
        Part avatarPart = req.getPart("avatar");

        String location = "/static/imgs/teachers";

        if(avatarPart != null && avatarPart.getSize() > 0 && avatarPart.getSubmittedFileName() != null) {
            fileName = avatarPart.getSubmittedFileName();
            String realPath = req.getServletContext().getRealPath(location);
            avatarPart.write(realPath + File.separator + fileName);
        }

        TeacherModel teacherModel = new TeacherModel();
        teacherModel.setName(name);
        teacherModel.setAvatar(location + "/" + fileName);
        teacherModel.setCategoryId(categoryId);
        teacherService.insert(teacherModel);

        session.setAttribute("message", SuccessMessage.ADD_NEW_TEACHER_SUCCESS);
        resp.sendRedirect("/admin/teacher/add-teacher");
    }
}
