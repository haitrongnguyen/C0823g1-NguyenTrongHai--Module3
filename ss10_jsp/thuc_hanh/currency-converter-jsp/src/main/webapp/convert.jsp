<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 04/12/2023
  Time: 10:18 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Convert</title>
</head>
<body>
<%
    float rate = Float.parseFloat(request.getParameter("rate"));
    float usd = Float.parseFloat(request.getParameter("usd"));

    float vnd = rate * usd;
%>
<h1>Rate: <%=rate%>
</h1>
<h1>Usd: <%=usd%>
</h1>
<h1>Vnd: <%=vnd%>
</h1>
</body>
</html>
