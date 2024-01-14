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
        Timestamp createdAt = rs.getTimestamp("created_at");
        int userId = rs.getInt("user_id");

        CartModel cartModel = new CartModel(id, createdAt, userId);
        return cartModel;
    }

    @Override
    protected Map<String, Object> getValuesFromModel(CartModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("user_id", model.getUserId());
        return map;
    }

    public CartModel findByUserId(int userId) {
        List<CartModel> result = findBy("user_id", userId);
        if(result == null)
            return null;
        return result.get(0);
    }
}
