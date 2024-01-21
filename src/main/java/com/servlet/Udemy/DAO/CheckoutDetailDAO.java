package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.servlet.Udemy.models.CheckoutDetailModel;

public class CheckoutDetailDAO extends AbstractDAO<CheckoutDetailModel> {

    public CheckoutDetailDAO(String table) {
        super(table);
    }

    @Override
    protected CheckoutDetailModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        int amount = rs.getInt("amount");
        int checkoutId = rs.getInt("checkout_id");
        int courseId = rs.getInt("course_id");
        Timestamp createdAt = rs.getTimestamp("created_at");
        return new CheckoutDetailModel(id, amount, checkoutId, courseId, createdAt);        
    }

    @Override
    protected Map<String, Object> getValuesFromModel(CheckoutDetailModel model) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", model.getId());
        map.put("amount", model.getAmount());
        map.put("checkout_id", model.getCheckoutId());
        map.put("course_id", model.getCourseId());
        return map;
    }

    public List<CheckoutDetailModel> findByCheckoutId(int checkoutId) {
        return findBy("checkout_id", checkoutId);
    }
    
}
