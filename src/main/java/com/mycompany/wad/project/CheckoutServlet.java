/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.wad.project;

/**
 *
 * @author Tran Tran
 */


import com.mycompany.wad.project.CartItem;
import com.mycompany.wad.project.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html");
        
        //Get the session object. Don't touch it since it breaks if it hates you.
        HttpSession session = request.getSession(false);
        //Failstate check if there's a session where user is logged in
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("mainLogin.jsp");
            return;
        }
        
        String username = (String) session.getAttribute("username");
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        // Database connection setup
        String dbURL = "jdbc:mysql://localhost:3306/project";
        String dbUser = "root";
        String dbPassword = "password";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Get user details
            String userSql = "SELECT * FROM users WHERE usersName = ?";
            PreparedStatement userStatement = conn.prepareStatement(userSql);
            userStatement.setString(1, username);
            ResultSet userResultSet = userStatement.executeQuery();
            //Failstate and redirect for if user is not logged in
            if (!userResultSet.next()) {
                response.sendRedirect("mainLogin.jsp");
                return;
            }
            //Getting users data
            int userId = userResultSet.getInt("usersID");
            String shippingAddress = userResultSet.getString("usersAddress");
            String shippingEmail = userResultSet.getString("usersEmail");
            String shippingPhone = userResultSet.getString("usersPhone");

            // Get cart details from session
            if (cart == null || cart.isEmpty()) {
                response.sendRedirect("cartPage.jsp");
                return;
            }
            
            // Calculate total price of cart
            double totalPrice = 0;
            if (cart != null) {
                for (CartItem item : cart) {
                    totalPrice += item.getProduct().getPrice() * item.getQuantity();
                }
            }
            //Save order to orders database
            String orderSql = "INSERT INTO orders (user_id, total_price, shipping_address, shipping_email, shipping_phone) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement orderStatement = conn.prepareStatement(orderSql);
            orderStatement.setInt(1, userId);
            orderStatement.setDouble(2, totalPrice);
            orderStatement.setString(3, shippingAddress);
            orderStatement.setString(4, shippingEmail);
            orderStatement.setString(5, shippingPhone);
            orderStatement.executeUpdate();
            
            //Function that gets the newest generated order_id. This mess works, please don't touch it.
            int orderID = 0;
            String sql = "SELECT order_id FROM orders ORDER BY order_id DESC LIMIT 1";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                orderID = resultSet.getInt("order_id");
            }
            
            //Query to insert into order_items, use a loop to iterate through CartItem item arraylist to get every itemid in cart
            String orderItemsSql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            PreparedStatement orderItemStatement = conn.prepareStatement(orderItemsSql);
            for (CartItem item : cart) {
                orderItemStatement.setInt(1,orderID);
                orderItemStatement.setInt(2, item.getProduct().getProductId());
                orderItemStatement.setInt(3,item.getQuantity());
                orderItemStatement.setDouble(4,item.getProduct().getPrice());
                orderItemStatement.executeUpdate();
            }

            //Clear the cart
            session.removeAttribute("cart");

            //Forward to confirmation page
            request.setAttribute("totalPrice", totalPrice);
            request.setAttribute("shippingAddress", shippingAddress);
            request.setAttribute("shippingEmail", shippingEmail);
            request.setAttribute("shippingPhone", shippingPhone);
            request.getRequestDispatcher("orderConfirmation.jsp").forward(request, response);

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

