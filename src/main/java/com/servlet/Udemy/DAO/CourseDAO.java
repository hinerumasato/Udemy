package com.servlet.Udemy.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
        Map<String, Object> findMap = new HashMap<String, Object>();
        findMap.put("category_id", categoryId);
        findMap.put("is_delete", 0);
        return findBys(findMap);
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
        update("UPDATE " + getTable() + " SET is_delete = 1 WHERE ID = ?", id);
    }

    public void restore(int id) {
        update("UPDATE " + getTable() + " SET is_delete = 0 WHERE ID = ?", id);
    }

    public void softDeleteAll(List<Integer> ids) {
        createConnection();
        if (ids == null || ids.isEmpty()) {
            return;
        }
        String sql = "UPDATE " + getTable() + " SET is_delete = 1 WHERE ID IN (";
        PreparedStatement stmt = null;

        for (int i = 0; i < ids.size(); i++) {
            sql += "?, ";
        }
        sql = sql.substring(0, sql.length() - 2);
        sql += ")";

        try {
            stmt = conn.prepareStatement(sql);
            for (int i = 0; i < ids.size(); i++)
                stmt.setObject(i + 1, ids.get(i));
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                close(stmt, null);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void restoreAll(List<Integer> ids) {
        createConnection();
        if (ids == null || ids.isEmpty()) {
            return;
        }
        String sql = "UPDATE " + getTable() + " SET is_delete = 0 WHERE ID IN (";
        PreparedStatement stmt = null;

        for (int i = 0; i < ids.size(); i++) {
            sql += "?, ";
        }
        sql = sql.substring(0, sql.length() - 2);
        sql += ")";

        try {
            stmt = conn.prepareStatement(sql);
            for (int i = 0; i < ids.size(); i++)
                stmt.setObject(i + 1, ids.get(i));
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                close(stmt, null);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    public List<CourseModel> findAllActive() {
        return query("SELECT * FROM " + getTable() + " WHERE is_delete = ?", 0);
    }

    public List<CourseModel> findAllDeleted() {
        return query("SELECT * FROM " + getTable() + " WHERE is_delete = ?", 1);
    }

    public CourseModel findBySlug(String slug) {
        List<CourseModel> courses = findBy("slug", slug);
        if (courses != null && courses.size() > 0) {
            return courses.get(0);
        } else
            return null;
    }

    public List<CourseModel> findAllNewCourse() {
        Map<String, Object> findMap = new HashMap<String, Object>();
        findMap.put("new_course", 1);
        findMap.put("is_delete", 0);
        return findBys(findMap);
    }

    public List<CourseModel> searchByName(String search) {
        search = "%" + search + "%";
        return query("SELECT * FROM " + getTable() + " WHERE name LIKE ?", search);
    }

    public List<CourseModel> findByIds(List<Integer> ids) {
        createConnection();
        String sql = "SELECT * FROM " + getTable() + " WHERE ID IN(";
        for (int i = 0; i < ids.size(); i++) {
            sql += "?,";
        }

        sql = sql.substring(0, sql.length() - 1);
        sql += ")";

        System.out.println(sql);

        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<CourseModel> result = new ArrayList<>();
        try {
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < ids.size(); i++)
                stmt.setObject(i + 1, ids.get(i));
            rs = stmt.executeQuery();
            while (rs.next()) {
                result.add(mapResultSetToModel(rs));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try {
                close(stmt, rs);
            } catch(SQLException e) {
                e.printStackTrace();
            }
        }
        return result.size() > 0 ? result : null;
    }
}
