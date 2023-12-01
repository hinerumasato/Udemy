package com.servlet.Udemy.services;

import java.util.List;

import com.servlet.Udemy.models.NewsModel;

public class NewsService implements INews<NewsModel>{

    @Override
    public List<NewsModel> findAll() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findAll'");
    }

    @Override
    public NewsModel findById(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public NewsModel findLast() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findLast'");
    }

    @Override
    public NewsModel findFirst() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findFirst'");
    }

    @Override
    public void insert(NewsModel model) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'insert'");
    }

    @Override
    public void update(NewsModel model) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
    }

    @Override
    public void delete(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'delete'");
    }
    
}
