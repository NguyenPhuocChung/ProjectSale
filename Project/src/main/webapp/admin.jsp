<%-- 
    Document   : addmin
    Created on : Oct 18, 2023, 10:21:28 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HomePage</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

    </head>
    <style>

       
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
        .slide{
            margin: 0 100px 0 100px;
        }
        .search{
            margin-left: 40px;
        }

    </style>
    <body>
        <!--create menu-->
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
                                <a class="nav-link" href="/CustomerController/Hompage/Contact">User</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">History Buy</a>
                            </li>
                            <li class="nav-item dropdown"> <!-- Thêm class dropdown cho danh mục sản phẩm -->
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Statistical
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="/CustomerController/Banh">Day</a>
                                    <a class="dropdown-item" href="/CustomerController/Water">Week</a>
                                    <a class="dropdown-item" href="/CustomerController/TBGD">Month</a>
                                    <a class="dropdown-item" href="/CustomerController/QuanAo">Year</a>
                                </div>
                            </li>
                            <form class="form-inline search" action="/CustomerController/Search">
                                <div class="input-group">
                                    <input name="word" class="form-control" type="search" placeholder="Tìm kiếm" aria-label="Search" style="width: 400px">
                                    <button  class="btn btn-outline-success" type="submit">Tìm kiếm</button>
                                </div>
                            </form>
                        </ul>
                    </div>
                    <div class="d-flex align-items-center ml-3 " >

                        <a href="/CustomerController" onclick="return confirm('Are you sure?');" ><i class="bi bi-person-fill ml-3"></i><box-icon name='log-out'></box-icon></a>
                    </div>
                </div>

            </nav> 
        </header>
</html>