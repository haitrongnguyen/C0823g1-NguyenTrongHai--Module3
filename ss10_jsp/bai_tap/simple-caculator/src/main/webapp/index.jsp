<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Máy tính</title>
</head>
<body>
<h1>Máy tính đơn giản</h1>
<form action="/calculator-servlet" method="post">
    <fieldset>
        <legend>Calculator</legend>
        <table style="border: 1px solid black">
            <tr>
                <td><label for="firstNum">Số thứ nhất</label></td>
                <td><input id="firstNum" type="number" name="firstNum"><br></td>
            </tr>
            <tr>
                <td><label for="operator">Operator</label></td>
                <td><select id="operator" name="operator">
                    <option value="sum">Cộng</option>
                    <option value="sub">Trừ</option>
                    <option value="mul">Nhân</option>
                    <option value="div">Chia</option>
                </select>
                </td>
            </tr>
            <tr>
                <td><label for="secondNum">Số thứ hai</label></td>
                <td><input id="secondNum" type="number" name="secondNum"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Tính"></td>
            </tr>
        </table>
    </fieldset>
</form>
<br>
<h3>Kết quả: </h3>
<c:if test="${result != null}">
    <h4>${firstNum} ${operator} ${secondNum} = ${result} </h4>
</c:if>
</body>
</html>