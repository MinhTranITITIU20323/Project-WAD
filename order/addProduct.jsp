<%-- 
    Document   : addProduct
    Created on : Jun 16, 2024, 3:50:08 AM
    Author     : Tran Tran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
    </head>
    <body>
        <h1>Add New Product</h1>
        <form action="addProduct" method="post">
            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName" required><br><br>

            <label for="price">Price:</label>
            <input type="number" step="0.01" id="price" name="price" required><br><br>

            <label for="producer">Producer:</label>
            <input type="text" id="producer" name="producer" required><br><br>

            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea><br><br>

            <label for="imageUrl">Image URL:</label>
            <input type="url" id="imageUrl" name="imageUrl" required><br><br>

            <label for="categoryId">Category ID:</label>
            <input type="number" id="categoryId" name="categoryId" required><br><br>

            <input type="submit" value="Add Product">
        </form>
    </body>
</html>
