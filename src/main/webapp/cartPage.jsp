<%-- 
    Document   : cart
    Created on : Jun 10, 2024, 11:56:42 PM
    Author     : Tran Tran
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.mycompany.wad.project.CartItem" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles/cartPage.css">
    <title>Shopping Cart</title>
</head>
<body>

<% String username = (String) session.getAttribute("username");
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
%>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="#">Emerce | Shopping Cart</a>
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
    <div class="container">
        <div class="row">
            <div class="col-1g-7">
                <h1>Shopping Cart</h1>
                <%
                    if (username != null) {
                %>


                <ul class="cart-items">
                    <% List<CartItem> cart = (List<CartItem>) request.getAttribute("cart"); if (cart != null) { for (CartItem item : cart) { %>
                    <li class="cart-item">
                        <div class="product-card">
                            <img src="<%= item.getProduct().getImageUrl() %>" alt="<%= item.getProduct().getProductName() %>" class="product-image">
                            <div class="product-info">
                                <h2 class="product-name"><%= item.getProduct().getProductName() %></h2>
                                <p class="product-description"><%= item.getProduct().getDescription() %></p>
                                <p class="product-price">Price: $<%= item.getProduct().getPrice() %></p>
                            </div>
                            <form action="cart" method="post" class="remove-form">
                                <input type="hidden" name="action" value="delete" />
                                <input type="hidden" name="productId" value="<%= item.getProduct().getProductId() %>" />
                                <button type="submit" class="remove-button">X</button>
                                    <i class="fas fa-times"></i>
                                </button>
                            </form>
                        </div>
                        <div class="cart-actions">
                            <form action="cart" method="post">
                                <input type="hidden" name="action" value="update" />
                                <input type="hidden" name="productId" value="<%= item.getProduct().getProductId() %>" />
                                <label for="quantity">Quantity:</label>
                                <input type="number" id="quantity" name="quantity" min="0" value="<%= item.getQuantity() %>" />
                                <input type="submit" value="Update" class="action-button">
                            </form>
                        </div>
                    </li>
                    <% } } %>
                    <div class="cart-buttons">
                        <a href="checkout.jsp">Checkout</a>
                        <a href="products">Continue Shopping</a>
                    </div>
                </ul>
                <%
                } else {
                %>
                <h2>You are not logged in.</h2>
                <a href="mainLogin.jsp">Go to Login Page</a>
                <a href="products">Go to product Page</a>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</section>


</body>
</html>


<%--<ul>--%>
<%--    &lt;%&ndash;get cart item data from session and store into an arraylist &ndash;%&gt;--%>
<%--    <%--%>
<%--        List<CartItem> cart = (List<CartItem>) request.getAttribute("cart");--%>
<%--        if (cart != null) {--%>
<%--            for (CartItem item : cart) {--%>
<%--    %>--%>
<%--    <li class="cart-item">--%>
<%--        <img src="<%= item.getProduct().getImageUrl() %>" alt="<%= item.getProduct().getProductName() %>"/>--%>
<%--        <div>--%>
<%--            <h2><%= item.getProduct().getProductName() %></h2>--%>
<%--            <p><%= item.getProduct().getDescription() %></p>--%>
<%--            <p>Price: $<%= item.getProduct().getPrice() %></p>--%>
<%--            <p>Quantity: <%= item.getQuantity() %></p>--%>
<%--            <div class="cart-actions">--%>
<%--                &lt;%&ndash;form that update the quantity of a unique item currently in cart &ndash;%&gt;--%>
<%--                <form action="cart" method="post">--%>
<%--                    <input type="hidden" name="action" value="update"/>--%>
<%--                    <input type="hidden" name="productId" value="<%= item.getProduct().getProductId() %>"/>--%>
<%--                    <input type="number" name="quantity" min="0" value="<%= item.getQuantity() %>"/>--%>
<%--                    <input type="submit" value="Update Quantity"/>--%>
<%--                </form>--%>
<%--                &lt;%&ndash;form that delete the item currently in cart &ndash;%&gt;--%>
<%--                <form action="cart" method="post">--%>
<%--                    <input type="hidden" name="action" value="delete"/>--%>
<%--                    <input type="hidden" name="productId" value="<%= item.getProduct().getProductId() %>"/>--%>
<%--                    <input type="submit" value="Remove"/>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </li>--%>
<%--    <%--%>
<%--            }--%>
<%--        }--%>
<%--    %>--%>
<%--    <a href="checkout.jsp">checkout</a>--%>
<%--    <a href="products">Continue Shopping</a>--%>
<%--</ul>--%>