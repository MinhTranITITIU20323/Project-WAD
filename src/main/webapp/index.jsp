<%-- 
    Document   : index
    Created on : Jun 8, 2024, 2:28:08 AM
    Author     : Tran Tran
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles/index.css">
    <title>Homepage!</title>
</head>
<body>
<%--<h1>Welcome to Emerce</h1>     Dont need--%>

<nav class="navbar navbar-expand-lg transparent">
    <div class="container">
        <a class="navbar-brand" href="#">Emerce</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav m-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a href="products" class="nav-link">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" href="orderInfo">Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cartPage.jsp">View Cart</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="px-2 search" type="search" placeholder="Search" aria-label="Search">
                <button class="btn0" type="submit">Search</button>
            </form>
            <div class="login-status">
                <% String username = (String) session.getAttribute("username");
                    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
                    if (username != null) { %>
                <h8 class="welcome-message">Welcome, <%= username %>!</h8>
                <% if (isAdmin != null && isAdmin) { %>
                <h8 class="admin-message">You are logged in as an admin.</h8>
                <a href="manageUsers.jsp">Manage Users</a>
                <% } else { %>
                <h8 class="user-message">You are logged in as a regular user.</h8>
                <% } %>
                <a href="logout">Logout</a>
                <% } else { %>
                <h8 class="not-logged-in">You are not logged in.</h8>
                <a href="mainLogin.jsp">Go to Login Page</a>
                <% } %>
            </div>
        </div>
    </div>
</nav>



    <section class="main">
       <div class="container">
         <div class="row">
              <div class="col-1g-7">
                <h1>Welcome to our page</h1>
             </div>
         </div>
     </div>
     </section>

<%------------------------------------------------------------------------------------------------------------------------------------%>
<%--This part below already modified and put in nav bar, but I still keep this in case somthing wrong when you do backend-T.Huy--%>

<%--<%--%>
<%--    String username = (String) session.getAttribute("username");--%>
<%--    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");--%>
<%--    if (username != null) {--%>
<%--%>--%>
<%--<h2>Welcome, <%= username %>!</h2>--%>
<%--<%--%>
<%--    if (isAdmin != null && isAdmin) {--%>
<%--%>--%>
<%--<h3>You are logged in as an admin.</h3>--%>
<%--<<a href="manageUsers.jsp">Manage Users</a>--%>
<%--<%--%>
<%--} else {--%>
<%--%>--%>
<%--<h3>You are logged in as a regular user.</h3>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>
<%--<a href="logout">Logout</a>--%>
<%--<%--%>
<%--} else {--%>
<%--%>--%>
<%--<div class="top-right-corner">--%>
<%--<h8>You are not logged in.</h8>--%>
<%--<a href="mainLogin.jsp">Go to Login Page</a>--%>
<%--</div>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>
<%------------------------------------------------------------------------------------------------------------------------------------%>




</body>
</html>