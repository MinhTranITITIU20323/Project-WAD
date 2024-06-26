<%-- 
    Document   : adminOrder
    Created on : Jun 21, 2024, 12:10:35 AM
    Author     : Tran Tran
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.mycompany.wad.project.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<%-- page that handles showing order of a user --%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order Information</title>
</head>
<body>
    <h1>Order Information</h1>
    <%
        String username = (String) session.getAttribute("username");
        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
        if (username == null || isAdmin == null || !isAdmin) {
    %>
        <h2>You are not logged in and/or an admin.</h2>
        <a href="mainLogin.jsp">Go to Login Page</a>
    <%
        } else {
            List<Order> orders = (List<Order>) request.getAttribute("orders");
            List<OrderItem> orderItems = (List<OrderItem>) request.getAttribute("orderItems");

            if (orders != null && !orders.isEmpty()) {
    %>
        <h2>Orders from database </h2>
        <%
            for (Order order : orders) {
        %>
        <h3>Order ID: <%= order.getOrderId() %></h3>
        <h3>Order User: <%= order.getUsername() %></h3>
        <p>Total Price: <%= order.getTotalPrice() %></p>
        <p>Order Date: <%= order.getOrderDate() %></p>
        <p>Shipping Address: <%= order.getAddress() %></p>
        <p>Email: <%= order.getEmail() %></p>
        <p>Phone: <%= order.getPhone() %></p>
        <h4>Items:</h4>
        <ul>
            <%
                for (OrderItem orderItem : orderItems) {
                    if (orderItem.getOrderId() == order.getOrderId()) {
            %>
            <li>Product: <%= orderItem.getProductName() %>, Quantity: <%= orderItem.getQuantity() %>, Price: <%= orderItem.getPrice() %></li>
            <%
                    }
                }
            %>
        </ul>
        <%
            }
        %>
    <%
            } else {
    %>
        <h2>No orders found for <%= username %></h2>
    <%
            }
        }
    %>
</body>
</html>