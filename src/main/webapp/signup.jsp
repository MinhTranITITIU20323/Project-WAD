<%-- 
    Document   : signup
    Created on : Jun 8, 2024, 3:44:13 AM
    Author     : Tran Tran
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign-Up Page</title>
</head>
<body>
    <h2>Sign Up</h2>
    <form action="signup" method="post">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Sign Up">
    </form>
    <a href="index.jsp">Already have an account? Login here!</a>
</body>
</html>