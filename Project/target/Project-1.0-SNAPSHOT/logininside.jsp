<%-- 
    Document   : logininside
    Created on : Oct 9, 2023, 9:35:37 PM
    Author     : nguye
--%>

<%@page import="Model.Account"%>
<%@page import="DAO.AccountDAO"%>
<%@page import="Model.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ProductDAO"%>
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
        .slide{
            margin: 0 100px 0 100px;
        }
    </style>
    <body>

        <!--create menu-->
        <header ">
            <nav  class="navbar navbar-expand-lg navbar-light fixed-top">
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
                            <%
                                Account a    = (Account) session.getAttribute("thongtinkhachhang");
                                int product_id = 0;
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="/CustomerController/History?id=<%=a.getUser_id()%>">Lịch sử</a>
                            </li>
                        </ul>
                    </div>
                    <form class="form-inline" action="/CustomerController/Search">
                        <div class="input-group">
                            <input name="word" class="form-control" type="search" placeholder="Tìm kiếm" aria-label="Search" style="width: 350px">
                            <button  class="btn btn-outline-success" type="submit">Tìm kiếm</button>
                        </div>
                    </form>

                    <div class="d-flex align-items-center ml-3 " >
                        <a href="/CustomerController/Card?id=<%=a.getUser_id()%>&product_id=<%=product_id%>"><i class="bi bi-cart-fill mr-2" style="padding-left: 20px;"></i><box-icon name='cart'></box-icon></a>
                        <a href="/CustomerController/HomePage/Profile" style="padding: 15px;"></i><box-icon type='solid' name='user'></box-icon></a>
                        <a href="/CustomerController" onclick="return confirm('Are you sure?');" ><i class="bi bi-person-fill ml-3"></i><box-icon name='log-out'></box-icon></a>
                    </div>
                </div>

            </nav> 
        </header>
        <!--create band-->
        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li style="margin-right: 30px;" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></li>
                <li style="margin-right: 30px;" data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
                <li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img style="height: 800px; width: 1300px; display: inline-block" src="${pageContext.request.contextPath}/imagesproject/Banh sua.jpg" alt="" >
                    <div class="carousel-caption">
                        <h3 style="color: black">Bánh Sữa</h3>
                        <p style="color: black">Bánh sữa tươi ngon</p>
                    </div>
                </div>

                <div class="carousel-item">
                    <img style="height: 800px; width: 1300px;" src="${pageContext.request.contextPath}/imagesproject/May pha ca phe.jpg" alt="">
                    <div class="carousel-caption">
                        <h3  >Máy Pha Cà Phê</h3>
                        <p>Máy pha cà phê chuyên nghiệp</p>
                    </div>
                </div>

                <div class="carousel-item">
                    <img style="height: 900px; width: 1200px;" src="${pageContext.request.contextPath}/imagesproject/May loc nuoc.jpg" alt="" >
                    <div class="carousel-caption">
                        <h3>Máy Lọc Nước</h3>
                        <p>Máy lọc nước hiệu quả</p>
                    </div>
                </div>
                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#myCarousel" role="button" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </a>
                <a class="carousel-control-next" href="#myCarousel" role="button" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </a>
            </div>
        </div>
        <hr>
        <div>
            <h3  class="text-center text-danger" style="padding: 20px 0 10px 0;">Product All</h3>
        </div>
        <hr>
        <!-- get info product-->
        <div class="container text-center">
            <div class="row">
                <%
                    ProductDAO pDao = new ProductDAO();
                    ResultSet rs = pDao.getAll();

                    while (rs.next()) {%>
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
        <!-- get info member-->
        <hr>
        <footer class="bg-light" style="padding-top: 5px;">            
            <div class="container  text-center">
                <h3>MY GROUP</h3>
                <p>WE LOVE IT</p>
                <p>NAME PROJECT " FOOD AND HOUSEWARE"</p>
                <br>
                <div class="row">
                    <div class="col-sm-3">
                        <p class="text-center"><strong>NGUYEN PHUOC CHUNG</strong></p><br>
                        <a href="#demo" data-bs-toggle="collapse">
                            <img src="${pageContext.request.contextPath}/imagesproject/NPC.png" class="img-circle person" alt="Random Name" width="255" height="255">
                        </a>
                        <div id="demo" class="collapse">
                            <p>2002</p>

                        </div>
                    </div>
                    <div class="col-sm-3">
                        <p class="text-center"><strong>PHAM VAN DE</strong></p><br>
                        <a href="#demo2" data-bs-toggle="collapse">
                            <img src="${pageContext.request.contextPath}/imagesproject/pvd1.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
                        </a>
                        <div id="demo2" class="collapse">
                            <p>2003</p>


                        </div>
                    </div>
                    <div class="col-sm-3">
                        <p class="text-center"><strong>VU NGOC MINH</strong></p><br>
                        <a href="#demo3" data-bs-toggle="collapse">
                            <img src="${pageContext.request.contextPath}/imagesproject/VNM.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
                        </a>
                        <div id="demo3" class="collapse">
                            <p>2003</p>

                        </div>
                    </div>
                    <div class="col-sm-3">
                        <p class="text-center"><strong>TRINH QUOC MINH</strong></p><br>
                        <a href="#demo4" data-bs-toggle="collapse">
                            <img src="${pageContext.request.contextPath}/imagesproject/tqm.png" class="img-circle person" alt="Random Name" width="255" height="255">
                        </a>
                        <div id="demo4" class="collapse">
                            <p>2003</p>

                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</body>
</html>