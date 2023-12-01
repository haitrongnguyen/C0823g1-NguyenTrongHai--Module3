package com.example.productdiscountcalculator;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/display-discount")
public class ProductDiscountCalculator extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        req.setCharacterEncoding("UTF-8");
        String detail = req.getParameter("detail");
        double price = Double.parseDouble(req.getParameter("price"));
        double percent = Double.parseDouble(req.getParameter("percent"));
        double amount = price * percent * 0.01;
        double discountPrice = price - amount;
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/index.jsp");
        req.setAttribute("detail", detail);
        req.setAttribute("price", price);
        req.setAttribute("percent", percent);
        req.setAttribute("amount", amount);
        req.setAttribute("discountPrice", discountPrice);
        requestDispatcher.forward(req, resp);
    }

    public void destroy() {
    }
}