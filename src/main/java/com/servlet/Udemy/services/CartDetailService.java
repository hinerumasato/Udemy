package com.servlet.Udemy.services;

import java.util.List;
import java.util.Map;

import com.servlet.Udemy.DAO.CartDetailDAO;
import com.servlet.Udemy.models.CartDetailModel;

public class CartDetailService implements IService<CartDetailModel> {
    private CartDetailDAO cartDetailDAO = new CartDetailDAO("cart_details");

    @Override
    public List<CartDetailModel> findAll() {
        return cartDetailDAO.findAll();
    }

    @Override
    public CartDetailModel findById(int id) {
        return cartDetailDAO.findById(id);
    }

    @Override
    public CartDetailModel findLast() {
        return cartDetailDAO.findLast();
    }

    @Override
    public CartDetailModel findFirst() {
        return cartDetailDAO.findFirst();
    }

    @Override
    public List<CartDetailModel> findByMap(Map<String, String> findMap) {
        return cartDetailDAO.findByMap(findMap);
    }

    @Override
    public void insert(CartDetailModel model) {
        cartDetailDAO.insert(model);
    }

    @Override
    public void update(CartDetailModel model) {
        cartDetailDAO.update(model);
    }

    @Override
    public void delete(int id) {
        cartDetailDAO.delete(id);
    }

    @Override
    public IService<CartDetailModel> paginate(int page, int limit) {
        return cartDetailDAO.paginate(this, page, limit);
    }

    public CartDetailModel findByCartIdAndCourseId(int cartId, int courseId) {
        return cartDetailDAO.findByCartIdAndCourseId(cartId, courseId);
    }

    public List<CartDetailModel> findByCartId(int cartId) {
        return cartDetailDAO.findByCartId(cartId);
    }

    public void deleteByCartId(int cartId) {
        cartDetailDAO.deleteByCartId(cartId);
    }
}
