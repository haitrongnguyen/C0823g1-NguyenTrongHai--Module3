package com.example.customerdisplay;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/customer-servlet")

public class CustomerServlet extends HttpServlet {
    private static List<Customer> customers = new ArrayList<>();

    static {
        customers.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://tse4.mm.bing.net/th?id=OIP.dIF3iIIIuK5HeBCq_aoxZwHaH8&pid=Api&P=0&h=180"));
        customers.add(new Customer("Nguyễn Văn Nam", "1983-08-20", "Hà Nội", "https://tse4.mm.bing.net/th?id=OIP.dIF3iIIIuK5HeBCq_aoxZwHaH8&pid=Api&P=0&h=180"));
        customers.add(new Customer("Nguyễn Thái Hòa", "1983-08-20", "Hà Nội", "https://tse4.mm.bing.net/th?id=OIP.dIF3iIIIuK5HeBCq_aoxZwHaH8&pid=Api&P=0&h=180"));
        customers.add(new Customer("Trần Đăng Khoa", "1983-08-20", "Hà Nội", "https://tse4.mm.bing.net/th?id=OIP.dIF3iIIIuK5HeBCq_aoxZwHaH8&pid=Api&P=0&h=180"));
        customers.add(new Customer("Nguyễn Đình Thi", "1983-08-20", "Hà Nội", "https://tse4.mm.bing.net/th?id=OIP.dIF3iIIIuK5HeBCq_aoxZwHaH8&pid=Api&P=0&h=180"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("customer.jsp");
        req.setAttribute("list", customers);
        requestDispatcher.forward(req, resp);
    }
}
