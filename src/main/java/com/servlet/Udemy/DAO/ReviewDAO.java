package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import com.servlet.Udemy.models.ReviewModel;

public class ReviewDAO extends AbstractDAO<ReviewModel> {

    public ReviewDAO(String table) {
        super(table);
    }

    @Override
    protected ReviewModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        int rateAmount = rs.getInt("rate_amount");
        String content = rs.getString("content");
        int userId = rs.getInt("user_id");
        Timestamp createdAt = rs.getTimestamp("created_at");
        return new ReviewModel(id, rateAmount, content, userId, createdAt);        
    }

    @Override
    protected Map<String, Object> getValuesFromModel(ReviewModel model) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", model.getId());
        map.put("rate_amount", model.getRateAmount());
        map.put("content", model.getContent());
        map.put("user_id", model.getUserId());
        return map;
    }
    
}
