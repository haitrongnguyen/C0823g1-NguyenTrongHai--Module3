<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 05/12/2023
  Time: 10:17 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<%--<jsp:include page="list.jsp">Danh sách sản phẩm</jsp:include>--%>
<h5><a href="/product?action=create">Thêm sản phẩm</a></h5>
<h5><a href="/product?action=search">Tìm kiếm sản phẩm</a></h5>
<table class="table">
    <tr>
        <th>Stt</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Chỉnh sửa</th>
        <th>Xóa</th>
        <th>Chi tiết</th>
    </tr>
    <c:forEach items="${list}" var="product" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.detail}</td>
            <td><a href="/product?action=edit&id=${product.id}">Sửa</a></td>
            <td><a href="/product?action=delete&id=${product.id}">Xóa</a></td>
            <td><a href="/product?action=detail&id=${product.id}">Chi tiết</a></td>
        </tr>
    </c:forEach>
</table>
<h5>${requestScope["message"]}</h5>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
