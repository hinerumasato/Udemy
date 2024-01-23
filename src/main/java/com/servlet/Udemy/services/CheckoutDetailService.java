package com.servlet.Udemy.services;

import java.util.List;
import java.util.Map;

import com.servlet.Udemy.DAO.CheckoutDetailDAO;
import com.servlet.Udemy.models.CheckoutDetailModel;

public class CheckoutDetailService implements IService<CheckoutDetailModel> {

    private CheckoutDetailDAO checkoutDetailDAO = new CheckoutDetailDAO("checkout_details");

    @Override
    public List<CheckoutDetailModel> findAll() {
        return checkoutDetailDAO.findAll();
    }

    @Override
    public CheckoutDetailModel findById(int id) {
        return checkoutDetailDAO.findById(id);
    }

    @Override
    public CheckoutDetailModel findLast() {
        return checkoutDetailDAO.findLast();
    }

    @Override
    public CheckoutDetailModel findFirst() {
        return checkoutDetailDAO.findFirst();
    }

    @Override
    public List<CheckoutDetailModel> findByMap(Map<String, String> findMap) {
        return checkoutDetailDAO.findByMap(findMap);
    }

    @Override
    public boolean insert(CheckoutDetailModel model) {
        return checkoutDetailDAO.insert(model);
    }

    @Override
    public boolean update(CheckoutDetailModel model) {
        return checkoutDetailDAO.update(model);
    }

    @Override
    public boolean delete(int id) {
        return checkoutDetailDAO.delete(id);
    }

    @Override
    public IService<CheckoutDetailModel> paginate(int page, int limit) {
        return checkoutDetailDAO.paginate(this, page, limit);
    }
    
    public List<CheckoutDetailModel> findByCheckoutId(int checkoutId) {
        return checkoutDetailDAO.findByCheckoutId(checkoutId);
    }
}
