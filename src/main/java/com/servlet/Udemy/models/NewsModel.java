package com.servlet.Udemy.models;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class NewsModel {
    private int id;
    private String title;
    private String author;
    private Date createdDate;
    private boolean isSpecialNews;
    private String content;
    private String imgURL;
    private String slug;
}
