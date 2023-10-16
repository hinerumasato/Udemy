package com.servlet.Udemy.services;

import java.util.List;

public interface IService<T> {
    public List<T> findAll();
    public T findById(int id);
    public T findLast();
    public T findFirst();
    public void insert(T model);
    public void update(T model);
    public void delete(int id);
}
