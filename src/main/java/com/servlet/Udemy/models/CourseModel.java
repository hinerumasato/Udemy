/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.Udemy.models;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author Masato
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter

public class CourseModel {
    private int id;
    private String name;
    private String description;
    private boolean isNewCourse;
    private boolean isPopularCourse;
    private double price;
    private double salePrice;
    private int levelId;
    private int categoryId;
    private int teacherId;
    private boolean isDelete;
    private String slug;

    private List<ThumbnailModel> thumbnails;

    @Override
    public boolean equals(Object obj) {
        if(obj != null && obj instanceof CourseModel) {
            CourseModel that = (CourseModel) obj;
            return this.id == that.id;
        } else return false;
    }
}
