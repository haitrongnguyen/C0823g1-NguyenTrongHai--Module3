package com.example.usermanagement.repository;

import com.example.usermanagement.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> getAll();

    void addNewUser(User user);

    User findById(int id);

    void updateUser(User user);

    void deleteUser(int id);

    List<User> searchByName(String country);

    List<User> sortByName();
}
