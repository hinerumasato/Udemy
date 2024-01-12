package com.servlet.Udemy.mappers;

import com.servlet.Udemy.DTO.UserDTO;
import com.servlet.Udemy.models.UserModel;

public class UserMapper {
    public static UserDTO mapUserToDTO(UserModel userModel) {
        return new UserDTO(
            userModel.getId(),
            userModel.getUsername(),
            userModel.getFirstName(),
            userModel.getLastName(),
            userModel.getPhone(), 
            userModel.getAvatar()
        );
    }
}
