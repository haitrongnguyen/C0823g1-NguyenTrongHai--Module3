<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 05/12/2023
  Time: 10:40 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="product-servlet">Danh sách sản phẩm</a>

<h3>Chỉnh sửa thông tin</h3>
<form method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Tên sản phẩm</td>
                <td><input name="name" id="name" type="text" value="${requestScope["product"].getName()}"></td>
            </tr>
            <tr>
                <td>Giá sản phẩm</td>
                <td><input name="price" id="price" type="text" value="${requestScope["product"].getPrice()}"></td>
            </tr>
            <tr>
                <td>Mô tả sản phẩm</td>
                <td><input name="detail" id="detail" type="text" value="${requestScope["product"].getDetail()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Lưu"></td>
            </tr>
        </table>
    </fieldset>
</form>
<h5>${message}</h5>
</body>
</html>
