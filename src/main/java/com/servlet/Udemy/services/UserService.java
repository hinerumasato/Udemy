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

    public boolean isValidUser(UserModel userModel) {
        List<UserModel> users = this.findAll();
        if(users == null) return true;
        for(UserModel user : users) {
            if(user.getUsername().equals(userModel.getUsername()))
                return false;
        }
        return true;
    }

    @Override
    public void insert(UserModel model) {
        userDAO.insert(model);
    }
}
