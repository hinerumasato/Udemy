package com.servlet.Udemy.services;

import java.util.List;

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
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
    }

    @Override
    public void delete(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'delete'");
    }
}
