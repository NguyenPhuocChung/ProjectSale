/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author nguyen phuoc chung
 */
public class DBConnection {

    public static Connection connect() throws ClassNotFoundException, SQLException {
        //khai bao driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //tao doi tuong connection den fatabase
        Connection conn = DriverManager.getConnection("jdbc:sqlserver://LAPTOP-NOEBS0P6\\SQLEXPRESS:1433;databaseName=G6_ProjectPRJ;user=sa;password=123;encrypt=true;trustServerCertificate=true;");
        return conn;
    }
    

}
