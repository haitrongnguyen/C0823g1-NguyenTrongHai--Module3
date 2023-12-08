package com.example.usermanagement.service;

import com.example.usermanagement.model.User;

import java.util.List;

public interface IUserService {
    List<User> getAll();

    void addNewUser(User user);

    User findById(int id);

    void updateUser(User user);

    void deleteUser(int id);

    List<User> searchByName(String country);

    List<User> sortByName();

    User getUserById(int id);

    void insertUser(User user);

    void insertUpdateWithoutTransaction();

    List<User> getAllCall();

    void updateUserCall(User user);

    void deleteUserCall(int id);

    void addUserTransaction(User user);
}
