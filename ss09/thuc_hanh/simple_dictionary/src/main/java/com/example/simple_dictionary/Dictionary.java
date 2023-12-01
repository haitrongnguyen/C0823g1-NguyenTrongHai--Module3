package com.example.simple_dictionary;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "dictionary", value = "/dictionary")
public class Dictionary extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
        Map<String,String> map = new HashMap<>();
        Set<String> set = map.keySet();
        map.put("how","Thế nào");
        map.put("what","Cái gì");
        map.put("where","Ở đâu");
        String word = req.getParameter("word");
        String result = "";
//        PrintWriter printWriter = resp.getWriter();
//        printWriter.println("<html>");
//        String result = map.get(word);
//        if (result != null){
//            printWriter.println("<h2> Word: "+word+"</h2>");
//            printWriter.println("<h2> Result: "+result+"</h2>");
//        }else {
//            printWriter.println("Not Found");
//        }
//        printWriter.println("</html>");
        for (String s:set){
            if (word.equals(s)){
                result = map.get(s);
                break;
            }else {
                result = "Not Found";
                System.out.println(set);
            }
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/index.jsp");
        req.setAttribute("result",result);
        requestDispatcher.forward(req,resp);
    }

    public void destroy() {
    }
}