package com.example.productmanagement.model;

public class Product {
    private int id;
    private String name;
    private long price;
    private String detail;

    public Product() {
    }

    public Product(int id, String name, long price, String detail) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.detail = detail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
