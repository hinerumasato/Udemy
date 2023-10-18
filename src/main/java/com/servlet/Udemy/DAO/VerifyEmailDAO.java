package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.servlet.Udemy.models.VerifyEmailModel;

public class VerifyEmailDAO extends AbstractDAO<VerifyEmailModel> {

    public VerifyEmailDAO(String table) {
        super(table);
    }

    @Override
    protected VerifyEmailModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String rememberToken = rs.getString("remember_token");
        int expires = rs.getInt("expires");
        int userId = rs.getInt("user_id");
        return new VerifyEmailModel(id, rememberToken, expires, userId);
    }

    @Override
    protected Map<String, Object> getValuesFromModel(VerifyEmailModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("remember_token", model.getRememberToken());
        map.put("expires", model.getExpires());
        map.put("user_id", model.getUserId());
        return map;
    }

    public VerifyEmailModel findByUserId(int userId) {
        List<VerifyEmailModel> models = findBy("user_id", userId);
        if(models == null) return null;
        return models.size() > 0 ? models.get(0) : null;
    }

    public VerifyEmailModel findByRememberToken(String rememberToken) {
        List<VerifyEmailModel> models = findBy("remember_token", rememberToken);
        if(models == null) return null;
        return models.size() > 0 ? models.get(0) : null;
    }
    
}
