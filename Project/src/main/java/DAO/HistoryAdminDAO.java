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
public class HistoryAdminDAO {

    Connection conn;

    public HistoryAdminDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(HistoryAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(HistoryAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getHistoryBought() {

        try {
            //Tao doi tuong truy van

            PreparedStatement ps = conn.prepareStatement("select * from history_buy");
            //Thuc thi truy van 
        
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(HistoryAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

}
