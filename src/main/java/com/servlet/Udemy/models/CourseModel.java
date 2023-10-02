/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.Udemy.models;

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
    private boolean isNewCourse;
    private boolean isPopularCourse;
    private double price;
    private double salePrice;
    private int levelId;
    private int categoryId;

}
