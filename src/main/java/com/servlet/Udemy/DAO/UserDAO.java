package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.servlet.Udemy.models.UserModel;

public class UserDAO extends AbstractDAO {
    public List<UserModel> findAll() {
        List<UserModel> result = new ArrayList<>();
        ResultSet rs = this.executeQuery("SELECT * FROM USERS");
        try {
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                UserModel userModel = new UserModel(id, username, password);
                result.add(userModel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
