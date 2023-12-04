<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
</head>
<body>
<form action="convert.jsp" method="post">
    <label for="rate">Tỉ giá</label>
    <input type="text" name="rate" id="rate" value="22000" placeholder="Rate">
    <label for="usd">USD</label>
    <input type="text" name="usd" id="usd" value="0" placeholder="usd">
    <input type="submit" id="submit" value="Chuyển đổi">
</form>
</body>
</html>