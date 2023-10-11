package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.servlet.Udemy.models.CategoryModel;
import com.servlet.Udemy.models.CourseModel;

public class CategoryDAO extends AbstractDAO<CategoryModel> {

    public CategoryDAO(String table) {
        super(table);
    }
    
    public List<CourseModel> getCourses(int categoryId) {
        CourseDAO courseDAO = new CourseDAO("courses");
        return courseDAO.findByCategoryId(categoryId);
    }

    @Override
    protected CategoryModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        String icon = rs.getString("icon");
        String code = rs.getString("code");
        List<CourseModel> courses = getCourses(id);
        return new CategoryModel(id, name, icon, code, courses);
    }

    @Override
    protected Map<String, Object> getValuesFromModel(CategoryModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("name", model.getName());
        map.put("icon", model.getIcon());
        map.put("code", model.getCode());
        return map;
    }

    public CategoryModel findByCode(String code) {
        List<CategoryModel> models = findBy("code", code);
        if(models != null)
            return models.get(0);
        return null;
    }
    
}
