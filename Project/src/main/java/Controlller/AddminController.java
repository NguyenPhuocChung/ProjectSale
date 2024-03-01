package Controlller;

/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DAO.AccountAdminDAO;
import DAO.ProductAdminDAO;
import DAO.StatisticsDAO;
import Model.Account;
import Model.AccountAdmin;
import Model.OrdersAdmin;
import Model.ProductAdmin;
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
import java.time.LocalDate;
import java.time.temporal.WeekFields;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author nguye
 */
@MultipartConfig
public class AddminController extends HttpServlet {

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
            out.println("<title>Servlet AddminController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddminController at " + request.getContextPath() + "</h1>");
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
        String path1 = request.getRequestURI();
        if (path1.endsWith("/AddminController")) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            if (path1.endsWith("/AddminController/HomePageAdmin")) {
                request.getRequestDispatcher("/productaddmin.jsp").forward(request, response);
            }
            if (path1.endsWith("/AddminController/ProductAdmin")) {
                request.getRequestDispatcher("/productaddmin.jsp").forward(request, response);
            }
            if (path1.endsWith("/AddminController/User")) {
                request.getRequestDispatcher("/useraddmin.jsp").forward(request, response);
            }
            if (path1.endsWith("/AddminController/Banh")) {
                request.getRequestDispatcher("/banhaddmin.jsp").forward(request, response);
            }
            if (path1.endsWith("/AddminController/Water")) {
                request.getRequestDispatcher("/wateraddmin.jsp").forward(request, response);
            }
            if (path1.endsWith("/AddminController/Clothes")) {
                request.getRequestDispatcher("/quanaoaddmin.jsp").forward(request, response);
            }
            if (path1.endsWith("/AddminController/HouesWare")) {
                request.getRequestDispatcher("/tbgdaddmin.jsp").forward(request, response);
            }
            if (path1.endsWith("/AddminController/AddNew")) {
                request.getRequestDispatcher("/addnew.jsp").forward(request, response);
            }
            if (path1.endsWith("/AddminController/Statistics/UserTop")) {
                request.getRequestDispatcher("/TableUserBuyBigest.jsp").forward(request, response);
            }
            if (path1.endsWith("/AddminController/Statistics/OrdersSell")) {
                request.getRequestDispatcher("/NumberProductBoughtBest.jsp").forward(request, response);
            }
            if (path1.endsWith("/AddminController/Statistics/History")) {
                request.getRequestDispatcher("/HistoryBuy.jsp").forward(request, response);
            }

            //edit product.......................................................
            if (path1.startsWith("/AddminController/Edit/")) {
                //CustomerController/Edit/10
                String[] s = path1.split("/"); //CustomerController, Edit, 10
                try {
                    int id = Integer.parseInt(s[s.length - 1]);
                    ProductAdminDAO cDAO = new ProductAdminDAO();
                    ProductAdmin kh = cDAO.getProduct(id);
                    if (kh == null) {
                        response.sendRedirect("/AddminController/HomePageAdmin");
                    } else {
                        //CustomerController -> capnhat.jsp
                        HttpSession session = request.getSession();
                        session.setAttribute("thongtinkhachhang", kh);
                        request.getRequestDispatcher("/Edit.jsp").forward(request, response);
                    }
                } catch (Exception ex) {
                    response.sendRedirect("/AddminController/HomePageAdmin");
                }
            }

            //xóa product
            if (path1.startsWith("/AddminController/Delete")) {
                String[] s = path1.split("/");
                try {
                    int id = Integer.parseInt(s[s.length - 1]);
                    ProductAdminDAO pDao = new ProductAdminDAO();
                    pDao.delete(id);
                    response.sendRedirect("/AddminController/HomePageAdmin");
                } catch (Exception ex) {
                    response.sendRedirect("/AddminController/HomePageAdmin");

                }

            }

            //Thong ke theo tháng
            if (path1.endsWith("/AddminController/Statistics/Month")) {
                request.getRequestDispatcher("/Month.jsp").forward(request, response);
            }
            //Thong ke theo nam
            if (path1.endsWith("/AddminController/Statistics/Year")) {
                request.getRequestDispatcher("/Year.jsp").forward(request, response);
            }
            //all year
            if (path1.endsWith("/AddminController/AllYear")) {
                StatisticsDAO statisticsDAO = new StatisticsDAO();
                List<OrdersAdmin> data = statisticsDAO.getStatisticsAllYear();
                request.setAttribute("data6", data);
                request.getRequestDispatcher("/Allyear.jsp").forward(request, response);
            }

            //all month
            if (path1.endsWith("/AddminController/AllMonth")) {
                StatisticsDAO statisticsDAO = new StatisticsDAO();
                List<OrdersAdmin> data = statisticsDAO.getStatisticsAllMonth();
                request.setAttribute("data5", data);
                request.getRequestDispatcher("/AllMonth.jsp").forward(request, response);
            }

            //Thong ke theo nam
        }
    }

//write code process statistics here
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
        //login

        if (request.getParameter("btnsubmit") != null) {
            String user = request.getParameter("username");
            String password = request.getParameter("password");
            if (!password.matches("^[0-9a-fA-F]{32}$")) { // Assuming MD5 produces 32-character hex hash
                // If the password is not hashed, hash it
                password = DigestUtils.md5Hex(password);
            }
            AccountAdminDAO aDao = new AccountAdminDAO();
            AccountAdmin obj = aDao.getAccount(user, password);

            if (obj == null) {
                response.sendRedirect("/AddminController");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("uname", obj);
                response.sendRedirect("/AddminController/HomePageAdmin");
            }

        } else {

            //addnew
            if (request.getParameter("btncreate") != null) {
                String pro_name = request.getParameter("txtPN");
                String pro_Price = request.getParameter("txtP");
                int pro_quan = Integer.parseInt(request.getParameter("txtQ"));
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
                String pro_des = request.getParameter("txtD");
                int pro_cate = Integer.parseInt(request.getParameter("txtcate"));
                ProductAdmin kh = new ProductAdmin(pro_name, pro_pic, pro_des, pro_Price, pro_quan, pro_cate);
                ProductAdminDAO cDAO = new ProductAdminDAO();
                ProductAdmin rs = cDAO.addNew(kh);
                if (rs == null) {
                    response.sendRedirect("/AddminController/AddNew");
                } else {
                    response.sendRedirect("/AddminController/HomePageAdmin");
                }
            }

            //edit product
            if (request.getParameter("btnupdate") != null) {
                int pro_id = Integer.parseInt(request.getParameter("txtID"));
                String name = request.getParameter("txtPN");
                // Get the existing image path from the form
                String des = request.getParameter("txtD");
                String price = request.getParameter("txtP");
                int quan = Integer.parseInt(request.getParameter("txtQ"));
                int cate = Integer.parseInt(request.getParameter("txtcate"));
                String pro_pic = request.getParameter("txtPT");
                // Check if a new image has been provided
                Part filePart = request.getPart("txtPT");
                if (filePart != null) {
                    String fileName = getFileName(filePart);
                    if (fileName != null && !fileName.isEmpty()) {
                        // Define the directory where you want to save the uploaded images
                        String uploadDirectory = getServletContext().getRealPath("/imagesproject");
                        String uploadPath = uploadDirectory + File.separator + fileName;

                        // Save the file to the specified directory
                        filePart.write(uploadPath);

                        // Set the image name (relative path) in the database
                        pro_pic = "imagesproject/" + fileName;
                    }
                }

                ProductAdmin kh = new ProductAdmin(pro_id, name, pro_pic, des, price, quan, cate);
                ProductAdminDAO cDAO = new ProductAdminDAO();
                ProductAdmin obj = cDAO.update(pro_id, kh);
                if (obj == null) {
                    // Update failed
                    ProductAdmin thongtincu = cDAO.getProduct(pro_id);
                    HttpSession session = request.getSession();
                    session.setAttribute("thongtinkhachhang", thongtincu);
                    response.sendRedirect("/AddminController/Edit/" + pro_id);
                } else {
                    response.sendRedirect("/AddminController/HomePageAdmin");
                }
            }

            //thông kê theo tháng trong nam
            if (request.getParameter("btnsubmitmonth") != null) {
                String yearUri = request.getParameter("selectedMonth");
                String[] parts = yearUri.split("-"); // Giả sử định dạng ngày là "YYYY-MM"
                if (parts.length == 2) {
                    int year = Integer.parseInt(parts[0]); // Chuyển năm thành số nguyên
                    int month = Integer.parseInt(parts[1]); // Chuyển tháng thành số nguyên

                    StatisticsDAO statisticsDAO = new StatisticsDAO();
                    List<OrdersAdmin> data = statisticsDAO.getStatisticsMonth(year, month);
                    request.setAttribute("data", data);
                    request.getRequestDispatcher("/CharMonth.jsp").forward(request, response);
                }
            }

            // thong ke theo nam
            if (request.getParameter("btnsubmityear") != null) {
                int year = Integer.parseInt(request.getParameter("selectedYear"));
                // Chuyển năm thành số nguyên
                StatisticsDAO statisticsDAO = new StatisticsDAO();
                List<OrdersAdmin> data = statisticsDAO.getStatisticsYear(year);
                request.setAttribute("data1", data);
                request.getRequestDispatcher("/ChartYear.jsp").forward(request, response);
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
