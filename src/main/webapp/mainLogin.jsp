<%-- 
    Document   : login
    Created on : Jun 7, 2024, 2:04:22 AM
    Author     : Tran Tran
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
</head>
<body>
    <%--Form to handle login--%>
    <h2>Login</h2>
    <form action="login" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>
    <a href="signup.jsp">Go to Signup Page</a>
    <a href="products">Go to product Page</a>
</body>
</html>