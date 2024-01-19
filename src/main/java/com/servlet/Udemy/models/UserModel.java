package com.servlet.Udemy.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class UserModel {
    private int id;
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    private String phone;
    private String avatar;
    private boolean emailVerified;
    private String loginType;
    private String role;

    public UserModel(String username, String password, String firstName, String lastName, String phone, String avatar, boolean emailVerified, String loginType, String role) {
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.avatar = avatar;
        this.emailVerified = emailVerified;
        this.loginType = loginType;
        this.role = role;
    }
    
}
