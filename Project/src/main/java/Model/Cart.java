/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author nguyen phuoc chung
 */
public class Cart {

    private int user_id;
    private int product_id;
    private String name;
    private String picture;
    private String description;
    private String price;
    private int stock_quantily;
    private int category;
    private double total_price;

    public Cart(int user_id, int product_id, String name, String picture, String description, String price, int stock_quantily, int category) {
        this.user_id = user_id;
        this.product_id = product_id;
        this.name = name;
        this.picture = picture;
        this.description = description;
        this.price = price;
        this.stock_quantily = stock_quantily;
        this.category = category;
    }

    public Cart(int user_id, int product_id, int stock_quantily, double total_price) {
        this.user_id = user_id;
        this.product_id = product_id;
        this.stock_quantily = stock_quantily;
        this.total_price = total_price;
    }

    public Cart(double total_price) {
        this.total_price = total_price;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }


    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getStock_quantily() {
        return stock_quantily;
    }

    public void setStock_quantily(int stock_quantily) {
        this.stock_quantily = stock_quantily;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

}
