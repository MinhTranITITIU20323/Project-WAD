<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.mycompany.wad.project.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<%-- page that handles showing order of a user --%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles/orderInfo.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order Information</title>
</head>
<body>
<%--    <h1>Order Information</h1>--%>
<%--    <%--%>
<%--        String username = (String) session.getAttribute("username");--%>
<%--        if (username == null) {--%>
<%--    %>--%>
<%--        <h2>You are not logged in.</h2>--%>
<%--        <a href="mainLogin.jsp">Go to Login Page</a>--%>
<%--    <%--%>
<%--        } else {--%>
<%--            List<Order> orders = (List<Order>) request.getAttribute("orders");--%>
<%--            List<OrderItem> orderItems = (List<OrderItem>) request.getAttribute("orderItems");--%>

<%--            if (orders != null && !orders.isEmpty()) {--%>
<%--    %>--%>
<%--        <h2>Orders for <%= username %></h2>--%>
<%--        <%--%>
<%--            for (Order order : orders) {--%>
<%--        %>--%>
<%--        <h3>Order ID: <%= order.getOrderId() %></h3>--%>
<%--        <p>Total Price: <%= order.getTotalPrice() %></p>--%>
<%--        <p>Order Date: <%= order.getOrderDate() %></p>--%>
<%--        <p>Shipping Address: <%= order.getAddress() %></p>--%>
<%--        <p>Email: <%= order.getEmail() %></p>--%>
<%--        <p>Phone: <%= order.getPhone() %></p>--%>
<%--        <h4>Items:</h4>--%>
<%--        <ul>--%>
<%--            <%--%>
<%--                for (OrderItem orderItem : orderItems) {--%>
<%--                    if (orderItem.getOrderId() == order.getOrderId()) {--%>
<%--            %>--%>
<%--            <li>Product: <%= orderItem.getProductName() %>, Quantity: <%= orderItem.getQuantity() %>, Price: <%= orderItem.getPrice() %></li>--%>
<%--            <%--%>
<%--                    }--%>
<%--                }--%>
<%--            %>--%>
<%--        </ul>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
<%--    <%--%>
<%--            } else {--%>
<%--    %>--%>
<%--        <h2>No orders found for <%= username %></h2>--%>
<%--    <%--%>
<%--            }--%>
<%--        }--%>
<%--    %>--%>

<nav class="navbar navbar-expand-lg transparent">
    <div class="container">
        <a class="navbar-brand" href="#">Emerce | Orders</a>
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
                    <a class="nav-link dropdown-toggle" href="orderInfo.jsp">Orders</a>
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

                    <div class="order-container">
<%--                        <h1>Order Information</h1>--%>
                        <%

                            if (username == null) {
                        %>
                        <div class="login-prompt">
                            <h2>You are not logged in.</h2>
                            <a href="mainLogin.jsp" class="login-link">Go to Login Page</a>
                        </div>
                        <%
                        } else {
                            List<Order> orders = (List<Order>) request.getAttribute("orders");
                            List<OrderItem> orderItems = (List<OrderItem>) request.getAttribute("orderItems");

                            if (orders != null && !orders.isEmpty()) {
                        %>
                        <h1>Orders for <%= username %></h1>
                        <div class="orders-list">
                            <%
                                for (Order order : orders) {
                            %>
                            <div class="order-box">
                                <h3>Order ID: <%= order.getOrderId() %></h3>
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
                            </div>
                            <%
                                }
                            %>
                        </div>
                        <%
                        } else {
                        %>
                        <h2>No orders found for <%= username %></h2>
                        <%
                                }
                            }
                        %>


                    </div>
            </div>
        </div>
        </div>
    </section>


</body>
</html>