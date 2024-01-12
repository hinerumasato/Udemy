package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.servlet.Udemy.models.CartModel;

public class CartDAO extends AbstractDAO<CartModel> {

    public CartDAO(String table) {
        super(table);
    }

    @Override
    protected CartModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        int amount = rs.getInt("amount");
        Timestamp createdAt = rs.getTimestamp("created_at");
        int userId = rs.getInt("user_id");
        int courseId = rs.getInt("course_id");

        CartModel cartModel = new CartModel(id, amount, createdAt, userId, courseId);
        return cartModel;
    }

    @Override
    protected Map<String, Object> getValuesFromModel(CartModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("amount", model.getAmount());
        map.put("user_id", model.getUserId());
        map.put("course_id", model.getCourseId());
        return map;
    }

    public List<CartModel> findByUserId(int userId) {
        return findBy("user_id", userId);
    }
}
