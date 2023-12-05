<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 05/12/2023
  Time: 11:34 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="product-servlet">Danh sách sản phẩm</a>
<%--<jsp:include page="list.jsp">Danh sách sản phẩm</jsp:include>--%>
<h3>Thêm sản phẩm mới</h3>
<h5>${message}</h5>
<form method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Tên sản phẩm</td>
                <td><input name="name" id="name" type="text" placeholder="Nhập tên"></td>
            </tr>
            <tr>
                <td>Giá sản phẩm</td>
                <td><input name="price" id="price" type="text" value="0"></td>
            </tr>
            <tr>
                <td>Mô tả sản phẩm</td>
                <td><input name="detail" id="detail" type="text" placeholder="Nhập mô tả"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Lưu"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
