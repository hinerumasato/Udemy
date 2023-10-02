/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.Udemy.services;

import com.servlet.Udemy.DAO.CategoryDAO;
import com.servlet.Udemy.models.CategoryModel;
import java.util.List;

/**
 *
 * @author Masato
 */
public class CategoryService {

    private CategoryDAO categoryDAO = new CategoryDAO("categories");

    public List<CategoryModel> findAll() {
        return categoryDAO.findAll();
    }
}
