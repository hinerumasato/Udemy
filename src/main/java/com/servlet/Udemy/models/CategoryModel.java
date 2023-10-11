package com.servlet.Udemy.models;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CategoryModel {
    private int id;
    private String name;
    private String icon;
    private String code;
    private List<CourseModel> courses;
}
