<%-- 
    Document   : cart
    Created on : Jun 10, 2024, 11:56:42 PM
    Author     : Tran Tran
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.mycompany.wad.project.Product" %>
<%@ page session="true" %>
<html>
<head>
    <title>Shopping Cart</title>
    <style>
        .product {
            border: 1px solid #ddd;
            padding: 16px;
            margin: 16px;
            width: 300px;
            display: inline-block;
            vertical-align: top;
        }
        .product img {
            max-width: 100%;
            height: auto;
        }
        .product h2 {
            font-size: 20px;
            margin: 0;
        }
        .product p {
            margin: 8px 0;
        }
        .product .price {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Shopping Cart</h1>
    <%
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart != null && !cart.isEmpty()) {
            for (Product product : cart) {
    %>
                <div class="product">
                    <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                    <h2><%= product.getName() %></h2>
                    <p class="price">$<%= product.getPrice() %></p>
                    <p><%= product.getDescription() %></p>
                    <p><strong>Producer:</strong> <%= product.getProducer() %></p>
                    <p><strong>Category:</strong> <%= product.getCategory() %></p>
                    <form action="Cart" method="get">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <input type="submit" value="Remove from Cart">
                    </form>
                </div>
    <%
            }
        } else {
    %>
            <p>Your cart is empty.</p>
    <%
        }
    %>
    <a href="Product">Continue Shopping</a>
</body>
</html>