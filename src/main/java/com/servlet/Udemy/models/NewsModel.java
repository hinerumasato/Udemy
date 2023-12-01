package com.servlet.Udemy.models;

import java.sql.Date;
import java.util.List;

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
    private Date date;
    private boolean isSpecialNews;
    private List<NewsImages> newImages;
}
