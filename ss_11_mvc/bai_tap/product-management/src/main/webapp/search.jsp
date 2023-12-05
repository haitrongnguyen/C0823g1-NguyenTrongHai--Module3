<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 05/12/2023
  Time: 2:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="product-servlet">Danh sách sản phẩm</a>

<form method="post">
    <fieldset>
        <legend>
            Tìm Kiếm
        </legend>
        <label for="name">Nhập tên sản phẩm muốn tìm</label>
        <input type="text" name="name" id="name" placeholder="Enter the product name">
        <input type="submit" value="Tìm kiếm">
    </fieldset>
</form>
<h3>Sản phẩm tìm được: </h3>
<c:if test="${list != null}">
    <table>
        <tr>
            <th>STT</th>
            <th>Tên sản phẩm</th>
            <th>Giá sản phẩm</th>
            <th>Mô tả sản phẩm</th>
        </tr>
        <c:forEach items="${list}" var="product" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.detail}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${list == null}">
    <h5>Không có sản phẩm tương tự</h5>
</c:if>

</body>
</html>
