package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.servlet.Udemy.models.CourseLoveModel;

public class CourseLoveDAO extends AbstractDAO<CourseLoveModel> {

    public CourseLoveDAO(String table) {
        super(table);
    }

    @Override
    protected CourseLoveModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int userId = rs.getInt("user_id");
        int courseId = rs.getInt("course_id");
        return new CourseLoveModel(userId, courseId);
    }

    @Override
    protected Map<String, Object> getValuesFromModel(CourseLoveModel model) {
        Map<String, Object> map = new HashMap<>();
        map.put("user_id", model.getUserId());
        map.put("course_id", model.getCourseId());
        return map;
    }

    public List<CourseLoveModel> findByUserId(int userId) {
        return findBy("user_id", userId);
    }

    public boolean deleteByUserIdAndCourseId(int userId, int courseId) {
        return update("DELETE FROM " + getTable() + " WHERE user_id = ? AND course_id = ?", userId, courseId);
    }

    public CourseLoveModel findByUserIdAndCourseId(int userId, int courseId) {
        Map<String, Object> findMap = new HashMap<>();
        findMap.put("user_id", userId);
        findMap.put("course_id", courseId);
        List<CourseLoveModel> list = findBys(findMap);
        if(list == null)
            return null;
        return list.size() > 0 ? list.get(0) : null;
    }
    
}
