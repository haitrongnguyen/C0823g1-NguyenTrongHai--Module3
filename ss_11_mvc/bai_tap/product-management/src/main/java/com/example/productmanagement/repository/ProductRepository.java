package com.example.productmanagement.repository;

import com.example.productmanagement.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> products = new ArrayList<>();

    static {
        products.add(new Product(1, "Mì tôm", 15000, "Đồ ăn liền"));
        products.add(new Product(2, "Cháo", 10000, "Đồ ăn liền"));
        products.add(new Product(3, "Miến", 13000, "Đồ ăn liền"));
        products.add(new Product(4, "Hủ Tiếu", 18000, "Đồ ăn liền"));
        products.add(new Product(5, "Phở", 17000, "Đồ ăn liền"));
    }

    @Override
    public List<Product> getAll() {
        return products;
    }

    @Override
    public Product findById(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void editProduct(int id, String name, long price, String detail) {
        for (Product product : products) {
            if (product.getId() == id) {
                product.setName(name);
                product.setPrice(price);
                product.setDetail(detail);
            }
        }
    }

    @Override
    public void addNewProduct(Product product) {
        products.add(product);
    }

    @Override
    public void deleteProduct(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                products.remove(product);
                break;
            }
        }
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> products1 = new ArrayList<>();
        for (Product product : products) {
            if (product.getName().toLowerCase().contains(name.toLowerCase())) {
                products1.add(product);
            }
        }
        return products1;
    }
}
