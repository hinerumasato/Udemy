package com.servlet.Udemy.services;

import java.util.List;
import java.util.Map;

import com.servlet.Udemy.DAO.UserDAO;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.utils.StringUtil;

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

    public boolean isValidUser(UserModel model) {
        List<UserModel> users = this.findAll();
        if(users == null) return true;
        for(UserModel user : users) {
            if(user.getUsername().equals(model.getUsername()) && user.getLoginType().equals(model.getLoginType()))
                return false;
        }
        return true;
    }

    public boolean exists(UserModel model) {
        List<UserModel> users = this.findAll();
        if(users == null) return false;
        for(UserModel user : users) {
            if(user.getUsername().equals(model.getUsername()) && user.getLoginType().equals(model.getLoginType()))
                return true;
        }
        return false;
    }

    public UserModel findByUsernamePassword(String username, String password) {
        List<UserModel> users = this.findAll();
        if(users == null) return null;
        for(UserModel user : users) {
            if(user.getUsername().equals(username) && StringUtil.isEncryptEquals(password, user.getPassword()))
                return user;
        }
        return null;
    }

    public UserModel findByUsernameAndLoginType(String username, String loginType) {
        return userDAO.findByUsernameAndLoginType(username, loginType);
    }

    @Override
    public boolean insert(UserModel model) {
        return userDAO.insert(model);
    }

    @Override
    public boolean update(UserModel model) {
        return userDAO.update(model);
    }

    @Override
    public boolean delete(int id) {
        return userDAO.delete(id);
    }

    @Override
    public UserModel findLast() {
        return userDAO.findLast();
    }

    @Override
    public UserModel findFirst() {
        return userDAO.findFirst();
    }

    @Override
    public IService<UserModel> paginate(int page, int limit) {
        return userDAO.paginate(this, page, limit);
    }

    @Override
    public List<UserModel> findByMap(Map<String, String> findMap) {
        return userDAO.findByMap(findMap);
    }
}
