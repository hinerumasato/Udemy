package com.servlet.Udemy.services;

import java.util.List;

import com.servlet.Udemy.DAO.LevelDAO;
import com.servlet.Udemy.models.LevelModel;

public class LevelService {

    private LevelDAO levelDAO = new LevelDAO("levels");

    public List<LevelModel> findAll() {
        return levelDAO.findAll();
    }

    public LevelModel findById(int id) {
        return levelDAO.findById(id);
    }
}
