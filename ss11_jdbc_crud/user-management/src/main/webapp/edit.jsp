<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 07/12/2023
  Time: 5:32 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/user">Danh sách người dùng</a>
<div style="text-align: center;">Chỉnh sửa thông tin người dùng</div>
<div align="center">
    <form method="post">
        <fieldset>
            <legend>thông tin chi tiết</legend>
            <table>
                <tr>
                    <th>Tên</th>
                    <td><input name="name" value="${user.name}"></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><input name="email" value="${user.email}"></td>
                </tr>
                <tr>
                    <th>Địa chỉ</th>
                    <td><input name="country" value="${user.country}"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Lưu thay đổi"></td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>

<h4>${message}</h4>
</body>
</html>
