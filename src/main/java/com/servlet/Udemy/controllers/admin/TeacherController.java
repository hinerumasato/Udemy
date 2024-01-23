package com.servlet.Udemy.controllers.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.constants.ErrorMessage;
import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.models.CategoryModel;
import com.servlet.Udemy.models.TeacherModel;
import com.servlet.Udemy.page.AdminPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CategoryService;
import com.servlet.Udemy.services.TeacherService;

@WebServlet("/admin/teachers")
public class TeacherController extends HttpServlet {

    private TeacherService teacherService = new TeacherService();
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Page page = new AdminPage(req, resp, "teachers.jsp", "master.jsp");
        List<TeacherModel> teachers = teacherService.findAll();
        Map<TeacherModel, CategoryModel> categoryMap = new HashMap<>();
        for (TeacherModel teacher : teachers) {
            categoryMap.put(teacher, categoryService.findById(teacher.getCategoryId()));
        }
        page.setObject("title", "Danh sách giáo viên");
        page.setObject("teachers", teachers);
        page.setObject("categoryMap", categoryMap);
        page.render();

        session.removeAttribute("updateTeacherMessage");
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

        int teacherId = Integer.parseInt(req.getParameter("teacher-id"));
        boolean isDelete = teacherService.delete(teacherId);
        if(isDelete) {
            session.setAttribute("updateTeacherMessage", SuccessMessage.DELETE_TEACHER_SUCCESS);
            session.setAttribute("alertType", "success");
        }
        else {
            session.setAttribute("updateTeacherMessage", ErrorMessage.DELETE_TEAHCER_ERROR);
            session.setAttribute("alertType", "danger");
        }
        resp.sendRedirect("/admin/teachers");
    }
}
