package com.servlet.Udemy.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.servlet.Udemy.models.UserModel;

public class UserDAO extends AbstractDAO<UserModel> {

    public UserDAO(String table) {
        super(table);
    }

    @Override
    protected UserModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String username = rs.getString("username");
        String password = rs.getString("password");
        String firstName = rs.getString("first_name");
        String lastName = rs.getString("last_name");
        String phone = rs.getString("phone");
        String loginType = rs.getString("login_type");
        boolean emailVerified = rs.getBoolean("email_verified");
        String avatar = rs.getString("avatar");
        String role = rs.getString("role");
        UserModel userModel = new UserModel(id, username, password, firstName, lastName, phone, avatar, emailVerified, loginType, role);
        return userModel;
    }

    @Override
    protected Map<String, Object> getValuesFromModel(UserModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("username", model.getUsername());
        map.put("password", model.getPassword());
        map.put("first_name", model.getFirstName());
        map.put("last_name", model.getLastName());
        map.put("phone", model.getPhone());
        map.put("avatar", model.getAvatar());
        map.put("email_verified", model.isEmailVerified());
        map.put("login_type", model.getLoginType());
        if(model.getRole() != null)
            map.put("role", model.getRole());
        return map;
    }

    public UserModel findByUsernameAndLoginType(String username, String loginType) {
        Map<String, Object> findMap = new HashMap<>();
        findMap.put("username", username);
        findMap.put("login_type", loginType);
        List<UserModel> foundResultList = findBys(findMap);
        if(foundResultList == null)
            return null;
        return foundResultList.size() > 0 ? foundResultList.get(0) : null;
    }    
}
