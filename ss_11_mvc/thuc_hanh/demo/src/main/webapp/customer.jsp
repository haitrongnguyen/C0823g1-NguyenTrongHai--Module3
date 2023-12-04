<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 04/12/2023
  Time: 4:53 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1px">
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Email</th>
        <th>Địa chỉ</th>
        <th>Chỉnh sửa</th>
        <th>Xóa</th>
    </tr>
    <c:forEach items="${list}" var="customer" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${customer.name}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td><a href="">Edit</a></td>
            <td><a href="">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
