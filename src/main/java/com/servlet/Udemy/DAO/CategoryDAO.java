package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.servlet.Udemy.models.CategoryModel;

public class CategoryDAO extends AbstractDAO<CategoryModel> {

    public CategoryDAO(String table) {
        super(table);
    }

    @Override
    protected CategoryModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        String icon = rs.getString("icon");
        return new CategoryModel(id, name, icon);
    }

    @Override
    protected Map<String, Object> getValuesFromModel(CategoryModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("name", model.getName());
        map.put("icon", model.getIcon());
        return map;
    }
    
}
