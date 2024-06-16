<%-- 
    Document   : checkout
    Created on : Jun 14, 2024, 10:30:07 PM
    Author     : Tran Tran
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.mycompany.wad.project.CartItem" %>
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
    <link rel="stylesheet" href="styles/index.css">
    <title>Checkout</title>
    <link rel="stylesheet" type="text/css" href="styles/checkout.css">
</head>
<body>
<%--
    Document   : checkout
    Created on : Jun 14, 2024, 10:30:07 PM
    Author     : Tran Tran
--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ page import="java.util.*, com.mycompany.wad.project.CartItem" %>--%>
<%--<%@ page session="true" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Checkout</title>--%>
<%--    <link rel="stylesheet" type="text/css" href="styles.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="checkout-container">--%>
<%--    <h1 class="checkout-title">Checkout</h1>--%>
<%--    <ul class="cart-items">--%>
<%--        <%--%>
<%--            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");--%>
<%--            double totalPrice = 0;--%>
<%--            if (cart != null) {--%>
<%--                for (CartItem item : cart) {--%>
<%--                    totalPrice += item.getProduct().getPrice() * item.getQuantity();--%>
<%--        %>--%>
<%--        <li class="cart-item">--%>
<%--            <%= item.getProduct().getProductName() %> - Quantity: <%= item.getQuantity() %> - Price: $<%= item.getProduct().getPrice() %>--%>
<%--        </li>--%>
<%--        <%--%>
<%--                }--%>
<%--            }--%>
<%--        %>--%>
<%--    </ul>--%>
<%--    <h2 class="total-price">Total Price: $<%= totalPrice %></h2>--%>
<%--    <form class="checkout-form" action="checkout" method="post">--%>
<%--        <input type="submit" class="checkout-button" value="Confirm and Checkout">--%>
<%--    </form>--%>
<%--    <a class="cart-link" href="cart">Go back to Cart</a>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>


<body>

<nav class="navbar navbar-expand-lg transparent">
    <div class="container">
        <a class="navbar-brand" href="#">Emerce | Checkout</a>
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

                <div class="checkout-container">
                    <h1 class="checkout-title">Checkout</h1>
                    <ul class="cart-items">
                        <%
                            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
                            double totalPrice = 0;
                            if (cart != null) {
                                for (CartItem item : cart) {
                                    totalPrice += item.getProduct().getPrice() * item.getQuantity();
                        %>
                        <li class="cart-item">
                            <%= item.getProduct().getProductName() %> - Quantity: <%= item.getQuantity() %> - Price: $<%= item.getProduct().getPrice() %>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>
                </div>
                <div class="footer">
                    <h2 class="total-price">Total Price: $<%= totalPrice %></h2>
                    <form action="checkout" method="post">
                        <input type="submit" class="checkout-btn" value="Confirm and Checkout">
                    </form>
                    <a href="cart" class="back-cart">Go back to Cart</a>
                </div>

            </div>
        </div>
    </div>
</section>

</body>
</html>







