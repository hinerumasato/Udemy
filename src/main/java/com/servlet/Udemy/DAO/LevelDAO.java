package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.servlet.Udemy.models.LevelModel;

public class LevelDAO extends AbstractDAO<LevelModel> {

    public LevelDAO(String table) {
        super(table);
    }

    @Override
    protected LevelModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String value = rs.getString("value");
        String code = rs.getString("code");
        return new LevelModel(id, value, code);
    }

    @Override
    protected Map<String, Object> getValuesFromModel(LevelModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("value", model.getValue());
        map.put("code", model.getCode());
        return map;
    }
    
}
