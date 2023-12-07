package com.example.usermanagement.repository;

import com.example.usermanagement.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository{
    private static final String SELECT_ALL_USERS = "select * from user";
    private static final String INSERT = "insert into user(name, email, country)\n" +
            "values (?,?,?);";
    private static final String SELECT = "select id,name,email,country from user where id = ?;";
    private static final String UPDATE = "update user set name = ?,email = ?, country = ? where id = ?";
    private static final String DELETE = "delete from user where id = ?";
    private static final String SELECT_BY_NAME = "select id,name,email,country from user where country like ?";
    private static final String SORT = "select * from user order by name";

    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = BaseRepository.getConnection();
            preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
            ResultSet resultSet = preparedStatement.executeQuery();
            int id;
            String name;
            String email;
            String country;
            while (resultSet.next()){
                id = resultSet.getInt("id");
                name = resultSet.getString("name");
                email = resultSet.getString("email");
                country = resultSet.getString("country");
                users.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                assert connection != null;
                connection.close();
                assert preparedStatement != null;
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        return users;
    }

    @Override
    public void addNewUser(User user) {
        System.out.println(INSERT);
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User findById(int id) {
        Connection connection = BaseRepository.getConnection();
        User user = null;
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT);
            statement.setInt(1,id);
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();
            String name;
            String email;
            String country;
            while (resultSet.next()){
                name = resultSet.getString("name");
                email = resultSet.getString("email");
                country = resultSet.getString("country");
                user = new User(id,name,email,country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void updateUser(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(UPDATE);
            statement.setString(1, user.getName());
            statement.setString(2,user.getEmail());
            statement.setString(3,user.getCountry());
            statement.setInt(4,user.getId());
            System.out.println(statement);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteUser(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(DELETE);
            statement.setInt(1,id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> searchByName(String country) {
        Connection connection = BaseRepository.getConnection();
        List<User> users = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_BY_NAME);
            statement.setString(1,"%"+country+"%");
            ResultSet resultSet = statement.executeQuery();
            String name;
            String email;
            int id;
            while (resultSet.next()){
                id = resultSet.getInt("id");
                name = resultSet.getString("name");
                email = resultSet.getString("email");
                country = resultSet.getString("country");
                users.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public List<User> sortByName() {
        Connection connection = BaseRepository.getConnection();
        List<User> users = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(SORT);
            ResultSet resultSet = statement.executeQuery();
            int id;
            String name;
            String email;
            String country;
            while (resultSet.next()){
                id = resultSet.getInt("id");
                name = resultSet.getString("name");
                email = resultSet.getString("email");
                country = resultSet.getString("country");
                users.add(new User(id,name,email,country));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
}
