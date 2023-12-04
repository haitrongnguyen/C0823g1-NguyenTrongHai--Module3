package com.example.demo.controllers;


import com.example.demo.model.Customer;
import com.example.demo.services.IService;
import com.example.demo.services.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/customer-servlet")
public class CustomerServlet extends HttpServlet {
    private IService service = new Service();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            default:
                showListCustomer(req,resp);
        }
    }

    private void showListCustomer(HttpServletRequest req, HttpServletResponse resp) {
        List<Customer> list = service.getAll();
        RequestDispatcher dispatcher = req.getRequestDispatcher("customer.jsp");
        req.setAttribute("list",list);
        try {
            dispatcher.forward(req,resp);
        } catch (ServletException e) {
            System.out.println(e.getMessage());;
        } catch (IOException e) {
            System.out.println(e.getMessage());;
        }
    }
}
