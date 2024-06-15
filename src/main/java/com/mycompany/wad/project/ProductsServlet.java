/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.wad.project;

import com.mycompany.wad.project.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
//page to display product
@WebServlet("/products")
public class ProductsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = new ArrayList<>();
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/project", "root", "password");
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM products");
            //Runs a loop for resultSet SQL query tp return all products in table
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductId(resultSet.getInt("product_id"));
                product.setProductName(resultSet.getString("product_name"));
                product.setPrice(resultSet.getDouble("price"));
                product.setProducer(resultSet.getString("producer"));
                product.setDescription(resultSet.getString("description"));
                product.setImageUrl(resultSet.getString("image_url"));
                product.setCategoryId(resultSet.getInt("category_id"));
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (resultSet != null) resultSet.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (statement != null) statement.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (connection != null) connection.close(); } catch (Exception e) { e.printStackTrace(); }
        }

        request.setAttribute("products", products);
        request.getRequestDispatcher("productPage.jsp").forward(request, response);
    }
}