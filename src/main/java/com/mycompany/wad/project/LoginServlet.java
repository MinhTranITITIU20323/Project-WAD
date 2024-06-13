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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Database connection setup
        String dbURL = "jdbc:mysql://127.0.0.1:3306/project";
        String dbUser = "root";
        String dbPassword = "password";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            String sql = "SELECT * FROM users WHERE usersName = ? AND usersPassword = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                boolean isAdmin = resultSet.getBoolean( "is_admin");

                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("isAdmin", isAdmin);
                Cookie loginCookie = new Cookie("username", username);
                loginCookie.setMaxAge(30 * 60);
                response.addCookie(loginCookie);
                

                response.sendRedirect("index.jsp");
            } else {
                PrintWriter out = response.getWriter();
                out.println("Invalid username or password");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
