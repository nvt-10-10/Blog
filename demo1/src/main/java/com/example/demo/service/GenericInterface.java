package com.example.demo.service;


import java.util.List;
import java.util.Optional;

public interface GenericInterface<T> {
    List<T>  findAll();
    Optional<T> findById(int id);
    T save(T t);
    void saveAll(List<T> tList);
    void deleteById(int id);
}
