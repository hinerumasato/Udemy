package com.servlet.Udemy.configs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import com.servlet.Udemy.utils.FileUtil;

public class DB {

    private String schema;
    private String username;
    private String password;
    private String url;
    private String driver;
    private Connection conn;

    public DB() {
        FileUtil fileUtil = new FileUtil();
        Properties properties = fileUtil.getAppProperties();
        this.schema = properties.getProperty("DB_SCHEMA");
        this.username = properties.getProperty("DB_USERNAME");
        this.password = properties.getProperty("DB_PASSWORD");
        this.driver = properties.getProperty("DB_DRIVER");

        this.url = properties.getProperty("DB_URL") + schema;
    }

    // public DB() {
    //     this.schema = "udemy";
    //     this.username = "root";
    //     this.password = "135792468jK";
    //     this.driver = "com.mysql.cj.jdbc.Driver";
    //     this.url = "jdbc:mysql://localhost:3306/" + schema;
    // }

    public Connection createConnection() {

        try {
            Class.forName(driver);
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
