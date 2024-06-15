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
    <meta charset="UTF-8">
    <title>Checkout</title>
</head>
<body>
    <h1>Checkout</h1>
    <ul>
        <%
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            double totalPrice = 0;
            if (cart != null) {
                for (CartItem item : cart) {
                    totalPrice += item.getProduct().getPrice() * item.getQuantity();
        %>
            <li>
                <%= item.getProduct().getProductName() %> - Quantity: <%= item.getQuantity() %> - Price: $<%= item.getProduct().getPrice() %>
            </li>
        <%
                }
            }
        %>
    </ul>
    <h2>Total Price: $<%= totalPrice %></h2>
    <form action="checkout" method="post">
        <input type="submit" value="Confirm and Checkout">
    </form>
    <a href="cart">Go back to Cart</a>
    
</body>
</html>
