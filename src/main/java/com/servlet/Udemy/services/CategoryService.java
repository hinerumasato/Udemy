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
public class CategoryService implements IService<CategoryModel> {

    private CategoryDAO categoryDAO = new CategoryDAO("categories");

    @Override
    public List<CategoryModel> findAll() {
        return categoryDAO.findAll();
    }

    @Override
    public CategoryModel findById(int id) {
        return categoryDAO.findById(id);
    }

    @Override
    public void insert(CategoryModel model) {
        categoryDAO.insert(model);
    }

    @Override
    public void update(CategoryModel model) {
        categoryDAO.update(model);
    }

    @Override
    public void delete(int id) {
        categoryDAO.delete(id);
    }

    @Override
    public CategoryModel findLast() {
        return categoryDAO.findLast();
    }

    @Override
    public CategoryModel findFirst() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findFirst'");
    }
}
