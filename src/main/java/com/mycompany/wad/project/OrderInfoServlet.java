/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.wad.project;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/orderInfo")
public class OrderInfoServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("mainLogin.jsp");
            return;
        }
        //Initiate ArrayLists of orders and order_items
        List<Order> orders = new ArrayList<>();
        List<OrderItem> orderItems = new ArrayList<>();

        String dbURL = "jdbc:mysql://localhost:3306/project";
        String dbUser = "root";
        String dbPassword = "password";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
                //This is the query that get info from orders for the specific user.
                String orderSql = "SELECT * FROM orders, users WHERE users.usersID=orders.user_id and usersName = ?";
                PreparedStatement orderStatement = conn.prepareStatement(orderSql);
                orderStatement.setString(1, username);
                ResultSet orderResultSet = orderStatement.executeQuery();
                
                while (orderResultSet.next()) {
                    int orderId = orderResultSet.getInt("order_id");
                    double totalPrice = orderResultSet.getDouble("total_price");
                    String email = orderResultSet.getString("shipping_email");
                    String address = orderResultSet.getString("shipping_address");
                    String phone = orderResultSet.getString("shipping_phone");
                    Date orderDate = orderResultSet.getDate("order_date");
                    
                    Order order = new Order(orderId, username, totalPrice, email, address, phone, orderDate);
                    orders.add(order);
                    //This is the query that get order.
                    String itemSql = "SELECT * FROM order_items oi JOIN products p ON oi.product_id = p.product_id WHERE order_id = ?";
                    PreparedStatement itemStatement = conn.prepareStatement(itemSql);
                    itemStatement.setInt(1, orderId);
                    ResultSet itemResultSet = itemStatement.executeQuery();
                    
                    while (itemResultSet.next()) {
                        int orderItemId = itemResultSet.getInt("order_item_id");
                        int productId = itemResultSet.getInt("product_id");
                        int quantity = itemResultSet.getInt("quantity");
                        double price = itemResultSet.getDouble("price");
                        String productName = itemResultSet.getString("product_name");
                        
                        OrderItem orderItem = new OrderItem(orderItemId, orderId, productId, quantity, price);
                        orderItem.setProductName(productName); 
                        orderItems.add(orderItem);
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("orders", orders);
        request.setAttribute("orderItems", orderItems);
        request.getRequestDispatcher("orderInfo.jsp").forward(request, response);
    }
}
