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
    <title>Shopping Cart</title>
</head>
<body>
    <h1>Your Shopping Cart</h1>
    <ul>
        <%
            List<CartItem> cart = (List<CartItem>) request.getAttribute("cart");
            if (cart != null) {
                for (CartItem item : cart) {
        %>
            <li>
                <img src="<%= item.getProduct().getImageUrl() %>" alt="<%= item.getProduct().getProductName() %>" width="100" height="100"/>
                <h2><%= item.getProduct().getProductName() %></h2>
                <p><%= item.getProduct().getDescription() %></p>
                <p>Price: $<%= item.getProduct().getPrice() %></p>
                <p>Quantity: <%= item.getQuantity() %></p>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="update"/>
                    <input type="hidden" name="productId" value="<%= item.getProduct().getProductId() %>"/>
                    <input type="number" name="quantity" value="<%= item.getQuantity() %>"/>
                    <input type="submit" value="Update Quantity"/>
                </form>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="productId" value="<%= item.getProduct().getProductId() %>"/>
                    <input type="submit" value="Remove"/>
                </form>
            </li>
        <%
                }
            }
        %>
    </ul>
    <a href="products">Continue Shopping</a>
</body>
</html>