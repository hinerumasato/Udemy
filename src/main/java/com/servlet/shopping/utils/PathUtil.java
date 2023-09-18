/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.shopping.utils;

import com.servlet.shopping.constants.Constants;

/**
 *
 * @author Masato
 */
public class PathUtil {
    public static String getClientPagePath(String pageName) {
        return Constants.CLIENT_PAGE_PATH + pageName;
    }
    
    public static String getClientLayoutPath(String layoutName) {
        return Constants.CLIENT_LAYOUT_PATH + layoutName;
    }
}
