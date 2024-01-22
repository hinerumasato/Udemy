package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.servlet.Udemy.models.ResetPasswordModel;

public class ResetPasswordDAO extends AbstractDAO<ResetPasswordModel> {

    public ResetPasswordDAO(String table) {
        super(table);
    }

    @Override
    protected ResetPasswordModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String rememberToken = rs.getString("remember_token");
        int userid = rs.getInt("user_id");
        Timestamp createdAt = rs.getTimestamp("created_at");
        return new ResetPasswordModel(id, rememberToken, userid, createdAt);
    }

    @Override
    protected Map<String, Object> getValuesFromModel(ResetPasswordModel model) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", model.getId());
        map.put("remember_token", model.getRememberToken());
        map.put("user_id", model.getUserId());
        return map;        
    }

    public void deleteByUserId(int userId) {
        delete("DELETE FROM " + getTable() + " WHERE user_id = ?", userId);
    }

    public ResetPasswordModel findByRememberToken(String rememberToken) {
        List<ResetPasswordModel> list = findBy("remember_token", rememberToken);
        if(list == null)
            return null;
        return list.size() > 0 ? list.get(0) : null;
    }
    
}
