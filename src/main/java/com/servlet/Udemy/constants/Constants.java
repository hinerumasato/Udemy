/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.Udemy.constants;

/**
 *
 * @author Masato
 */
public class Constants {
    public static final String CLIENT_PAGE_PATH = "/views/client/pages/";
    public static final String CLIENT_LAYOUT_PATH = "views/client/layout/";
    public static final String ENV_FILE = "application.properties";

    // Google OAuth Services Constants
    public static final String GOOGLE_REDIRECT_URL = "http://localhost:8080/auth/google";
    public static final String GOOGLE_GET_TOKEN_URL = "https://accounts.google.com/o/oauth2/token";
    public static final String GOOGLE_GET_USER_INFO_LINK = "https://www.googleapis.com/oauth2/v3/userinfo?access_token=";
    public static final String GOOGLE_GRANT_TYPE = "authorization_code";
}
