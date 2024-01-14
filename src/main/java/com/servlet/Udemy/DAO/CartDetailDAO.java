package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.servlet.Udemy.models.CartDetailModel;

public class CartDetailDAO extends AbstractDAO<CartDetailModel> {

    public CartDetailDAO(String table) {
        super(table);
    }

    @Override
    protected CartDetailModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        int amount = rs.getInt("amount");
        int cartId = rs.getInt("cart_id");
        int courseId = rs.getInt("course_id");
        Timestamp createdAt = rs.getTimestamp("created_at");
        CartDetailModel cartDetailModel = new CartDetailModel(id, amount, cartId, courseId, createdAt);
        return cartDetailModel;
    }

    @Override
    protected Map<String, Object> getValuesFromModel(CartDetailModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("amount", model.getAmount());
        map.put("cart_id", model.getCartId());
        map.put("course_id", model.getCourseId());
        return map;
    }

    public CartDetailModel findByCartIdAndCourseId(int cartId, int courseId) {
        Map<String, Object> findMap = new HashMap<String, Object>();
        findMap.put("cart_id", cartId);
        findMap.put("course_id", courseId);

        List<CartDetailModel> result = findBys(findMap);
        if(result == null)
            return null;
        return result.get(0);
    }

    public List<CartDetailModel> findByCartId(int cartId) {
        return findBy("cart_id", cartId);
    }
    
}
