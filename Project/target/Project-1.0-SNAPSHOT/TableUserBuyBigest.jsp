<%-- 
    Document   : TableUserBuyBigest
    Created on : Nov 2, 2023, 10:08:01 AM
    Author     : nguye
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.UserBuyDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rank Total money user but bigest</title>
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
            <h1 ">Rank User</h1>
            <a href="/AddminController/HomePageAdmin" class="btn btn-danger" style="color: white; text-decoration: none; margin: 10px 0 0 10px;">Back to list</a>
        </div>
        <table class="table table-striped table-bordered table-hover text-center">
            <thead class="thead-dark">
                <tr>
                    <th class="bg-primary text-white">UserID</th>
                    <th class="bg-primary text-white">UserName</th>
                    <th class="bg-primary text-white">Email</th>
                    <th class="bg-primary text-white">NumberPhone</th>
                    <th class="bg-primary text-white">TotalPrice</th>
                </tr>
            </thead>

            <tbody>
                <% UserBuyDAO uDao = new UserBuyDAO();
                    ResultSet rs = uDao.getRankUserBuyMoneyBigest();
                    if (rs == null) {

                    } else {
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("user_id")%></td>
                    <td><%= rs.getString("username")%></td>
                    <td><%= rs.getString("email")%></td>
                    <td><%= rs.getString("numberphone")%></td>
                    <td><%= rs.getDouble("total_price")%></td>
                </tr>
                <% }
                    }%>
            </tbody>
        </table>
