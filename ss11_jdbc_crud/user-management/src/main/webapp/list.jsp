<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 07/12/2023
  Time: 3:24 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách</title>
</head>
<body>
<center>
    <a href="/user?action=create">Thêm mới user</a>
    <a href="/user?action=search">Tìm kiếm theo country</a>
    <a href="/user?action=sort">Sắp xếp</a>
</center>


<div style="text-align: center;"><h3>Danh sách User</h3></div>
<div align="center">
    <table border="1">
        <tr>
            <th>STT</th>
            <th>Tên</th>
            <th>Email</th>
            <th>Địa chỉ</th>
            <th>Chỉnh sửa</th>
            <th>Xóa</th>
        </tr>
        <c:forEach items="${list}" var="user" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td><a href="/user?action=edit&id=${user.id}">Sửa</a></td>
                <td><a href="/user?action=delete&id=${user.id}">Xóa</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
<p>${ms}</p>
</body>
</html>
