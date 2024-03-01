/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author nguyen phuoc chung
 */
public class OrdersAdmin {

    private int order_id;
    private int user_id;
    private Date order_date;
    private int year;
    private int month;
    private double totalPrice;

    public OrdersAdmin(int order_id, int user_id, Date order_date, double totalPrice) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.order_date = order_date;
        this.totalPrice = totalPrice;
    }

    public OrdersAdmin(int year, double totalPrice) {
        this.year = year;
        this.totalPrice = totalPrice;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public OrdersAdmin(int year, int month, double totalPrice) {
        this.year = year;
        this.month = month;
        this.totalPrice = totalPrice;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

}
