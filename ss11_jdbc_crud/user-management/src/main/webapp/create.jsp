<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 07/12/2023
  Time: 4:02 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/user">Danh sách</a>
<form method="post">
    <fieldset>
        <legend>
            Thêm mới user
        </legend>
        <table>
            <tr>
                <th>Tên</th>
                <td><input type="text" name="name" placeholder="Nhập tên"></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><input type="text" name="email" placeholder="Nhập email"></td>
            </tr>
            <tr>
                <th>Địa chỉ</th>
                <td><input type="text" name="country" placeholder="Nhập địa chỉ"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Lưu"></td>
            </tr>
        </table>
    </fieldset>
</form>
<h4>${message}</h4>
</body>
</html>
