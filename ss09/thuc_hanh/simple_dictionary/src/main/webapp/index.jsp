<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>JSP - Hello World</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<form action="/dictionary" name="dictionary" method="post">
    <label for="word">Nhập từ cần dịch</label>
    <input id="word" type="text" name="word" placeholder="Nhập từ cần dịch">
    <button type="submit">Dịch</button>
</form>
result: ${result}
</body>
</html>