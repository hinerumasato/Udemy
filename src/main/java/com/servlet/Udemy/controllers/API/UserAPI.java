package com.servlet.Udemy.controllers.API;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.DTO.UserDTO;
import com.servlet.Udemy.constants.ErrorMessage;
import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.mappers.UserMapper;
import com.servlet.Udemy.models.ResponseModel;
import com.servlet.Udemy.models.UserModel;

@WebServlet("/api/v1/user-data")
public class UserAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        ResponseModel responseModel = new ResponseModel();
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession();
        UserModel loginUser = (UserModel) session.getAttribute("loginUser");
        if(loginUser == null) {
            out.println(responseModel.response(404, ErrorMessage.LOGIN_USER_NOT_FOUND, null));
        } else {
            UserDTO userDTO = UserMapper.mapUserToDTO(loginUser);
            out.println(responseModel.response(200, SuccessMessage.FIND_LOGIN_USER_SUCCESS, userDTO));
        }
    }
}
