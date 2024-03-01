<%-- 
    Document   : productaddmin
    Created on : Oct 18, 2023, 10:55:37 PM
    Author     : nguye
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <!-- CSS của Bootstrap -->

        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <!-- JavaScript của Bootstrap (bao gồm jQuery và Popper.js) -->
        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

    </head>
    <style>


        .btnheader{
            display: flex;
            justify-content: space-between;
            justify-items: center;
        }


        .navbar {
            background-color: #ffffff;
        }
        .nav-link {
            color: #333333;
        }
        .nav-link:hover {
            color: #007bff;
        }
        a:hover{
            font-weight: bold;

        }


        box-icon:active{
            width: 30px;
            height: 30px;

        }


        .container{
            margin-top: 80px;
            padding-bottom: 20px;
        }
        menu1{
            margin: 0;

        }
        .slide{
            margin: 0 100px 0 100px;
        }
        .search{
            margin-left: 40px;
        }

    </style>
    <header>
        <nav  class="navbar navbar-expand-lg navbar-light fixed-top">
            <div class="container menu1" style="margin-top: 0; padding-bottom: 0;">
                <a class="navbar-brand"><img src="${pageContext.request.contextPath}/imagesproject/logo.jpg" width="120" height="60" alt=""></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/AddminController/ProductAdmin">Product</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="/AddminController/User">User</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/AddminController/Statistics/History">History Buy</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="statisticsDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Statistics
                            </a>
                            <div class="dropdown-menu" aria-labelledby="statisticsDropdown">
                                <a class="dropdown-item" href="/AddminController/Statistics/Year">Year</a>
                                <a class="dropdown-item" href="/AddminController/Statistics/Month">Month</a>
                                <a class="dropdown-item" href="/AddminController/Statistics/OrdersSell">Order the top</a>
                                <a class="dropdown-item" href="/AddminController/Statistics/UserTop">User buy the top</a>

                            </div>
                        </li>
                    </ul>
                </div>
                <div class="d-flex align-items-center ml-3 " >

                    <a href="/AddminController" onclick="return confirm('Are you sure?');" ><i class="bi bi-person-fill ml-3"></i><box-icon name='log-out'></box-icon></a>
                </div>
            </div>

        </nav> 
    </header>

    <body style="margin-top: 100px;">
        <main class="container">
            <h2 style="text-align: center; color: chocolate;">List all Product</h2>
            <div class="btnheader">
                <button class="btnaddnew" style=" background-color: #007bff;border-radius: 3px; border-style: none; margin-bottom: 20px;" ><a style="text-decoration: none; color: white;"href="/AddminController/AddNew">Add New</a></button>
                <div class="btnheader"">
                    <div class="btnproduct">
                        <button style="background-color: orangered; border-style: none; border-radius: 3px;"><a style="text-decoration: none; color: white; " href="/AddminController/Banh">Cake</a></button>
                        <button style="background-color: orangered; border-style: none; border-radius: 3px;"><a style="text-decoration: none; color: white;" href="/AddminController/Water">Water</a></button>
                        <button style="background-color: orangered; border-style: none; border-radius: 3px;"><a style="text-decoration: none; color: white;" href="/AddminController/Clothes">Clothes</a></button>
                        <button style="background-color: orangered; border-style: none; border-radius: 3px;"><a style="text-decoration: none; color: white;" href="/AddminController/HouesWare">House Ware</a></button>
                    </div>
                </div>



            </div>
            <hr>
            <table id="example">
                <thead>
                    <tr>
                        <th>Product_id</th>
                        <th>Name</th>
                        <th>Images</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Category</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Use try-with-resources to close the ResultSet and Statement automatically
                     
                        try {
                            ProductDAO cdao = new ProductDAO();
                            ResultSet rs = cdao.getAll();
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("product_id")%></td>
                        <td><%= rs.getString("name")%></td>
                        <td><img src="${pageContext.request.contextPath}/<%= rs.getString("picture")%>"  width="50px" height="50px"></td>
                        <td><%= rs.getString("description")%></td>
                        <td><%= rs.getString("price")%></td>
                        <td><%= rs.getInt("stock_quantity")%></td>
                        <td><%= rs.getInt("category_id")%></td>
                        <td>
                            <button style="background-color: green; border-style: none; border-radius: 3px;"><a href="/AddminController/Edit/<%=rs.getInt("product_id")%>" style="text-decoration: none; color: white; ">Edit</a></button>
                            <button style="background-color: red; border-style: none; border-radius: 3px;"><a style="text-decoration: none; color: white;" href="/AddminController/Delete/<%=rs.getInt("product_id")%>">Delete</a></button>

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
