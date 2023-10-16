package com.servlet.Udemy.services;

import java.util.List;

import com.servlet.Udemy.DAO.ThumbnailDAO;
import com.servlet.Udemy.models.ThumbnailModel;

public class ThumbnailService implements IService<ThumbnailModel> {

    private ThumbnailDAO thumbnailDAO = new ThumbnailDAO("thumbnails");

    @Override
    public List<ThumbnailModel> findAll() {
        return thumbnailDAO.findAll();
    }

    @Override
    public ThumbnailModel findById(int id) {
        return thumbnailDAO.findById(id);
    }

    @Override
    public ThumbnailModel findLast() {
        return thumbnailDAO.findLast();
    }

    @Override
    public ThumbnailModel findFirst() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findFirst'");
    }

    @Override
    public void insert(ThumbnailModel model) {
        thumbnailDAO.insert(model);
    }

    @Override
    public void update(ThumbnailModel model) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
    }

    @Override
    public void delete(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'delete'");
    }
    
}
