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
public class HistoryDAO {

    Connection conn;

    public HistoryDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(HistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(HistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getHistoryBought(int user_id) {

        try {
            //Tao doi tuong truy van

            PreparedStatement ps = conn.prepareStatement("select * from history_buy where user_id=?");
            //Thuc thi truy van 
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(HistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

}
