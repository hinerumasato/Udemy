package com.servlet.Udemy.configs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {

    private static String schema = "udemy";
    private static String username = "root";
    private static String password = "135792468jK";
    private static String url = "jdbc:mysql://localhost:3306/" + schema;
    private Connection conn;

    public Connection createConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            return conn;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void closeConnection() {
        try {
            this.conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
