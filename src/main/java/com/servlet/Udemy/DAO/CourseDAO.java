package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.servlet.Udemy.models.CourseModel;

public class CourseDAO extends AbstractDAO<CourseModel> {

    public CourseDAO(String table) {
        super(table);
    }

    @Override
    protected CourseModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        boolean isNewCourse = rs.getBoolean("new_course");
        boolean isPopularCourse = rs.getBoolean(" popular_course");
        double price = rs.getDouble("price");
        double salePrice = rs.getDouble("sale_price");
        int levelId = rs.getInt("level_id");
        int categoryId = rs.getInt("category_id");
        return new CourseModel(id, name, isNewCourse, isPopularCourse, price, salePrice, levelId, categoryId);
    }

    @Override
    protected Map<String, Object> getValuesFromModel(CourseModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("name", model.getName());
        map.put("new_course", model.isNewCourse());
        map.put("popular_course", model.isPopularCourse());
        map.put("price", model.getPrice());
        map.put("sale_price", model.getSalePrice());
        map.put("level_id", model.getLevelId());
        map.put("category_id", model.getCategoryId());
        return map;
    }

    

}
