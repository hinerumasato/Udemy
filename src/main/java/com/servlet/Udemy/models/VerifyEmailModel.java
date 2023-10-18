package com.servlet.Udemy.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class VerifyEmailModel {
    private int id;
    private String rememberToken;
    private int expires;
    private int userId;

}
