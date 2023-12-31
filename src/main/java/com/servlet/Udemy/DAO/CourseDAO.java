package com.servlet.Udemy.DAO;

import java.sql.PreparedStatement;
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
        if (categoryModel != null)
            return categoryModel.getCourses();
        return null;
    }

    @Override
    protected CourseModel mapResultSetToModel(ResultSet rs) throws SQLException {

        int id = rs.getInt("id");
        String name = rs.getString("name");
        String description = rs.getString("description");
        boolean isNewCourse = rs.getBoolean("new_course");
        boolean isPopularCourse = rs.getBoolean("popular_course");
        double price = rs.getDouble("price");
        double salePrice = rs.getDouble("sale_price");
        int levelId = rs.getInt("level_id");
        int categoryId = rs.getInt("category_id");
        int teacherId = rs.getInt("teacher_id");
        boolean isDelete = rs.getBoolean("is_delete");
        String slug = rs.getString("slug");

        List<ThumbnailModel> thumbnails = this.getThumbnails(id);
        return new CourseModel(id, name, description, isNewCourse, isPopularCourse, price, salePrice, levelId,
                categoryId, teacherId, isDelete, slug,
                thumbnails);
    }

    @Override
    protected Map<String, Object> getValuesFromModel(CourseModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("name", model.getName());
        map.put("description", model.getDescription());
        map.put("new_course", model.isNewCourse());
        map.put("popular_course", model.isPopularCourse());
        map.put("price", model.getPrice());
        map.put("sale_price", model.getSalePrice());
        map.put("level_id", model.getLevelId());
        map.put("category_id", model.getCategoryId());
        map.put("teacher_id", model.getTeacherId());
        map.put("is_delete", model.isDelete());
        map.put("slug", model.getSlug());

        return map;
    }

    public void softDelete(int id) {
        PreparedStatement stmt = null;
        try {
            createConnection();
            String sql = "UPDATE " + getTable() + " SET is_delete = 1 WHERE ID = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setObject(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                close(stmt, null);
            } catch(SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void restore(int id) {
        PreparedStatement stmt = null;
        try {
            createConnection();
            String sql = "UPDATE " + getTable() + " SET is_delete = 0 WHERE ID = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setObject(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                close(stmt, null);
            } catch(SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<CourseModel> findAllActive() {
        return query("SELECT * FROM " + getTable() + " WHERE is_delete = 0");
    }

    public List<CourseModel> findAllDeleted() {
        return query("SELECT * FROM " + getTable() + " WHERE is_delete = 1");
    }

    public CourseModel findBySlug(String slug) {
        List<CourseModel> courses = findBy("slug", slug);
        if(courses != null && courses.size() > 0) {
            return courses.get(0);
        } else return null;
    }

}
