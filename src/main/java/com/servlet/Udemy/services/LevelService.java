package com.servlet.Udemy.services;

import java.util.List;
import java.util.Map;

import com.servlet.Udemy.DAO.LevelDAO;
import com.servlet.Udemy.models.LevelModel;

public class LevelService implements IService<LevelModel> {

    private LevelDAO levelDAO = new LevelDAO("levels");

    @Override
    public List<LevelModel> findAll() {
        return levelDAO.findAll();
    }

    @Override
    public LevelModel findById(int id) {
        return levelDAO.findById(id);
    }

    @Override
    public void insert(LevelModel model) {
        levelDAO.insert(model);
    }

    @Override
    public void update(LevelModel model) {
        levelDAO.update(model);
    }

    @Override
    public void delete(int id) {
        levelDAO.delete(id);
    }

    @Override
    public LevelModel findLast() {
        return levelDAO.findLast();
    }

    @Override
    public LevelModel findFirst() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findFirst'");
    }

    @Override
    public IService<LevelModel> paginate(int page, int limit) {
        return levelDAO.paginate(this, page, limit);
    }

    @Override
    public List<LevelModel> findByMap(Map<String, String> findMap) {
        return levelDAO.findByMap(findMap);
    }
}
