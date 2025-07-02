<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
</head>
<body>
    <div>
        <h2>Đăng nhập</h2>
        <form action="LoginServlet" method="post">
            <label for="username">Tên đăng nhập:</label><br>
            <input type="text" id="username" name="username" required><br><br>
            <label for="password">Mật khẩu:</label><br>
            <input type="password" id="password" name="password" required><br><br>
            <input type="submit" value="Đăng nhập">
        </form>
        <% if (request.getAttribute("error") != null) { %>
            <p><%= request.getAttribute("error") %></p>
        <% } %>
    </div>
</body>
</html>