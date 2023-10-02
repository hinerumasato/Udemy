package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.servlet.Udemy.models.UserModel;

public class UserDAO extends AbstractDAO<UserModel> {

    public UserDAO(String table) {
        super(table);
    }

    @Override
    protected UserModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String username = rs.getString("username");
        String password = rs.getString("password");
        UserModel userModel = new UserModel(id, username, password);
        return userModel;
    }

    @Override
    protected Map<String, Object> getValuesFromModel(UserModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("username", model.getUsername());
        map.put("password", model.getPassword());
        return map;
    }

    
}
