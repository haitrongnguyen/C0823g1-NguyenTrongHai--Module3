package com.example.productmanagement.repository;

import com.example.productmanagement.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getAll();

    Product findById(int id);

    void editProduct(int id, String name, long price, String detail);

    void addNewProduct(Product product);

    void deleteProduct(int id);

    List<Product> findByName(String name);
}
