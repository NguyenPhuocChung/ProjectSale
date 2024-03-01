/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.DBConnection;
import Model.Account;
import Model.Cart;
import Model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nguyen phuoc chung
 */
public class cartDAO {

    Connection conn;

    public cartDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(cartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ResultSet getCart(int id) {

        try {
            //Tao doi tuong truy van
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Cart where user_id=?");
            //Thuc thi truy van 
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(cartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public Cart addCart(Cart c) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO Cart  (product_id, name, picture, description, price, stock_quantity, category_id, user_id)\n"
                    + "VALUES(?,?,?,?,?,?,?,?)");
            ps.setInt(1, c.getProduct_id());
            ps.setString(2, c.getName());
            ps.setString(3, c.getPicture());
            ps.setString(4, c.getDescription());
            ps.setString(5, c.getPrice());
            ps.setInt(6, 1);
            ps.setInt(7, c.getCategory());
            ps.setInt(8, c.getUser_id());
            int count = ps.executeUpdate();
            return (count == 0) ? null : c;
        } catch (SQLException ex) {
            Logger.getLogger(cartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void delete(int product_id) {
        try {
            PreparedStatement ps = conn.prepareStatement("delete from Cart where product_id=?");
            ps.setInt(1, product_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(cartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void minus(int product_id, Product price) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Cart\n"
                    + "SET stock_quantity = stock_quantity - 1,\n"
                    + "    price = price - ? \n"
                    + "WHERE product_id = ?;");
            ps.setString(1, price.getPrice());
            ps.setInt(2, product_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(cartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void plus(int product_id, Product price) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Cart\n"
                    + "SET stock_quantity = stock_quantity + 1,\n"
                    + "    price = price + ? \n"
                    + "WHERE product_id = ?;");
            ps.setString(1, price.getPrice());
            ps.setInt(2, product_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(cartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Cart getSumPrice(int user_id) {
        Cart c = null;
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT SUM(price) AS total_price\n"
                    + "FROM Cart where user_id=?");
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new Cart(rs.getInt("total_price"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(cartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;

    }

    public ResultSet getALlCart(int user_id, int product_id) {

        try {
            //Tao doi tuong truy van

            PreparedStatement ps = conn.prepareStatement("select * from Cart where user_id=? and product_id=?");
            //Thuc thi truy van 
            ps.setInt(1, user_id);
            ps.setInt(2, product_id);
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(HistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

}
