package com.servlet.Udemy.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
        return thumbnailDAO.findFirst();
    }

    @Override
    public boolean insert(ThumbnailModel model) {
        return thumbnailDAO.insert(model);
    }

    @Override
    public boolean update(ThumbnailModel model) {
        return thumbnailDAO.update(model);
    }

    @Override
    public boolean delete(int id) {
        return thumbnailDAO.delete(id);
    }

    @Override
    public IService<ThumbnailModel> paginate(int page, int limit) {
        return thumbnailDAO.paginate(this, page, limit);
    }

    @Override
    public List<ThumbnailModel> findByMap(Map<String, String> findMap) {
        return thumbnailDAO.findByMap(findMap);
    }

    public void deleteByCourseId(int courseId) {
        thumbnailDAO.deleteByCourseId(courseId);
    }

    public List<ThumbnailModel> findByCourseId(int courseId) {
        return thumbnailDAO.findByCourseId(courseId);
    }

    public List<String> findAllLinksByCourseId(int courseId) {
        List<String> result = new ArrayList<String>();
        List<ThumbnailModel> thumbnails = findByCourseId(courseId);

        if(thumbnails == null) return null;
        
        for (ThumbnailModel thumbnailModel : thumbnails) {
            result.add(thumbnailModel.getImg());
        }
        return result;
    }
    
}
