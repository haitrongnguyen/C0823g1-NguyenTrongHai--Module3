<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 05/12/2023
  Time: 1:59 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Chi tiết
    </title>
</head>
<body>
<a href="product-servlet">Danh sách sản phẩm</a>

<form>
    <fieldset>
        <legend>Chi tiết sản phẩm</legend>
        <table border="1px">
            <tr>
                <th>Tên Sản Phẩm</th>
                <th>Giá sản phẩm</th>
                <th>Mô tả Sản Phẩm</th>
            </tr>
            <tr>
                <th>${product.name}</th>
                <th>${product.price}</th>
                <th>${product.detail}</th>
            </tr>
        </table>
    </fieldset>

</form>
</body>
</html>
