package com.servlet.Udemy.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UserDTO {
    private int id;
    private String username;
    private String firstName;
    private String lastName;
    private String phone;
    private String avatar;
}
