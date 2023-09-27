package com.servlet.Udemy.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.servlet.Udemy.configs.DB;

public abstract class AbstractDAO {
    protected Connection conn;

    public ResultSet executeQuery(String sql) {
        DB db = new DB();
        conn = db.createConnection();

        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
