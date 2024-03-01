<%-- 
    Document   : water
    Created on : Oct 16, 2023, 10:29:45 PM
    Author     : nguye
--%>

<%@page import="Model.Account"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Water</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    </head>
    <body>
        <style>

            body {
                align-items: center;
                justify-content: center;
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
                margin-top: 20px;
                padding-bottom: 20px;
            }
            menu1{
                margin: 0;

            }
        </style>
    <body>
        <!--create menu-->
        <header>
            <nav class="navbar navbar-expand-lg navbar-light fixed-top">
                <div class="container menu1" style="margin-top: 0; padding-bottom: 0;">
                    <a class="navbar-brand"><img src="${pageContext.request.contextPath}/imagesproject/logo.jpg" width="120" height="60" alt=""></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="/CustomerController/HomePage">Trang chủ</a>
                            </li>
                            <li class="nav-item dropdown"> <!-- Thêm class dropdown cho danh mục sản phẩm -->
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Sản phẩm
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="/CustomerController/Banh">Bánh</a>
                                    <a class="dropdown-item" href="/CustomerController/Water">Nước</a>
                                    <a class="dropdown-item" href="/CustomerController/TBGD">Thiết bị gia dụng</a>
                                    <a class="dropdown-item" href="/CustomerController/QuanAo">Quần áo</a>

                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/CustomerController/Hompage/Contact">Liên hệ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Lịch sử</a>
                            </li>
                        </ul>
                    </div>
                    <form class="form-inline" action="/CustomerController/Search">
                        <div class="input-group">
                            <input name="word" class="form-control" type="search" placeholder="Tìm kiếm" aria-label="Search" style="width: 350px">
                            <button  class="btn btn-outline-success" type="submit">Tìm kiếm</button>
                        </div>
                    </form>

                    <%
                        Account a = (Account) session.getAttribute("thongtinkhachhang");
                        int product_id = 0;
                    %>
                    <div class="d-flex align-items-center ml-3 " >
                        <a href="/CustomerController/Card?id=<%=a.getUser_id()%>&product_id=<%=product_id%>"><i class="bi bi-cart-fill mr-2" style="padding-left: 20px;"></i><box-icon name='cart'></box-icon></a>
                        <a href="/CustomerController/HomePage/Profile" style="padding: 15px;"></i><box-icon type='solid' name='user'></box-icon></a>
                        <a href="/CustomerController" onclick="return confirm('Are you sure?');" ><i class="bi bi-person-fill ml-3"></i><box-icon name='log-out'></box-icon></a>
                    </div>
                </div>

                </div>

            </nav> 
        </header>
        <div class="container text-center">
            <div class="row">
                <%
                    int cate = 2;
                    ProductDAO pDao = new ProductDAO();
                    ResultSet rs = pDao.getWater(cate);
                    while (rs.next()) {
                %>
                <div class="col-md-4 mb-4">
                    <div class="card" style="height: 450px;"> <!-- Set a fixed height for the card -->
                        <img src="${pageContext.request.contextPath}/<%= rs.getString("picture")%>" alt="Product Image" class="card-img-top" style="object-fit: cover; height: 60%;"> <!-- Control how the image is displayed -->
                        <div class="card-body" style="height: 40%;">
                            <h5 class="card-title"><%=rs.getString("name")%></h5>
                            <p class="card-text text-danger">Price: <%=rs.getString("price")%> VND</p>
                            <box-icon type='solid' name='star' color='yellow'></box-icon>
                            <box-icon type='solid' name='star' color='yellow'></box-icon>
                            <box-icon type='solid' name='star' color='yellow'></box-icon>
                            <box-icon type='solid' name='star' color='yellow'></box-icon>
                            <box-icon type='solid' name='star' color='yellow'></box-icon>
                            <br>
                            <a href="/CustomerController/Card?id=<%=a.getUser_id()%>&product_id=<%=rs.getInt("product_id")%>" class="btn btn-primary">Add to Cart</a>
                            <a href="/CustomerController/Buy?id=<%=rs.getInt("product_id")%>" class="btn btn-danger">Buy</a>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
