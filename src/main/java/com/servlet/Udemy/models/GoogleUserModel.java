package com.servlet.Udemy.models;

import com.servlet.Udemy.constants.LoginType;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class GoogleUserModel {
    private String sub;
    private String name;
    private String given_name;
    private String family_name;
    private String picture;
    private String email;
    private boolean email_verified;

    public UserModel mapToUserModel() {
        UserModel userModel = new UserModel();
        userModel.setFirstName(family_name);
        userModel.setLastName(given_name);
        userModel.setAvatar(picture);
        userModel.setUsername(email);
        userModel.setEmailVerified(email_verified);
        userModel.setLoginType(LoginType.GOOGLE);
        return userModel;
    }
}
