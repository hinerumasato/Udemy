package com.servlet.Udemy.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.servlet.Udemy.configs.Database;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public abstract class AbstractDAO<T> {
    protected Connection conn;
    protected String table;

    public AbstractDAO(String table) {
        this.table = table;
    }

    public List<T> findAll() {
        Database db = new Database();
        conn = db.createConnection();
        List<T> result = new ArrayList<T>();
        try {
            String sql = "SELECT * FROM " + getTable();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                result.add(mapResultSetToModel(rs));
            }

            if(rs != null)
                rs.close();
            if(stmt != null)
                stmt.close();
            db.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result.size() > 0 ? result : null;
    }

    public T findById(int id) {
        try {
            String sql = "SELECT * FROM " + getTable() + " WHERE ID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                return mapResultSetToModel(rs);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void save(T model) {
        Database db = new Database();
        conn = db.createConnection();

        String sql = "INSERT INTO " + getTable() + " (";
        Map<String, Object> values = getValuesFromModel(model);
        List<String> columns = new ArrayList<String>();

        for(String column : values.keySet()) {
            sql += column + ", ";
            columns.add(column);
        }

        sql = sql.substring(0, sql.length() - 2) + ") values (";

        for (int i = 0; i < values.size(); i++) {
            sql += "?, ";
        }

        sql = sql.substring(0, sql.length() - 2) + ")";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            for (int i = 0; i < values.size(); i++) {
                stmt.setObject(i + 1, values.get(columns.get(i)));
            }

            stmt.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }

    protected abstract T mapResultSetToModel(ResultSet rs) throws SQLException;
    protected abstract Map<String, Object> getValuesFromModel(T model);
}
