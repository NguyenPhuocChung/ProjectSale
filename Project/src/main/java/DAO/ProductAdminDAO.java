/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.DBConnection;
import Model.ProductAdmin;
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
public class ProductAdminDAO {

    Connection conn;

    public ProductAdminDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ResultSet getWater(int cate) {
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM  Products  where category_id=?");
            ps.setInt(1, cate);
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public void delete(int product_id) {
        try {
            PreparedStatement ps = conn.prepareStatement("delete from Products where product_id=?");
            ps.setInt(1, product_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ProductAdmin addNew(ProductAdmin obj) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO Products ([name], [picture], [description], price, stock_quantity, category_id)\n"
                    + "VALUES (?,?,?,?,?,?)");
            ps.setString(1, obj.getName());
            ps.setString(2, obj.getPicture());
            ps.setString(3, obj.getDescription());
            ps.setString(4, obj.getPrice());
            ps.setInt(5, obj.getStock_quantily());
            ps.setInt(6, obj.getCategory());
            int count = ps.executeUpdate();
            return (count == 0) ? null : obj;
        } catch (SQLException ex) {
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ProductAdmin getProduct(int pro_id) {
        ProductAdmin kh = null;
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT product_id, name, picture, description, price, stock_quantity, category_id FROM Products WHERE product_id = ?");
            ps.setInt(1, pro_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                kh = new ProductAdmin(rs.getInt("product_id"), rs.getString("name"), rs.getString("picture"), rs.getString("description"), rs.getString("price"), rs.getInt("stock_quantity"), rs.getInt("category_id"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kh;
    }

    public ProductAdmin update(int product_id, ProductAdmin updatedProduct) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Products SET name=?, picture=?, description=?, price=?, stock_quantity=?, category_id=? WHERE product_id=?");
            ps.setString(1, updatedProduct.getName());
            ps.setString(2, updatedProduct.getPicture());
            ps.setString(3, updatedProduct.getDescription());
            ps.setString(4, updatedProduct.getPrice()); // Assuming 'price' is a decimal in the database
            ps.setInt(5, updatedProduct.getStock_quantily());   
            ps.setInt(6, updatedProduct.getCategory());
            ps.setInt(7, product_id);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : updatedProduct;
    }

}
