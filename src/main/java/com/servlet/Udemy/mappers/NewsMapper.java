package com.servlet.Udemy.mappers;

import com.servlet.Udemy.DTO.NewsDTO;
import com.servlet.Udemy.models.NewsModel;
import com.servlet.Udemy.utils.TimeUtil;

public class NewsMapper {
    public static NewsDTO mapToDTO(NewsModel newsModel) {
        return new NewsDTO(
            newsModel.getId(),
            newsModel.getTitle(),
            newsModel.getAuthor(),
            TimeUtil.formatDate(newsModel.getCreatedDate().toString(), "dd/MM/yyyy"),
            newsModel.isSpecialNews(),
            newsModel.getContent(),
            newsModel.getImgURL(),
            newsModel.getSlug()            
        );
    }
}
