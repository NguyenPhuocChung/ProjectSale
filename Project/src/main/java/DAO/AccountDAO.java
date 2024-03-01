/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.DBConnection;
import Model.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AccountDAO {

    Connection conn;

    public AccountDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getAll() {
        try {
            //Tao doi tuong truy van
            Statement st = conn.createStatement();
            //Thuc thi truy van 
            ResultSet rs = st.executeQuery("select * from Users");
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccount(String email, String password) {
        Account kh = null;
        String query = "SELECT email, password FROM Users WHERE email = ? AND password = ?";
        try ( PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                kh = new Account(rs.getString("email"), rs.getString("password"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kh;
    }

    public Account getInforUser(String email, String password) {
        Account a = null;
        String query = "SELECT user_id, email, username, address, numberphone, images FROM Users WHERE email = ? AND password = ?";
        try ( PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet p = ps.executeQuery();
            if (p.next()) {
                a = new Account(p.getInt("user_id"), p.getString("username"), p.getString("email"), p.getLong("numberphone"), p.getString("address"), p.getString("images"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;

    }

    public Account register(Account kh) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO Users (username, password, email, address, numberPhone) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, kh.getUsername());
            ps.setString(2, kh.getPassword());
            ps.setString(3, kh.getEmail());
            ps.setString(4, kh.getAddress());
            ps.setLong(5, kh.getNumberPhone());
            int count = ps.executeUpdate();
            return (count == 0) ? null : kh;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account updateImages(int user_id, Account updatedProduct) {

        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Users SET images=?, username=?, email=?, address=?, numberphone=? WHERE user_id=?");
            ps.setString(1, updatedProduct.getImages());
            ps.setInt(6, user_id);
            ps.setString(2, updatedProduct.getUsername());
            ps.setString(3, updatedProduct.getEmail());
            ps.setString(4, updatedProduct.getAddress());
            ps.setLong(5, updatedProduct.getNumberPhone());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : updatedProduct;
    }

}
