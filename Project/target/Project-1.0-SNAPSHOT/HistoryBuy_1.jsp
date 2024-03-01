<%-- 
    Document   : HistoryBuy
    Created on : Nov 2, 2023, 3:00:11 PM
    Author     : nguye
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Model.Account"%>
<%@page import="DAO.HistoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5" style="text-align: center;">History</h1>

            <%
                HistoryDAO hDao = new HistoryDAO();
                ResultSet rs = hDao.getHistoryBought();
            %>

            <table class="table table-bordered mt-4 text-center">
                <thead>
                    <tr>
                        <th>Transaction ID</th>
                        <th>User ID</th>
                        <th>Product ID</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Purchase Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("order_detail_id")%></td>
                        <td><%= rs.getInt("user_id")%></td>
                        <td><%= rs.getInt("product_id")%></td>
                        <td><%= rs.getInt("quantity")%></td>
                        <td><%= rs.getDouble("total_price")%></td>
                        <td><%= rs.getString("order_date")%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <!-- Include Bootstrap JS and any additional scripts if needed -->
    </body>
</html>
