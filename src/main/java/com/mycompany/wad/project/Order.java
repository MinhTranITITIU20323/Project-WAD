/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.wad.project;

/**
 *
 * @author Tran Tran
 */

//Class, getter and setter for orders table
import java.util.Date;

public class Order {
    private int orderId;
    private String username;
    private double totalPrice;
    private String email;
    private String address;
    private String phone;
    private Date orderDate;

    public Order() {
    }

    public Order(int orderId, String username, double totalPrice, String email, String address, String phone, Date orderDate) {
        this.orderId = orderId;
        this.username = username;
        this.totalPrice = totalPrice;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.orderDate = orderDate;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
}