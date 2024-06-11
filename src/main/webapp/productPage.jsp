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
    <meta charset="UTF-8">
    <title>Product Page</title>
</head>
<body>
    <h1>Products</h1>
    <ul>
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null) {
                for (Product product : products) {
        %>
            <li>
                <img src="<%= product.getImageUrl() %>" alt="<%= product.getProductName() %>" width="100" height="100"/>
                <h2><%= product.getProductName() %></h2>
                <p><%= product.getDescription() %></p>
                <p>Price: $<%= product.getPrice() %></p>
                <form action="cart" method="post">
                    <input type="hidden" name="productId" value="<%= product.getProductId() %>" />
                    <input type="submit" value="Add to Cart" />
                </form>
            </li>
        <%
                }
            }
        %>
    </ul>
</body>
</html>