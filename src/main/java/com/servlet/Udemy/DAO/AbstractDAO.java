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
    protected Database database;
    protected Connection conn;
    protected String table;

    public AbstractDAO(String table) {
        this.table = table;
    }

    public List<T> findAll() {
        this.database = new Database();
        conn = database.createConnection();
        List<T> result = new ArrayList<T>();
        try {
            String sql = "SELECT * FROM " + getTable();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                result.add(mapResultSetToModel(rs));
            }

            close(stmt, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result.size() > 0 ? result : null;
    }

    public T findById(int id) {
        try {
            createConnection();
            String sql = "SELECT * FROM " + getTable() + " WHERE ID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return mapResultSetToModel(rs);
            }

            close(stmt, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insert(T model) {
        this.database = new Database();
        conn = database.createConnection();
        String sql = "INSERT INTO " + getTable() + " (";
        Map<String, Object> values = getValuesFromModel(model);
        List<String> columns = new ArrayList<String>();

        for (String column : values.keySet()) {
            if(!column.equals("id")) {
                sql += column + ", ";
                columns.add(column);
            }
        }

        sql = sql.substring(0, sql.length() - 2) + ") values (";

        for (int i = 0; i < values.size() - 1; i++) { //Minus by 1 because id is not a value to insert
            sql += "?, ";
        }

        sql = sql.substring(0, sql.length() - 2) + ")";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            for (int i = 0; i < columns.size(); i++) {
                stmt.setObject(i + 1, values.get(columns.get(i)));
            }
            stmt.executeUpdate();
            close(stmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void close(PreparedStatement stmt, ResultSet rs) throws SQLException {
        if (rs != null)
            rs.close();
        if (stmt != null)
            stmt.close();
        database.closeConnection();
    }

    protected void createConnection() {
        this.database = new Database();
        this.conn = database.createConnection();
    }

    public T findLast() {
        createConnection();
        try {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM " + getTable() + " ORDER BY ID DESC LIMIT 1");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) return mapResultSetToModel(rs);
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    protected List<T> findBy(String field, Object value) {
        List<T> models = new ArrayList<>();
        createConnection();
        try {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM " + getTable() + " WHERE " + field + "= ?");
            stmt.setObject(1, value);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) models.add(mapResultSetToModel(rs));
            close(stmt, rs);
        } catch(SQLException e) {
            e.printStackTrace();
        }

        return models.size() > 0 ? models : null;
    }

    public List<T> findByMap(Map<String, String> conditionMap) {
        List<T> models = new ArrayList<>();
        createConnection();
        try {
            String sql = "SELECT * FROM " + getTable() + " WHERE ";
            for (String key : conditionMap.keySet()) {
                sql += conditionMap.get(key) + " AND ";
            }
            
            sql = sql.substring(0, sql.length() - 4);

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) models.add(mapResultSetToModel(rs));
            close(stmt, rs);
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return models.size() > 0 ? models : null;
    }

    protected abstract T mapResultSetToModel(ResultSet rs) throws SQLException;
    protected abstract Map<String, Object> getValuesFromModel(T model);
}
