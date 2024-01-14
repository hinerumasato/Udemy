package com.servlet.Udemy.services;

import java.util.List;
import java.util.Map;

import com.servlet.Udemy.DAO.CheckoutDAO;
import com.servlet.Udemy.models.CheckoutModel;

public class CheckoutService implements IService<CheckoutModel> {
    private CheckoutDAO checkoutDAO = new CheckoutDAO("checkouts");

    @Override
    public List<CheckoutModel> findAll() {
        return checkoutDAO.findAll();
    }

    @Override
    public CheckoutModel findById(int id) {
        return checkoutDAO.findById(id);
    }

    @Override
    public CheckoutModel findLast() {
        return checkoutDAO.findLast();
    }

    @Override
    public CheckoutModel findFirst() {
        return checkoutDAO.findFirst();
    }

    @Override
    public List<CheckoutModel> findByMap(Map<String, String> findMap) {
        return checkoutDAO.findByMap(findMap);
    }

    @Override
    public void insert(CheckoutModel model) {
        checkoutDAO.insert(model);
    }

    @Override
    public void update(CheckoutModel model) {
        checkoutDAO.update(model);
    }

    @Override
    public void delete(int id) {
        checkoutDAO.delete(id);
    }

    @Override
    public IService<CheckoutModel> paginate(int page, int limit) {
        return checkoutDAO.paginate(this, page, limit);
    }
}
