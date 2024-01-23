package com.servlet.Udemy.controllers.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.servlet.Udemy.constants.ErrorMessage;
import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.models.CategoryModel;
import com.servlet.Udemy.models.TeacherModel;
import com.servlet.Udemy.page.AdminPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CategoryService;
import com.servlet.Udemy.services.TeacherService;
import com.servlet.Udemy.utils.FileUtil;

@WebServlet("/admin/teachers/update")
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 500,
    maxRequestSize = 1024 * 1024 * 500
)
public class UpdateTeacherController extends HttpServlet {

    private TeacherService teacherService = new TeacherService();
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        int teacherId = Integer.parseInt(req.getParameter("id"));
        
        Page page = new AdminPage(req, resp, "update-teacher.jsp", "master.jsp");
        TeacherModel teacherModel = teacherService.findById(teacherId);
        List<CategoryModel> categories = categoryService.findAll();
        page.setObject("title", "Cập nhật giáo viên");
        page.setObject("teacher", teacherModel);
        page.setObject("categories", categories);
        page.render();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        int teacherId = Integer.parseInt(req.getParameter("id"));

        TeacherModel teacherModel = teacherService.findById(teacherId);
        String oldAvatarPath = teacherModel.getAvatar();

        deleteOldAvatar(oldAvatarPath, req.getServletContext().getRealPath("/"));

        String name = req.getParameter("name");
        int categoryId = Integer.parseInt(req.getParameter("category_id"));
        Part avatarPart = req.getPart("icon");
        String fileName = "";
        if(avatarPart != null && avatarPart.getSize() > 0 && avatarPart.getSubmittedFileName() != null) {
            String submittedName = avatarPart.getSubmittedFileName();
            fileName = FileUtil.getUUIDFileName(submittedName);
            String realPath = req.getServletContext().getRealPath("/static/imgs/teachers");
            avatarPart.write(realPath + File.separator + fileName);
        }

        teacherModel.setName(name);
        teacherModel.setCategoryId(categoryId);
        teacherModel.setAvatar("/static/imgs/teachers/" + fileName);

        boolean isUpdate = teacherService.update(teacherModel);
        if(isUpdate) {
            session.setAttribute("updateTeacherMessage", SuccessMessage.UPDATE_TEACHER_SUCCESS);
            session.setAttribute("alertType", "success");
        }
        else {
            session.setAttribute("updateTeacherMessage", ErrorMessage.UPDATE_TEACHER_ERROR);
            session.setAttribute("alertType", "danger");
        }
        resp.sendRedirect("/admin/teachers");
    }

    private void deleteOldAvatar(String oldAvatarLink, String realPath) {
        if(oldAvatarLink != null && !oldAvatarLink.isEmpty()) {
            File file = new File(realPath + oldAvatarLink);
            if(file.exists())
                file.delete();
        }
    }
}
