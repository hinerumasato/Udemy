package com.servlet.Udemy.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class TeacherModel {
    private int id;
    private String name;
    private String avatar;
    private int categoryId;
}
