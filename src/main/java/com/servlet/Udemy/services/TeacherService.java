package com.servlet.Udemy.services;

import java.util.List;
import java.util.Map;

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
    public boolean insert(TeacherModel model) {
        return teacherDAO.insert(model);
    }

    @Override
    public boolean update(TeacherModel model) {
        return teacherDAO.update(model);
    }

    @Override
    public boolean delete(int id) {
        return teacherDAO.delete(id);
    }

    @Override
    public IService<TeacherModel> paginate(int page, int limit) {
        return teacherDAO.paginate(this, page, limit);
    }

    @Override
    public List<TeacherModel> findByMap(Map<String, String> findMap) {
        return teacherDAO.findByMap(findMap);
    }
    
}
