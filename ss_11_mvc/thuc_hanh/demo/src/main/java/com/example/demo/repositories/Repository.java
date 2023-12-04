package com.example.demo.repositories;

import com.example.demo.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class Repository implements IRepository{
    private static List<Customer> list = new ArrayList<>();
    static {
        list.add(new Customer(1, "John", "john@codegym.vn", "Hanoi"));
        list.add(new Customer(2, "Bill", "bill@codegym.vn", "Danang"));
        list.add(new Customer(3, "Alex", "alex@codegym.vn", "Saigon"));
        list.add(new Customer(4, "Adam", "adam@codegym.vn", "Beijin"));
        list.add(new Customer(5, "Sophia", "sophia@codegym.vn", "Miami"));
        list.add(new Customer(6, "Rose", "rose@codegym.vn", "Newyork"));

    }
    @Override
    public List<Customer> getAll() {
        return list;
    }
}
