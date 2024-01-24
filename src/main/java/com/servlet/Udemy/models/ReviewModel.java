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
public class ReviewModel {
    private int id;
    private int rateAmount;
    private String content;
    private int userId;
    private Timestamp createdAt;
}
