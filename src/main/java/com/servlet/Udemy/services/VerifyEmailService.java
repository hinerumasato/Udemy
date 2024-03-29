package com.servlet.Udemy.services;

import java.util.List;
import java.util.Map;

import com.servlet.Udemy.DAO.VerifyEmailDAO;
import com.servlet.Udemy.models.VerifyEmailModel;

public class VerifyEmailService implements IService<VerifyEmailModel> {

    private VerifyEmailDAO verifyEmailDAO = new VerifyEmailDAO("verify_emails");

    @Override
    public List<VerifyEmailModel> findAll() {
        return verifyEmailDAO.findAll();
    }

    @Override
    public VerifyEmailModel findById(int id) {
        return verifyEmailDAO.findById(id);
    }

    @Override
    public VerifyEmailModel findLast() {
        return verifyEmailDAO.findLast();
    }

    @Override
    public VerifyEmailModel findFirst() {
        return verifyEmailDAO.findFirst();
    }

    @Override
    public boolean insert(VerifyEmailModel model) {
        return verifyEmailDAO.insert(model);
    }

    @Override
    public boolean update(VerifyEmailModel model) {
        return verifyEmailDAO.update(model);
    }

    @Override
    public boolean delete(int id) {
        return verifyEmailDAO.delete(id);
    }

    public VerifyEmailModel findByUserId(int userId) {
        return verifyEmailDAO.findByUserId(userId);
    }

    public VerifyEmailModel findByRememberToken(String rememberToken) {
        return verifyEmailDAO.findByRememberToken(rememberToken);
    }

    @Override
    public IService<VerifyEmailModel> paginate(int page, int limit) {
        return verifyEmailDAO.paginate(this, page, limit);
    }

    @Override
    public List<VerifyEmailModel> findByMap(Map<String, String> findMap) {
        return verifyEmailDAO.findByMap(findMap);
    }
    
}
