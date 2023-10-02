package com.servlet.Udemy.services;

import java.util.List;

import com.servlet.Udemy.DAO.UserDAO;
import com.servlet.Udemy.models.UserModel;

public class UserService implements IService<UserModel> {

    private UserDAO userDAO = new UserDAO("users");

    @Override
    public List<UserModel> findAll() {
        return userDAO.findAll();
    }

    @Override
    public UserModel findById(int id) {
        return userDAO.findById(id);
    }
}
