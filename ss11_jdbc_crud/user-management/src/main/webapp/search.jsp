<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 07/12/2023
  Time: 6:32 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/user">Danh sách người dùng</a>
<center>
    <form method="post">
        <fieldset>
            <legend>Tìm kiếm người dùng</legend>
            <table>
                <tr>
                    <th><label for="country">Nhập country muốn tìm kiếm</label></th>
                    <td><input id="country" name="country" value="Viet Nam"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Tìm kiếm"></td>
                </tr>
            </table>
        </fieldset>
    </form>
</center>
    <h5>Người dùng có country tương tự</h5>
    <table>
        <tr>
            <th>STT</th>
            <th>Tên</th>
            <th>Email</th>
            <th>Country</th>
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
</body>
</html>
