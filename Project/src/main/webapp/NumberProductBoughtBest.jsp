<%-- 
    Document   : NumberProductBoughtBest
    Created on : Nov 2, 2023, 11:57:13 AM
    Author     : nguye
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.UserBuyDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NumberProductBoughtBest</title>
    </head>
    <style>
        .thead-dark th:nth-child(odd) {
            background-color: #007BFF;
            color: white;
        }

        .thead-dark th:nth-child(even) {
            background-color: #0056b3;
            color: white;
        }
    </style>
    <body>
        <div style="display: flex;justify-content: space-between; margin: 5px 0 10px 0;">
            <h1 ">Rank Product sell best</h1>
            <a href="/AddminController/HomePageAdmin" class="btn btn-danger" style="color: white; text-decoration: none; margin: 10px 0 0 10px;">Back to list</a>
        </div>
        <table class="table table-striped table-bordered table-hover text-center">
            <thead class="thead-dark">
                <tr>
                    <th class="bg-primary text-white">ProductID</th>
                    <th class="bg-primary text-white">NumberOrderSellBest</th>
                    <th class="bg-primary text-white">Name</th>
                </tr>
            </thead>

            <tbody>
                <% UserBuyDAO uDao = new UserBuyDAO();
                    ResultSet rs = uDao.getNumberProductBoughtBest();
                    if (rs == null) {

                    } else {
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("product_id")%></td>
                    <td><%= rs.getString("product_count")%></td>
                    <td><%= rs.getString("name")%></td>

                </tr>
                <% }
                    }%>
            </tbody>
</html>
