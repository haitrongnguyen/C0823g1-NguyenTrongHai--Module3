<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 04/12/2023
  Time: 10:32 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dịch</title>
</head>
<body>
<%!
    Map<String,String> dic = new HashMap<>();
%>
<%
    dic.put("what","cái gì");
    dic.put("how","thế nào");
    dic.put("where","ở đâu");
    String word = request.getParameter("word");
    String result = dic.get(word);
    if (result != null){

    }
%>
</body>
</html>
