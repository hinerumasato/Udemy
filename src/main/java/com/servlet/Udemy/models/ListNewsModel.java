package com.servlet.Udemy.models;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class ListNewsModel {
    private int id;
   private String name;
   private List<NewsModel> newsModels; 
}
