<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 04/12/2023
  Time: 11:10 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách khách hàng</title>
</head>
<body>
<table border="1px" width="100%" style="text-align: center;" cellspacing="0">
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa Chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach items="${list}" var="customer" varStatus="loop">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.dateOfBirth}</td>
            <td>${customer.address}</td>
            <td><img src="${customer.picture}" alt=""></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
