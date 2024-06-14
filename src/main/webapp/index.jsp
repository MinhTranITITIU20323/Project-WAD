<%-- 
    Document   : index
    Created on : Jun 8, 2024, 2:28:08 AM
    Author     : Tran Tran
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
    </head>
    <body>
        <h1>WELCOME TO STORE PAGE</h1>
        <%
            String username = (String) session.getAttribute("username");
            Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
            if (username != null) {
        %>
        <h2>Welcome, <%= username %>!</h2>
        <%
            if (isAdmin != null && isAdmin) {
        %>
        <h3>You are logged in as an admin.</h3>
        <a href="manageUsers.jsp">Manage Users</a>
        <%
            } else {
        %>
        <h3>You are logged in as a regular user.</h3>
        
        <%
            }
        %>
        <a href="logout">Logout</a>
        
        <%
            } else {
        %>
        <h2>You are not logged in.</h2>
        <a href="mainLogin.jsp">Go to Login Page</a>
        
        <%
            }
        %>
        <a href="products">Go to product Page</a>
    </body>
</html>
