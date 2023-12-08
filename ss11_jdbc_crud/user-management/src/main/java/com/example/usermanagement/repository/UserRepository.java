package com.example.usermanagement.repository;

import com.example.usermanagement.model.User;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
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
    private static final String GET_USER_BY_ID = "call get_user_by_id(?);";
    private static final String INSERT_USER = "call insert_user(?,?,?)";
    private static final String SQL_INSERT = "INSERT INTO EMPLOYEE (NAME, SALARY, CREATED_DATE) VALUES (?,?,?)";
    private static final String SQL_UPDATE = "UPDATE EMPLOYEE SET SALARY=? WHERE NAME=?";
    private static final String SQL_TABLE_CREATE = "CREATE TABLE EMPLOYEE"
            + "("
            + " ID serial,"
            + " NAME varchar(100) NOT NULL,"
            + " SALARY numeric(15, 2) NOT NULL,"
            + " CREATED_DATE timestamp,"
            + " PRIMARY KEY (ID)"
            + ")";
    private static final String SQL_TABLE_DROP = "DROP TABLE IF EXISTS EMPLOYEE";

    private static final String SHOW_LIST = "call show_list();";
    private static final String UPDATE_CALL = "call edit_user(?,?,?,?)";
    private static final String DELETE_CALL = "call delete_user(?)";


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

    @Override
    public User getUserById(int id) {
        Connection connection = BaseRepository.getConnection();
        User user = null;
        CallableStatement statement = null;
        try {
            statement = connection.prepareCall(GET_USER_BY_ID);
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
        }finally {
            try {
                connection.close();
                assert statement != null;
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user;
    }

    @Override
    public void insertUser(User user) {
        Connection connection = BaseRepository.getConnection();
        CallableStatement statement = null;
        try {
            statement = connection.prepareCall(INSERT_USER);
            statement.setString(1,user.getName());
            statement.setString(2,user.getEmail());
            statement.setString(3,user.getCountry());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                connection.close();
                assert statement != null;
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }


        }
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            PreparedStatement psInsert = connection.prepareStatement(SQL_INSERT);
            PreparedStatement psUpdate = connection.prepareStatement(SQL_UPDATE);
            statement.executeUpdate(SQL_TABLE_DROP);
            statement.executeUpdate(SQL_TABLE_CREATE);

            psInsert.setString(1,"Quynh");
            psInsert.setBigDecimal(2,new BigDecimal(10));
            psInsert.setTimestamp(3,Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();

            psInsert.setString(1,"Ngan");
            psInsert.setBigDecimal(2,new BigDecimal(20));
            psInsert.setTimestamp(3,Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();

            psUpdate.setBigDecimal(2,new BigDecimal(999.99));
//            psUpdate.setBigDecimal(1,new BigDecimal(999.99));
            psUpdate.setString(2,"Quynh");
            psUpdate.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> getAllCall() {
        Connection connection = BaseRepository.getConnection();
        List<User> users = new ArrayList<>();
        CallableStatement statement = null;
        try {
             statement = connection.prepareCall(SHOW_LIST);
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
        }finally {
            try {
                connection.close();
                assert statement != null;
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        return users;
    }

    @Override
    public void updateUserCall(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement statement = connection.prepareCall(UPDATE_CALL);
            statement.setString(1,user.getName());
            statement.setString(2,user.getEmail());
            statement.setString(3,user.getCountry());
            statement.setInt(4,user.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteUserCall(int id) {
        Connection connection = BaseRepository.getConnection();
        CallableStatement statement = null;
        try {
            statement = connection.prepareCall(DELETE_CALL);
            statement.setInt(1,id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                connection.close();
                assert statement != null;
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }

    @Override
    public void addUserTransaction(User user) {
        Connection connection = BaseRepository.getConnection();
        Savepoint savepoint = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            connection.setAutoCommit(false);
            savepoint = connection.setSavepoint("sp1");
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            try {
                System.out.println("Transaction error");

                connection.rollback(savepoint);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            ex.printStackTrace();
        }
    }
}
