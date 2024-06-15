<%--&lt;%&ndash; --%>
<%--    Document   : product--%>
<%--    Created on : Jun 10, 2024, 11:53:09 PM--%>
<%--    Author     : Tran Tran--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ page import="java.util.*, com.mycompany.wad.project.Product" %>--%>
<%--<%@ page session="true" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>--%>
<%--    <link rel="preconnect" href="https://fonts.googleapis.com">--%>
<%--    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>--%>
<%--    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">--%>
<%--    <link rel="stylesheet" href="styles/productPage.css">--%>
<%--    <title>Product Page</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Products</h1>--%>
<%--<div class="product-grid">--%>
<%--    &lt;%&ndash;get the data sent from request.getRequestDispatcher("productPage.jsp").forward(request, response) into a list.  &ndash;%&gt;--%>
<%--    &lt;%&ndash; and then prints products out in a loop&ndash;%&gt;--%>
<%--    <%--%>
<%--        List<Product> products = (List<Product>) request.getAttribute("products");--%>

<%--        if (products != null) {--%>
<%--            for (Product product : products) {--%>
<%--    %>--%>
<%--    <div class="product-card">--%>
<%--        <img src="<%= product.getImageUrl() %>" alt="<%= product.getProductName() %>" class="product-image"/>--%>
<%--        <h2 class="product-name"><%= product.getProductName() %></h2>--%>
<%--        <p class="product-description"><%= product.getDescription() %></p>--%>
<%--        <p class="product-price">Price: $<%= product.getPrice() %></p>--%>
<%--        &lt;%&ndash; This form adds items to cart, sends the productId of the chosen product using a post method &ndash;%&gt;--%>
<%--        <form action="cart" method="post" class="add-to-cart-form">--%>
<%--            <input type="hidden" name="productId" value="<%= product.getProductId() %>" />--%>
<%--        </form>--%>
<%--        <input type="submit" value="Add to Cart" class="btn btn-primary" />--%>
<%--    </div>--%>
<%--    <%--%>
<%--            }--%>
<%--        }--%>
<%--    %>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>


<%--
    Document   : product
    Created on : Jun 10, 2024, 11:53:09 PM
    Author     : Tran Tran
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.mycompany.wad.project.Product" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles/productPage.css">
    <title>Product Page</title>
</head>
<body>

<% String username = (String) session.getAttribute("username");
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    %>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="#">Emerce | Products</a>
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
                <%--                <li class="nav-item">--%>
                <%--                    <a class="nav-link dropdown-toggle" href="#">Link</a>--%>
                <%--                </li>--%>
                <li class="nav-item">
                    <a class="nav-link" href="cartPage.jsp">View Cart</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="px-2 search" type="search" placeholder="Search" aria-label="Search">
                <button class="btn0" type="submit">Search</button>
            </form>
            <div class="login-status">
                <%
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
    <br>
    <div class="container">
        <div class="row">
            <div class="col-1g-7">
<%--                <h1>Products</h1>--%>
                <div class="product-grid">
                    <%--get the data sent from request.getRequestDispatcher("productPage.jsp").forward(request, response) into a list.  --%>
                    <%-- and then prints products out in a loop--%>
                    <%
                        List<Product> products = (List<Product>) request.getAttribute("products");

                        if (products != null) {
                            for (Product product : products) {
                    %>
                        <a href="#" onclick="addToCart('<%= product.getProductId() %>')" class="product-card">
                            <div class="product-card-inner">
                                <img src="<%= product.getImageUrl() %>" alt="<%= product.getProductName() %>" class="product-image"/>
                                <h2 class="product-name"><%= product.getProductName() %></h2>
                                <p class="product-description"><%= product.getDescription() %></p>
                                <p class="product-price">Price: $<%= product.getPrice() %></p>
                                <div class="add-to-cart-button">Add to Cart</div>
                            </div>
                        </a>

<%--                        <a href="cart" class="checkout-button">--%>
<%--                            Checkout--%>
<%--                        </a>--%>

                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</section>


<script src="JS/productPage.js"></script>

</body>
</html>