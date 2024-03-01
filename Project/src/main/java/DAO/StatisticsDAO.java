/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.DBConnection;
import Model.OrdersAdmin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StatisticsDAO {

    Connection conn;

    public StatisticsDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(StatisticsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<OrdersAdmin> getStatisticsMonth(int year, int month) {
        List<OrdersAdmin> data = new ArrayList<>();

        try {
            String query = "SELECT YEAR(order_date) AS order_year, MONTH(order_date) AS order_month, SUM(total_price) AS total_price \n"
                    + "FROM Orders \n"
                    + "WHERE YEAR(order_date) = ? AND MONTH(order_date) = ? \n"
                    + "GROUP BY YEAR(order_date), MONTH(order_date) \n"
                    + "ORDER BY YEAR(order_date), MONTH(order_date)";

            // Using try-with-resources for PreparedStatement
            try ( PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setInt(1, year);
                preparedStatement.setInt(2, month);

                try ( ResultSet rs = preparedStatement.executeQuery()) {
                    // Chuyển dữ liệu từ ResultSet thành danh sách MonthYearData
                    while (rs.next()) {
                        int resultYear = rs.getInt("order_year");
                        int resultMonth = rs.getInt("order_month");
                        double total_price = rs.getDouble("total_price");
                        data.add(new OrdersAdmin(resultYear, resultMonth, total_price));
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatisticsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return data;
    }

    public List<OrdersAdmin> getStatisticsYear(int year) {
        List<OrdersAdmin> data = new ArrayList<>();

        try {
            // Thực thi truy vấn
            String query = "SELECT YEAR(order_date) AS order_year, SUM(total_price) AS total_price "
                    + "FROM Orders "
                    + "WHERE YEAR(order_date) = ? "
                    + "GROUP BY YEAR(order_date) "
                    + "ORDER BY YEAR(order_date)";

            try ( PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setInt(1, year);

                // Chuyển dữ liệu từ ResultSet thành danh sách YearData
                try ( ResultSet rs = preparedStatement.executeQuery()) {
                    // Chuyển dữ liệu từ ResultSet thành danh sách YearData
                    while (rs.next()) {
                        int resultYear = rs.getInt("order_year");
                        double total_price = rs.getDouble("total_price");
                        data.add(new OrdersAdmin(resultYear, total_price));
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatisticsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public List<OrdersAdmin> getStatisticsAllMonth() {
        List<OrdersAdmin> data = new ArrayList<>();

        try {
            String query = "SELECT YEAR(order_date) AS year, MONTH(order_date) AS month, SUM(total_price) AS total_price\n"
                    + "FROM Orders\n"
                    + "GROUP BY YEAR(order_date), MONTH(order_date)\n"
                    + "ORDER BY year, month;";

            // Using try-with-resources for PreparedStatement
            try ( PreparedStatement preparedStatement = conn.prepareStatement(query)) {

                try ( ResultSet rs = preparedStatement.executeQuery()) {
                    // Chuyển dữ liệu từ ResultSet thành danh sách MonthYearData
                    while (rs.next()) {
                        int resultYear = rs.getInt("year");
                        int resultMonth = rs.getInt("month");
                        double total_price = rs.getDouble("total_price");
                        data.add(new OrdersAdmin(resultYear, resultMonth, total_price));
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatisticsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public List<OrdersAdmin> getStatisticsAllYear() {
        List<OrdersAdmin> data = new ArrayList<>();
        try {
            // Corrected SQL query
            String query = "SELECT YEAR(order_date) AS year, SUM(total_price) AS total_price "
                    + "FROM Orders "
                    + "GROUP BY YEAR(order_date) "
                    + "ORDER BY YEAR(order_date)";

            try ( PreparedStatement preparedStatement = conn.prepareStatement(query)) {

                try ( ResultSet rs = preparedStatement.executeQuery()) {
                    while (rs.next()) {
                        int resultYear = rs.getInt("year");
                        double total_price = rs.getDouble("total_price");
                        data.add(new OrdersAdmin(resultYear, total_price));
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatisticsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

}
