package com.example.customermanagement.service;

import com.example.customermanagement.model.Customer;

import java.util.List;

public interface CustomerService {
    Customer findById(int id);

    List<Customer> findAll();

    void save(Customer customer);

    void update(int id, Customer customer);

    void remove(int id);
}
