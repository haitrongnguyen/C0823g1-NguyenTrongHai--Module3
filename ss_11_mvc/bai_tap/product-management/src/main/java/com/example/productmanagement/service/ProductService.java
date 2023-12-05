package com.example.productmanagement.service;

import com.example.productmanagement.model.Product;
import com.example.productmanagement.repository.IProductRepository;
import com.example.productmanagement.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> getAll() {
        return productRepository.getAll();
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public void editProduct(int id, String name, long price, String detail) {
        productRepository.editProduct(id,name,price,detail);
    }

    @Override
    public void addNewProduct(Product product) {
        productRepository.addNewProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        productRepository.deleteProduct(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return productRepository.findByName(name);
    }
}
