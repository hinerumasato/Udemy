package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.servlet.Udemy.models.TeacherModel;

public class TeacherDAO extends AbstractDAO<TeacherModel> {

    public TeacherDAO(String table) {
        super(table);
    }

    @Override
    protected TeacherModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        String avatar = rs.getString("avatar");
        int categoryId = rs.getInt("category_id");

        return new TeacherModel(id, name, avatar, categoryId);
    }

    @Override
    protected Map<String, Object> getValuesFromModel(TeacherModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("name", model.getName());
        map.put("avatar", model.getAvatar());
        map.put("category_id", model.getCategoryId());
        return map;
    }
    
}
