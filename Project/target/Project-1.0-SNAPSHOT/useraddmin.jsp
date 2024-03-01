<%-- 
    Document   : useraddmin
    Created on : Oct 18, 2023, 10:56:11 PM
    Author     : nguye
--%>

<%@page import="DAO.AccountDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- CSS của Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <!-- JavaScript của Bootstrap (bao gồm jQuery và Popper.js) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    </head>
    <body>
        <main class="container">
            <h1>List User</h1>

            <button class="btnaddnew" style=" background-color: #007bff; border-style: none; margin-bottom: 20px; padding: 5px 5px 5px 5px;" ><a style="text-decoration: none; color: white;"href="#">Add New</a></button>
            <button style="background-color: green; border-style: none; margin-left: 50px; padding: 4px 10px 4px 10px;"><a href="/AddminController/HomePageAdmin" style="text-decoration: none; color: white;  ">Back</a></button>

            <table id="example">
                <thead>
                    <tr>
                        <th>User_id</th>
                        <th>UserName</th>
                        <th>Password</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>NumberPhone</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%

                        try {
                            AccountDAO adao = new AccountDAO();
                            ResultSet rs = adao.getAll();
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("user_id")%></td>
                        <td><%= rs.getString("username")%></td>
                        <td><%= rs.getString("password")%></td>
                        <td><%= rs.getString("email")%></td>
                        <td><%= rs.getString("address")%></td>
                        <td><%= rs.getString("numberphone")%></td>
                        <td>
                            <button style="background-color: red; border-style: none;"><a style="text-decoration: none; color: white;" href="#">Delete</a></button>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </main>
    </body>
</html>
