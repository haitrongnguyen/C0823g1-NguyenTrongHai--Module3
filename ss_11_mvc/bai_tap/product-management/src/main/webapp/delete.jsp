<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 05/12/2023
  Time: 1:33 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="product-servlet">Danh sách sản phẩm</a>

<h3>Bạn muốn xóa ?</h3>
<form method="post">
    <fieldset>
        <legend>
            Thông tin sản phẩm
        </legend>
        <table>
            <tr>
                <td>Tên sản phẩm</td>
                <td>${product.name}</td>
            </tr>
            <tr>
                <td>Giá</td>
                <td>${product.price}</td>
            </tr>
            <tr>
                <td>Mô tả</td>
                <td>${product.detail}</td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Xóa"></td>
            </tr>
        </table>
    </fieldset>
</form>
<h5>${message}</h5>
</body>
</html>
