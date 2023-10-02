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
}
