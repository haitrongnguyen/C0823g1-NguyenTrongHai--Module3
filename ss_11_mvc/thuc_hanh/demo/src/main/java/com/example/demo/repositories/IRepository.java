package com.example.demo.repositories;

import com.example.demo.model.Customer;

import java.util.List;

public interface IRepository {
    List<Customer> getAll();
}
