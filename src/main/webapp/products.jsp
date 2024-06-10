<%-- 
    Document   : product
    Created on : Jun 10, 2024, 11:53:09 PM
    Author     : Tran Tran
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.mycompany.wad.project.Product" %>
<%@ page session="true" %>
<html>
<head>
    <title>Product List</title>
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
    <h1>Product List</h1>
    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        if (products != null) {
            for (Product product : products) {
    %>
                <div class="product">
                    <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                    <h2><%= product.getName() %></h2>
                    <p class="price">$<%= product.getPrice() %></p>
                    <p><%= product.getDescription() %></p>
                    <p><strong>Producer:</strong> <%= product.getProducer() %></p>
                    <p><strong>Category:</strong> <%= product.getCategory() %></p>
                    <form action="Cart" method="post">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <input type="submit" value="Add to Cart">
                    </form>
                </div>
    <%
            }
        } else {
    %>
            <p>No products available.</p>
    <%
        }
    %>
    <a href="Cart?action=view">View Cart</a>
</body>
</html>