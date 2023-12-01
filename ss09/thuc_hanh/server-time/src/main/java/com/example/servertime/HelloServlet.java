package com.example.servertime;

import java.io.*;
import java.util.Date;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(urlPatterns = "/index",name = "helloServlet", value = "/index.jsp")
public class HelloServlet extends HttpServlet {
//    private String message;
//
//    public void init() {
//        message = "Hello World!";
//    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter printWriter = response.getWriter();
        Date today = new Date();
        printWriter.println("<h1>" + today+"</h1>");
    }

    public void destroy() {
    }
}