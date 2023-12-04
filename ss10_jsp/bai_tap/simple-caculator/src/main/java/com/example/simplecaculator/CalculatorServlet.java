package com.example.simplecaculator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/calculator-servlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double firstNum = Double.parseDouble(req.getParameter("firstNum"));
        double secondNum = Double.parseDouble(req.getParameter("secondNum"));
        double result = 0;
        String operator = req.getParameter("operator");
        switch (operator) {
            case "sum":
                result = firstNum + secondNum;
                operator = "+";
                break;
            case "sub":
                result = firstNum - secondNum;
                operator = "-";
                break;
            case "mul":
                result = firstNum * secondNum;
                operator = "*";
                break;
            case "div":
                result = firstNum / secondNum;
                operator = "/";
                break;
        }
//        RequestDispatcher requestDispatcher = req.getRequestDispatcher("result.jsp");
        if (operator.equals("/") && secondNum == 0) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("error.jsp");
            req.setAttribute("error", "Không thể chia cho 0");
            requestDispatcher.forward(req,resp);
        }else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
            req.setAttribute("firstNum", firstNum);
            req.setAttribute("operator", operator);
            req.setAttribute("secondNum", secondNum);
            req.setAttribute("result", result);
            requestDispatcher.forward(req, resp);
        }

    }
}
