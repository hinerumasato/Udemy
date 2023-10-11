package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.servlet.Udemy.models.CategoryModel;
import com.servlet.Udemy.models.CourseModel;
import com.servlet.Udemy.models.ThumbnailModel;

public class CourseDAO extends AbstractDAO<CourseModel> {

    public CourseDAO(String table) {
        super(table);
    }

    public List<ThumbnailModel> getThumbnails(int courseId) {
        ThumbnailDAO thumbnailDAO = new ThumbnailDAO("thumbnails");
        return thumbnailDAO.findByCourseId(courseId);
    }

    public List<CourseModel> findByCategoryId(int categoryId) {
        return findBy("category_id", categoryId);
    }

    public List<CourseModel> findByCategoryCode(String code) {
        CategoryDAO categoryDAO = new CategoryDAO("categories");
        CategoryModel categoryModel = categoryDAO.findByCode(code);
        if(categoryModel != null)
            return categoryModel.getCourses();
        return null;
    }

    @Override
    protected CourseModel mapResultSetToModel(ResultSet rs) throws SQLException {

        int id = rs.getInt("id");
        String name = rs.getString("name");
        boolean isNewCourse = rs.getBoolean("new_course");
        boolean isPopularCourse = rs.getBoolean("popular_course");
        double price = rs.getDouble("price");
        double salePrice = rs.getDouble("sale_price");
        int levelId = rs.getInt("level_id");
        int categoryId = rs.getInt("category_id");

        List<ThumbnailModel> thumbnails = this.getThumbnails(id);
        return new CourseModel(id, name, isNewCourse, isPopularCourse, price, salePrice, levelId, categoryId,
                thumbnails);
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
