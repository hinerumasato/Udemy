package com.servlet.Udemy.services;

import java.util.List;
import java.util.Map;

import com.servlet.Udemy.DAO.ResetPasswordDAO;
import com.servlet.Udemy.models.ResetPasswordModel;

public class ResetPasswordService implements IService<ResetPasswordModel> {

    private ResetPasswordDAO resetPasswordDAO = new ResetPasswordDAO("reset_passwords");

    @Override
    public List<ResetPasswordModel> findAll() {
        return resetPasswordDAO.findAll();
    }

    @Override
    public ResetPasswordModel findById(int id) {
        return resetPasswordDAO.findById(id);
    }

    @Override
    public ResetPasswordModel findLast() {
        return resetPasswordDAO.findLast();
    }

    @Override
    public ResetPasswordModel findFirst() {
        return resetPasswordDAO.findFirst();
    }

    @Override
    public List<ResetPasswordModel> findByMap(Map<String, String> findMap) {
        return resetPasswordDAO.findByMap(findMap);
    }

    @Override
    public boolean insert(ResetPasswordModel model) {
        return resetPasswordDAO.insert(model);
    }

    @Override
    public boolean update(ResetPasswordModel model) {
        return resetPasswordDAO.update(model);
    }

    @Override
    public boolean delete(int id) {
        return resetPasswordDAO.delete(id);
    }

    @Override
    public IService<ResetPasswordModel> paginate(int page, int limit) {
        return resetPasswordDAO.paginate(this, page, limit);
    }
    
    public void deleteByUserId(int userId) {
        resetPasswordDAO.deleteByUserId(userId);
    }

    public ResetPasswordModel findByRememberToken(String rememberToken) {
        return resetPasswordDAO.findByRememberToken(rememberToken);
    }
}
