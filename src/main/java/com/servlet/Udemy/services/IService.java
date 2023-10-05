package com.servlet.Udemy.services;

import java.util.List;

public interface IService<T> {
    public List<T> findAll();
    public T findById(int id);
    public void insert(T model);
}