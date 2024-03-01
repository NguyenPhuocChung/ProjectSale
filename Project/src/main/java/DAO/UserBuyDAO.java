/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nguyen phuoc chung
 */
public class UserBuyDAO {

    Connection conn;

    public UserBuyDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserBuyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getRankUserBuyMoneyBigest() {

        try {
            //Tao doi tuong truy van
            PreparedStatement ps = conn.prepareStatement("SELECT u.user_id, u.username, u.email, u.numberphone, SUM(o.total_price) AS total_price\n"
                    + "FROM Users u\n"
                    + "JOIN Orders o ON u.user_id = o.user_id\n"
                    + "GROUP BY u.user_id, u.username, u.email, u.numberphone\n"
                    + "ORDER BY total_price DESC;");
            //Thuc thi truy van 

            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ResultSet getNumberProductBoughtBest() {

        try {
            //Tao doi tuong truy van
            PreparedStatement ps = conn.prepareStatement("SELECT hb.product_id, COUNT(*) AS product_count, p.name\n"
                    + "FROM history_buy hb\n"
                    + "JOIN Products p ON hb.product_id = p.product_id\n"
                    + "GROUP BY hb.product_id, p.name\n"
                    + "ORDER BY product_count DESC");
            //Thuc thi truy van 

            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

}
