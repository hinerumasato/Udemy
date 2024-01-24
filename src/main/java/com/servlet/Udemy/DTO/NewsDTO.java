package com.servlet.Udemy.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class NewsDTO {
    private int id;
    private String title;
    private String author;
    private String date;
    private boolean isSpecialNews;
    private String content;
    private String imgURL;
    private String slug;
}
