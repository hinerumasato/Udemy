/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.Udemy.controllers.auth;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import com.google.gson.Gson;
import com.servlet.Udemy.constants.Constants;
import com.servlet.Udemy.constants.LoginType;
import com.servlet.Udemy.models.GoogleTokenResponseModel;
import com.servlet.Udemy.models.GoogleUserModel;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.services.UserService;
import com.servlet.Udemy.utils.FileUtil;

/**
 *
 * @author Masato
 */

@WebServlet("/auth/google")
public class GoogleAuthController extends HttpServlet {

    private UserService userService = new UserService();

    private String getToken(String code) throws ClientProtocolException, IOException {
        Properties props = FileUtil.getAppProperties();
        String response = Request.Post(Constants.GOOGLE_GET_TOKEN_URL)
                .bodyForm(
                    Form.form().add("client_id", props.getProperty("GOOGLE_CLIENT_ID"))
                        .add("client_secret", props.getProperty("GOOGLE_CLIENT_SECRET"))
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URL)
                        .add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE)
                        .build())
                .execute().returnContent().asString();
        
        GoogleTokenResponseModel model = new Gson().fromJson(response, GoogleTokenResponseModel.class);
        return model.getAccessToken();
    }
    

    private String getUserInfo(String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_GET_USER_INFO_LINK + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        return response;
    }

    private GoogleUserModel getGoogleUserModel(String json) {
        GoogleUserModel model = new Gson().fromJson(json, GoogleUserModel.class);
        return model;
    }

    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String code = req.getParameter("code");
        String accessToken = getToken(code);
        String userInfo = getUserInfo(accessToken);
        GoogleUserModel googleUserModel = getGoogleUserModel(userInfo);
        UserModel userModel = googleUserModel.mapToUserModel();
        if(!userService.exists(userModel)) {
            userService.insert(userModel);
        }
        
        userModel = userService.findByUsernameAndLoginType(userModel.getUsername(), LoginType.GOOGLE);
        HttpSession session = req.getSession();
        session.setAttribute("loginUser", userModel);
        resp.sendRedirect("/home");
    }

}
