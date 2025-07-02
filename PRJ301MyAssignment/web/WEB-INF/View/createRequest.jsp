<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tạo đơn xin nghỉ phép</title>
</head>
<body>
    <div>
        <h2>Tạo đơn xin nghỉ phép</h2>
        <form action="CreateRequestServlet" method="post">
            <label for="startDate">Từ ngày:</label><br>
            <input type="date" id="startDate" name="startDate" required><br><br>
            <label for="endDate">Đến ngày:</label><br>
            <input type="date" id="endDate" name="endDate" required><br><br>
            <label for="reason">Lý do:</label><br>
            <textarea id="reason" name="reason" rows="4" cols="50" required></textarea><br><br>
            <input type="submit" value="Gửi đơn">
        </form>
    </div>
</body>
</html>