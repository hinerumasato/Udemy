package com.servlet.Udemy.models;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CartModel {
    private int id;
    private int amount;
    private Timestamp createdAt;
    private int userId;
    private int courseId;
}
