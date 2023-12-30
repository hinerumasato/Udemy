package com.servlet.Udemy.services;

import java.util.List;
import java.util.Map;

public interface IService<T> {
    public List<T> findAll();
    public T findById(int id);
    public T findLast();
    public T findFirst();
    public List<T> findByMap(Map<String, String> findMap);
    public void insert(T model);
    public void update(T model);
    public void delete(int id);
    public IService<T> paginate(int page, int limit);
}
