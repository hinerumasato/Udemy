package com.servlet.Udemy.services;

import java.util.List;
import java.util.Map;

import com.servlet.Udemy.DAO.CartDAO;
import com.servlet.Udemy.models.CartModel;

public class CartService implements IService<CartModel> {

    private CartDAO cartDAO = new CartDAO("carts");

    @Override
    public List<CartModel> findAll() {
        return cartDAO.findAll();
    }

    @Override
    public CartModel findById(int id) {
        return cartDAO.findById(id);
    }

    @Override
    public CartModel findLast() {
        return cartDAO.findLast();
    }

    @Override
    public CartModel findFirst() {
        return cartDAO.findFirst();
    }

    @Override
    public List<CartModel> findByMap(Map<String, String> findMap) {
        return cartDAO.findByMap(findMap);
    }

    @Override
    public boolean insert(CartModel model) {
        return cartDAO.insert(model);
    }

    @Override
    public boolean update(CartModel model) {
        return cartDAO.update(model);
    }

    @Override
    public boolean delete(int id) {
        return cartDAO.delete(id);
    }

    @Override
    public IService<CartModel> paginate(int page, int limit) {
        return cartDAO.paginate(this, page, limit);
    }

    public CartModel findByUserId(int userId) {
        return cartDAO.findByUserId(userId);
    }

    public void deleteByUserId(int userId) {
        cartDAO.deleteByUserId(userId);
    }

    public void insertOrUpdateByUserId(CartModel model) {
        if(findByUserId(model.getUserId()) == null)
            insert(model);
        else update(model);
    }
    
}
