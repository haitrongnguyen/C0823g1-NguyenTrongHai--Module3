package com.example.usermanagement.service;

import com.example.usermanagement.model.User;
import com.example.usermanagement.repository.IUserRepository;
import com.example.usermanagement.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService{
    private IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> getAll() {
        return userRepository.getAll();
    }

    @Override
    public void addNewUser(User user) {
        userRepository.addNewUser(user);
    }

    @Override
    public User findById(int id) {
        return userRepository.findById(id);
    }

    @Override
    public void updateUser(User user) {
        userRepository.updateUser(user);
    }

    @Override
    public void deleteUser(int id) {
        userRepository.deleteUser(id);
    }

    @Override
    public List<User> searchByName(String country) {
        return userRepository.searchByName(country);
    }

    @Override
    public List<User> sortByName() {
        return userRepository.sortByName();
    }
}
