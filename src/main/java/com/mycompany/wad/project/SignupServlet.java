/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.wad.project;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Database connection setup
        String dbURL = "jdbc:mysql://localhost:3306/project";
        String dbUser = "root";
        String dbPassword = "password";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            
            String checkUserSql = "SELECT * FROM users WHERE usersName = ?";
            PreparedStatement checkUserStatement = conn.prepareStatement(checkUserSql);
            checkUserStatement.setString(1, username);
            ResultSet resultSet = checkUserStatement.executeQuery();
            
            if (resultSet.next()) {
                PrintWriter out = response.getWriter();
                out.println("Username already exists. Please choose a different username.");
            } else {
                String sql = "INSERT INTO users (usersName, usersPassword) VALUES (?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, username);
                statement.setString(2, password);
                
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    response.sendRedirect("index.jsp");
                } else {
                    PrintWriter out = response.getWriter();
                    out.println("An error occurred. Please try again.");
                }
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}