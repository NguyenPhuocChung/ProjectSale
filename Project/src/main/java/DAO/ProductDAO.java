/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.DBConnection;
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
public class ProductDAO {

    Connection conn;

    public ProductDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
// information product. 

    public ResultSet getAll() {
        try {
            //Tao doi tuong truy van
            Statement st = conn.createStatement();
            //Thuc thi truy van 
            ResultSet rs = st.executeQuery("select * from Products");
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
//search

    public ResultSet getProduct(String word) {

        try {
            //Tao doi tuong truy van

            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Products WHERE name LIKE ?");
            //Thuc thi truy van 
            ps.setString(1, "%" + word + "%");
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ResultSet getProduct_id(int id) {

        try {
            //Tao doi tuong truy van

            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Products WHERE product_id=?");
            //Thuc thi truy van 
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ResultSet getWater(int cate) {
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM  Products where category_id=?");
            ps.setInt(1, cate);
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ResultSet getQuanAo(int cate) {
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM  Products  where category_id=?");
            ps.setInt(1, cate);
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ResultSet getTBGD(int cate) {
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM  Products  where category_id=? ");
            ps.setInt(1, cate);
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ResultSet getBanh(int cate) {

        try {
            //Tao doi tuong truy van

            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Products where category_id=?");
            ps.setInt(1, cate);
            //Thuc thi truy van 

            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ResultSet getBuy(String id) {

        try {
            //Tao doi tuong truy van
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Products where product_id=?");
            //Thuc thi truy van 
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public Product getPrice(int product_id) {

        Product price = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select price from Products where product_id=?");
            ps.setInt(1, product_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                price = new Product(rs.getString("price"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return price;
    }
}
