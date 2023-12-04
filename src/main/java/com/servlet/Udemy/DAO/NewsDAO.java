package com.servlet.Udemy.DAO;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.servlet.Udemy.models.NewsModel;

public class NewsDAO extends AbstractDAO<NewsModel> {

    public NewsDAO(String table) {
        super(table);
    }

    @Override
    protected NewsModel mapResultSetToModel(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String title = rs.getString("title");
        String author = rs.getString("author");
        Date createdDate = rs.getDate("created_date");
        boolean isSpecialNews = rs.getBoolean("special_news");
        String content = rs.getString("content");
        String imgURL = rs.getString("img_url");

        return new NewsModel(id, title, author, createdDate, isSpecialNews, content, imgURL);
    }

    @Override
    protected Map<String, Object> getValuesFromModel(NewsModel model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", model.getId());
        map.put("title", model.getTitle());
        map.put("author", model.getAuthor());
        map.put("created_date", model.getCreatedDate());
        map.put("special_news", model.isSpecialNews());
        map.put("content", model.getContent());
        map.put("img_ur;", model.getImgURL());

        return map;
    }

}
