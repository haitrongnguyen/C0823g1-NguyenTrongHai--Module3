package com.example.demo.services;

import com.example.demo.model.Customer;
import com.example.demo.repositories.IRepository;
import com.example.demo.repositories.Repository;

import java.util.List;

public class Service implements IService{
    private IRepository repository = new Repository();
    @Override
    public List<Customer> getAll() {
        return repository.getAll();
    }
}
