<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<form action="/display-discount" method="post">
    <label for="detail">Mô tả sản phẩm</label><br>
    <input id="detail" type="text" name="detail"><br>

    <label for="price">Giá niêm yết sản phẩm</label><br>
    <input id="price" type="text" name="price"><br>

    <label for="percent">Tỉ lệ chiết khấu</label><br>
    <input id="percent" type="text" name="percent"><br>

    <button type="submit"> Calculate Discount</button>
</form>
</body>
</html>