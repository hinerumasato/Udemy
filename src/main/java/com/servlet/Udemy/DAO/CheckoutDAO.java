package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.servlet.Udemy.models.CheckoutModel;

public class CheckoutDAO extends AbstractDAO<CheckoutModel> {

    public CheckoutDAO(String table) {
        super(table);
    }

    @Override
    protected CheckoutModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        double totalAmount = rs.getDouble("total_amount");
        double discount = rs.getDouble("discount");
        String paymentStatus = rs.getString("payment_status");
        Timestamp createdAt = rs.getTimestamp("created_at");
        int cartId = rs.getInt("cart_id");

        CheckoutModel checkoutModel = new CheckoutModel(id, totalAmount, discount, paymentStatus, createdAt, cartId);
        return checkoutModel;
    }

    @Override
    protected Map<String, Object> getValuesFromModel(CheckoutModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("total_amount", model.getTotalAmount());
        map.put("discount", model.getDiscount());
        map.put("payment_status", model.getPaymentStatus());
        map.put("cart_id", model.getCartId());
        return map;
    }

    public List<CheckoutModel> findByCartId(int cartId) {
        return findBy("cart_id", cartId);
    }
    
}
