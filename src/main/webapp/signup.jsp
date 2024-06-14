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
            Name: <input type="text" name="name" required><br>
            DOB: <input type="date" name ="DOB" required><br>
            Address: <input type="text" name="address" required><br>
            Email: <input type="email" name="email" required><br>
            Phone: <input type="text" name="phone"required><br>
            <input type="submit" value="Sign Up">
        </form>
        <a href="index.jsp">Already have an account? Login here!</a>
    </body>
</html>
