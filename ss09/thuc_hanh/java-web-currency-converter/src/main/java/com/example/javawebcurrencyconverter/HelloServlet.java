package com.example.javawebcurrencyconverter;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/convert")
public class HelloServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        float rate = Float.parseFloat(request.getParameter("rate"));
        float usd = Float.parseFloat(request.getParameter("usd"));
        float result = rate*usd;

        PrintWriter printWriter = response.getWriter();
        printWriter.println("<html>");
        printWriter.println("<h1>Rate: "+rate+"</h1>");
        printWriter.println("<h1>USD = "+usd+"</h1>");
        printWriter.println("<h1>VND: "+result+"</h1>");
        printWriter.println("</html>");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        float rate = Float.parseFloat(req.getParameter("rate"));
        float usd = Float.parseFloat(req.getParameter("usd"));
        float result = rate*usd;

        PrintWriter printWriter = resp.getWriter();
        printWriter.println("<html>");
        printWriter.println("<h1>Rate: "+rate+"</h1>");
        printWriter.println("<h1>USD = "+usd+"</h1>");
        printWriter.println("<h1>VND: "+result+"</h1>");
        printWriter.println("</html>");
    }

    public void destroy() {
    }
}