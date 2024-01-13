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
public class CartDetailModel {
    private int id;
    private int amount;
    private int cartId;
    private int courseId;
    private Timestamp createdAt;
}
