/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.wad.project;

/**
 *
 * @author Tran Tran
 */


public class CartItem {
    private int id;
    private String name;
    private double price;
    private String description;
    private String producer;
    private String imageUrl;
    private String category;
    private int quantity;

    public CartItem(int id, String name, double price, String description, String producer, String imageUrl, String category, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.producer = producer;
        this.imageUrl = imageUrl;
        this.category = category;
        this.quantity = quantity;
    }

    // Getters and setters for each field
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public String getProducer() {
        return producer;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public String getCategory() {
        return category;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}