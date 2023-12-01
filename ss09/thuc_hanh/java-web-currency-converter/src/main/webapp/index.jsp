<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="/convert" method="get">
    <label>Rate: </label>
    <input type="text" name="rate" placeholder="rate" value="22000">
    <label>USD: </label>
    <input type="text" name="usd" placeholder="USD" value="0">
    <button type="submit" id="submit" value="Converter">Chuyển đổi</button>
</form>
</body>
</html>