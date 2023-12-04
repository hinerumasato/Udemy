package com.servlet.Udemy.services;

import java.util.List;

import com.servlet.Udemy.DAO.TeacherDAO;
import com.servlet.Udemy.models.TeacherModel;

public class TeacherService implements IService<TeacherModel> {

    private TeacherDAO teacherDAO = new TeacherDAO("teachers");

    @Override
    public List<TeacherModel> findAll() {
        return teacherDAO.findAll();
    }

    @Override
    public TeacherModel findById(int id) {
        return teacherDAO.findById(id);
    }

    @Override
    public TeacherModel findLast() {
        return teacherDAO.findLast();
    }

    @Override
    public TeacherModel findFirst() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findFirst'");
    }

    @Override
    public void insert(TeacherModel model) {
        teacherDAO.insert(model);
    }

    @Override
    public void update(TeacherModel model) {
        teacherDAO.update(model);
    }

    @Override
    public void delete(int id) {
        teacherDAO.delete(id);
    }
    
}
