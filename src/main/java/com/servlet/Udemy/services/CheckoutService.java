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
    public boolean insert(CheckoutModel model) {
        return checkoutDAO.insert(model);
    }

    @Override
    public boolean update(CheckoutModel model) {
        return checkoutDAO.update(model);
    }

    @Override
    public boolean delete(int id) {
        return checkoutDAO.delete(id);
    }

    @Override
    public IService<CheckoutModel> paginate(int page, int limit) {
        return checkoutDAO.paginate(this, page, limit);
    }

    public List<CheckoutModel> findByCartId(int cartId) {
        return checkoutDAO.findByCartId(cartId);
    }
}
