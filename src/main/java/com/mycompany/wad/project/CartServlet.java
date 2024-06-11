/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.wad.project;

import com.mycompany.wad.project.CartItem;
import com.mycompany.wad.project.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("cartPage.jsp").forward(request, response);
    }
    //this function handles form actions made in cart and used as a switch
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "update":
                updateCart(request);
                break;
            case "delete":
                deleteFromCart(request);
                break;
            default:
                addToCart(request);
                break;
        }

        response.sendRedirect("cart");
    }
    
    //function that adds selected item to cart by using a intiialized session element
    private void addToCart(HttpServletRequest request) {
        //get selected product id
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = getProductById(productId);

        if (product != null) {
            HttpSession session = request.getSession();
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            //Initialize a List of items for the cart
            if (cart == null) {
                cart = new ArrayList<>();
            }
            boolean found = false;
            for (CartItem item : cart) {
                if (item.getProduct().getProductId() == product.getProductId()) {
                    item.setQuantity(item.getQuantity() + 1);
                    found = true;
                    break;
                }
            }
            //check if product is unique in cart, if yes, product is added to cart list
            if (!found) {
                cart.add(new CartItem(product, 1));
            }
            session.setAttribute("cart", cart);
        }
    }
    //this function update the item quantity
    private void updateCart(HttpServletRequest request) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            for (CartItem item : cart) {
                if (item.getProduct().getProductId() == productId) {
                    if (quantity > 0) {
                        item.setQuantity(quantity);
                    } else {
                        cart.remove(item);
                    }
                    break;
                }
            }
        }
    }
    //this function delete items from cart
    private void deleteFromCart(HttpServletRequest request) {
        int productId = Integer.parseInt(request.getParameter("productId"));

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            cart.removeIf(item -> item.getProduct().getProductId() == productId);
        }
    }
    //this function runs when accessing the cart page.
    private Product getProductById(int productId) {
        Product product = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            //database handler
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "password");
            statement = connection.prepareStatement("SELECT * FROM products WHERE product_id = ?");
            statement.setInt(1, productId);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                product = new Product();
                product.setProductId(resultSet.getInt("product_id"));
                product.setProductName(resultSet.getString("product_name"));
                product.setPrice(resultSet.getDouble("price"));
                product.setProducer(resultSet.getString("producer"));
                product.setDescription(resultSet.getString("description"));
                product.setImageUrl(resultSet.getString("image_url"));
                product.setCategoryId(resultSet.getInt("category_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (resultSet != null) resultSet.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (statement != null) statement.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (connection != null) connection.close(); } catch (Exception e) { e.printStackTrace(); }
        }

        return product;
    }
}