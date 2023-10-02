package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.servlet.Udemy.models.ThumbnailModel;

public class ThumbnailDAO extends AbstractDAO<ThumbnailModel> {

    public ThumbnailDAO(String table) {
        super(table);
    }

    @Override
    protected ThumbnailModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String img = rs.getString("img");
        int courseId = rs.getInt("course_id");
        return new ThumbnailModel(id, img, courseId);
    }

    @Override
    protected Map<String, Object> getValuesFromModel(ThumbnailModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("img", model.getImg());
        map.put("course_id", model.getCourseId());
        return map;
    }
    
}
