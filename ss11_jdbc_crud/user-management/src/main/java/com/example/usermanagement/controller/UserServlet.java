package com.example.usermanagement.controller;

import com.example.usermanagement.model.User;
import com.example.usermanagement.service.IUserService;
import com.example.usermanagement.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/user")
public class UserServlet extends HttpServlet {
    private IUserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                addNewUser(req,resp);
                break;
            case "edit":
                updateUser(req,resp);
                break;
            case "delete":
                deleteUser(req,resp);
                break;
            case "search":
                searchByName(req,resp);
                break;

        }

    }

    private void searchByName(HttpServletRequest req, HttpServletResponse resp) {
        String country = req.getParameter("country");
        List<User> users= userService.searchByName(country);
        RequestDispatcher dispatcher = req.getRequestDispatcher("search.jsp");
        if (users == null){
            req.setAttribute("message","Không có user tương tự");
            req.setAttribute("list",users);
        }else {
            req.setAttribute("list",users);
            req.setAttribute("message","Các user tương tự");
        }
        try {
            dispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
           e.printStackTrace();
        }

    }
    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.findById(id);
//        userService.deleteUser(id);
        userService.deleteUserCall(id);
        req.setAttribute("message","Xóa thành công người dùng "+user.getName());
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("delete.jsp");
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        User user = new User(id,name,email,country);
//        userService.updateUser(user);
        userService.updateUserCall(user);
        req.setAttribute("message", "Thay đổi thông tin người dùng "+name+" thành công!");
        RequestDispatcher dispatcher = req.getRequestDispatcher("edit.jsp");
        try {
            dispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addNewUser(HttpServletRequest req, HttpServletResponse resp) {
//        String name = req.getParameter("name");
//        String email = req.getParameter("email");
//        String country = req.getParameter("country");
//        User user = new User(name,email,country);
//        userService.addNewUser(user);
//        req.setAttribute("message", "Thêm người dùng "+name+" thành công");
//        RequestDispatcher dispatcher = req.getRequestDispatcher("create.jsp");
//                try {
//            dispatcher.forward(req,resp);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        try {
//            resp.sendRedirect("/user");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        User user = new User(name, email,country);
//        userService.insertUser(user);
        userService.addUserTransaction(user);
        RequestDispatcher dispatcher = req.getRequestDispatcher("create.jsp");
        req.setAttribute("message","Thêm mới thành công");
        try {
            dispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                showFormCreateUser(req,resp);
                break;
            case "edit":
                showFormEditUser(req,resp);
                break;
            case "delete":
                showFormDetailUser(req,resp);
                break;
            case "search":
                showFormSearchUser(req,resp);
                break;
            case "sort":
                showListUserSort(req,resp);
                break;
            case "test-without-tran":
                testWithoutTran(req, resp);
                break;
            default:
                showListUser(req,resp);
        }
    }

    private void testWithoutTran(HttpServletRequest req, HttpServletResponse resp) {
        userService.insertUpdateWithoutTransaction();
    }

    private void showListUserSort(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher dispatcher = req.getRequestDispatcher("list.jsp");
        List<User> users = userService.sortByName();
        req.setAttribute("list",users);
        try {
            dispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormSearchUser(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher dispatcher = req.getRequestDispatcher("search.jsp");
        try {
            dispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormDetailUser(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.findById(id);
        RequestDispatcher dispatcher;
        if (user == null){
            dispatcher = req.getRequestDispatcher("error-404.jsp");
        }else {
            req.setAttribute("user",user);
            dispatcher = req.getRequestDispatcher("delete.jsp");
            try {
                dispatcher.forward(req,resp);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showFormEditUser(HttpServletRequest req, HttpServletResponse resp) {
//        int id = Integer.parseInt(req.getParameter("id"));
//        User user = userService.findById(id);
//        RequestDispatcher dispatcher;
//        if (user == null){
//            dispatcher = req.getRequestDispatcher("error-404.jsp");
//        }else {
//            req.setAttribute("user",user);
//            dispatcher = req.getRequestDispatcher("edit.jsp");
//            try {
//                dispatcher.forward(req,resp);
//            } catch (ServletException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.getUserById(id);
        RequestDispatcher dispatcher;
        req.setAttribute("user",user);
        if (user == null){
            dispatcher = req.getRequestDispatcher("error-404.jsp");
            try {
                dispatcher.forward(req,resp);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            try {
                dispatcher = req.getRequestDispatcher("edit.jsp");
                dispatcher.forward(req,resp);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }


    private void showFormCreateUser(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher dispatcher = req.getRequestDispatcher("create.jsp");
        try {
            dispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListUser(HttpServletRequest req, HttpServletResponse resp) {
//        List<User> users = userService.getAll();
//        req.setAttribute("list",users);
//        RequestDispatcher dispatcher = req.getRequestDispatcher("list.jsp");
//        try {
//            dispatcher.forward(req,resp);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        List<User> users = userService.getAllCall();
        req.setAttribute("list",users);
        RequestDispatcher dispatcher = req.getRequestDispatcher("list.jsp");
        try {
            dispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
