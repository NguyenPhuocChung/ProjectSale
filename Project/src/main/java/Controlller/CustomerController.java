/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlller;

import DAO.AccountDAO;
import DAO.HistoryDAO;
import DAO.ProductDAO;
import DAO.cartDAO;

import Model.Account;
import Model.Cart;
import Model.Product;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author nguye
 */
@MultipartConfig
public class CustomerController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();
        if (path.endsWith("/CustomerController")) {
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } else {
            if (path.endsWith("/CustomerController/HomePage")) {
                request.getRequestDispatcher("/logininside.jsp").forward(request, response);

            }
            if (path.endsWith("/CustomerController/HomePage/Profile")) {
                request.getRequestDispatcher("/profileuser.jsp").forward(request, response);

            }
            if (path.endsWith("/CustomerController/Hompage/Contact")) {
                request.getRequestDispatcher("/addmin.jsp").forward(request, response);
            }
            if (path.endsWith("/CustomerController/Register")) {
                request.getRequestDispatcher("/register.jsp").forward(request, response);

            }
            if (path.endsWith("/CustomerController/Search")) {
                request.getRequestDispatcher("/search.jsp").forward(request, response);
            }
            if (path.endsWith("/CustomerController/Banh")) {

                request.getRequestDispatcher("/Banh.jsp").forward(request, response);

            }
            if (path.endsWith("/CustomerController/TBGD")) {

                request.getRequestDispatcher("/TBGD.jsp").forward(request, response);

            }
            if (path.endsWith("/CustomerController/QuanAo")) {

                request.getRequestDispatcher("/quanao.jsp").forward(request, response);

            }
            if (path.endsWith("/CustomerController/Water")) {

                request.getRequestDispatcher("/water.jsp").forward(request, response);

            }
            if (path.endsWith("/CustomerController/Card")) {

                request.getRequestDispatcher("/card.jsp").forward(request, response);

            }

            if (path.startsWith("/CustomerController/Delete")) {
                int id = Integer.parseInt(request.getParameter("product_id"));
                int idUser = Integer.parseInt(request.getParameter("user_id"));
                try {
                    cartDAO cDAO = new cartDAO();
                    cDAO.delete(id);

                    // Redirect to "Card" page with both product_id and user_id parameters
                    response.sendRedirect("/CustomerController/Card?product_id=0&id=" + idUser);
                } catch (Exception ex) {
                    response.sendRedirect("/CustomerController/Card?product_id=0&id=" + idUser);
                }
            }

            //get product when press mua
            if (path.endsWith("/CustomerController/Buy")) {
                request.getRequestDispatcher("/buy.jsp").forward(request, response);
            }

            //tru san pham
            if (path.startsWith("/CustomerController/Minus")) {
                int id = Integer.parseInt(request.getParameter("product_id"));
                int idUser = Integer.parseInt(request.getParameter("user_id"));
                int price = Integer.parseInt(request.getParameter("price"));
                ProductDAO pDao = new ProductDAO();
                Product newprice = pDao.getPrice(id);
                try {
                    if (price == 0) {
                        cartDAO cDAO = new cartDAO();
                        cDAO.delete(id);
                    } else {

                        cartDAO cDAO = new cartDAO();
                        cDAO.minus(id, newprice);

                        // Redirect to "Card" page with both product_id and user_id parameters
                        response.sendRedirect("/CustomerController/Card?product_id=0&id=" + idUser);
                    }
                } catch (Exception ex) {
                    response.sendRedirect("/CustomerController/Card?product_id=0&id=" + idUser);
                }
            } else {
                // cong san pham
                if (path.startsWith("/CustomerController/Plus")) {
                    int id = Integer.parseInt(request.getParameter("product_id"));
                    int idUser = Integer.parseInt(request.getParameter("user_id"));
                    int price = Integer.parseInt(request.getParameter("price"));

                    ProductDAO pDao = new ProductDAO();
                    Product newprice = pDao.getPrice(id);
                    try {
                        if (price == 0) {
                            cartDAO cDAO = new cartDAO();
                            cDAO.delete(id);
                        } else {

                            cartDAO cDAO = new cartDAO();
                            cDAO.plus(id, newprice);

                            // Redirect to "Card" page with both product_id and user_id parameters
                            response.sendRedirect("/CustomerController/Card?product_id=0&id=" + idUser);
                        }
                    } catch (Exception ex) {
                        response.sendRedirect("/CustomerController/Card?product_id=0&id=" + idUser);
                    }
                }
            }

            if (path.endsWith("/CustomerController/History")) {
                int user_id = Integer.parseInt(request.getParameter("id"));
                request.getRequestDispatcher("/historybuy.jsp?id=" + user_id).forward(request, response);

            }

        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Ðang nhap
        if (request.getParameter("btnsubmit") != null) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            if (!password.matches("^[0-9a-fA-F]{32}$")) { // Assuming MD5 produces 32-character hex hash
                // If the password is not hashed, hash it
                password = DigestUtils.md5Hex(password);
            }
            AccountDAO aDao = new AccountDAO();
            Account obj = aDao.getAccount(email, password);
            Account a = aDao.getInforUser(email, password);

            if (obj == null || a == null) {
                response.sendRedirect("/CustomerController");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("thongtinkhachhang", a);
                response.sendRedirect("/CustomerController/HomePage");
            }
        }
        //Ðang ký
        if (request.getParameter("btnsubmit1") != null) {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            long numberPhone = Long.parseLong(request.getParameter("numberphone"));
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            Account ac = new Account(username, password, email, address, numberPhone);

            AccountDAO aDao = new AccountDAO();
            Account rs = aDao.register(ac);
            if (rs == null) {
                response.sendRedirect("/CustomerController/Register");
            } else {//them thanh cong
                response.sendRedirect("/CustomerController");
            }
        }

        //edit  profile
        if (request.getParameter("btneditImages") != null) {
            int user_id = Integer.parseInt(request.getParameter("user_id"));
            String username = request.getParameter("txtusername");
            String email = request.getParameter("txtemail");

            String address = request.getParameter("txtaddress");
            long numberphone = Long.parseLong(request.getParameter("txtphone"));

            String pro_pic = null;
            Part filePart = request.getPart("txtPT"); // Get the uploaded file part
            if (filePart != null) {
                // Define the directory where you want to save the uploaded images
                String uploadDirectory = getServletContext().getRealPath("/imagesproject");
                String fileName = getFileName(filePart);

                if (fileName != null && !fileName.isEmpty()) {
                    String uploadPath = uploadDirectory + File.separator + fileName;

                    // Save the file to the specified directory
                    filePart.write(uploadPath);

                    // Set the image name (relative path) in the database
                    pro_pic = "imagesproject/" + fileName; // Assuming "img" is the directory in your project
                }
            }
            Account ac = new Account(user_id, username, email, numberphone, address, pro_pic);
            AccountDAO aDao = new AccountDAO();
            Account a = aDao.updateImages(user_id, ac);
            if (a == null) {
                response.sendRedirect("/CustomerController/HomePage");

            } else {
                HttpSession session = request.getSession();
                session.setAttribute("thongtinkhachhang", a);
                response.sendRedirect("/CustomerController/HomePage/Profile");

            }
        }
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
