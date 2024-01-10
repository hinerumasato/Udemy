package com.servlet.Udemy.configs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import com.servlet.Udemy.utils.FileUtil;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Database {

    private static Database instance;
    private String schema;
    private String username;
    private String password;
    private String url;
    private String driver;
    private Connection conn;

    private Database() {
        Properties properties = FileUtil.getAppProperties();
        this.schema = properties.getProperty("DB_SCHEMA");
        this.username = properties.getProperty("DB_USERNAME");
        this.password = properties.getProperty("DB_PASSWORD");
        this.driver = properties.getProperty("DB_DRIVER");
        this.url = properties.getProperty("DB_URL") + schema;

        this.conn = createConnection();
    }

    public static Database getInstance() {
        if(instance == null)
            instance = new Database();
        return instance;
    }

    private Connection createConnection() {

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
            if(conn != null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return this.conn;
    }
    
}
