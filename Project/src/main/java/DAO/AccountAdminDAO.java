/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.DBConnection;
import Model.AccountAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AccountAdminDAO {

    Connection conn;

    public AccountAdminDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public AccountAdmin getAccount(String username, String password) {
        AccountAdmin kh = null;
        String query = "SELECT username, password FROM [admin] WHERE username = ? AND password = ?";
        try ( PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                kh = new AccountAdmin(rs.getString("username"), rs.getString("password"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kh;
    }
    

    public AccountAdmin getInforUser(String email, String password) {
        AccountAdmin a = null;
        String query = "SELECT email, username, address, numberphone FROM Users WHERE email = ? AND password = ?";
        try ( PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet p = ps.executeQuery();
            if (p.next()) {
                a = new AccountAdmin(p.getString("username"), p.getString("email"), p.getLong("numberphone"), p.getString("address"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;

    }

    public AccountAdmin register(AccountAdmin kh) {
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
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
