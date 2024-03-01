<%-- 
    Document   : profileuser
    Created on : Oct 10, 2023, 12:21:46 PM
    Author     : nguye
--%>

<%@page import="Model.Account"%>
<%@page import="DAO.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <!-- Link tới Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </head>

    <style>
        /* Định dạng phần profile */
        .profile {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border:  black;
            margin-top: 35px;
            box-shadow:0.6em 0.6em 0.6em 0.2em gray;
        }

        /* Định dạng nút Update và Quay lại */
        .btn {
            margin-top: 10px;
        }

        /* Định dạng hình ảnh */
        .avatar {
            max-width: 150px;
        }
    </style>
</head>
<body>


    <%
        Account a = (Account) session.getAttribute("thongtinkhachhang");
    %>   

    <div class="container">
        <div class="profile">
            <div class="row">
                <!-- Avatar -->


                <!-- Thông tin người dùng -->
                <div class="col-md-8">
                    <form action="CustomerController" method="post" enctype="multipart/form-data">
                        <h2 style="color: red;">Profile</h2>

                        <div class="col-md-4">
                            <input  type="text" value="<%=a.getUser_id()%>" name="user_id" readonly="">
                            <div id="preview">
                                <img id="previewImage" src="${pageContext.request.contextPath}/<%=a.getImages()%>" width="250px;" height="300px;"alt="Image Preview"/>
                            </div>
                            <input type="file" class="form-control" name="txtPT" value="${pageContext.request.contextPath}/<%=a.getImages()%>" onchange="showPreview(event)">

                        </div>
                        <!-- Tên người dùng -->
                        <div class="mb-3">
                            <label for="username" class="form-label" style="font-weight: bold;">Your name:</label>
                            <input type="text" class="form-control" id="username" value="<%=a.getUsername()%>" name="txtusername">
                        </div>
                        <!-- Email -->
                        <div class="mb-3">
                            <label for="email" class="form-label" style="font-weight: bold;">Email:</label>
                            <input type="email" class="form-control" id="email" value="<%=a.getEmail()%>" name="txtemail" >
                        </div>
                        <!-- Địa chỉ -->
                        <div class="mb-3">
                            <label for="address" class="form-label" style="font-weight: bold;">Address:</label>
                            <input type="text" class="form-control" id="address" value="<%=a.getAddress()%>" name="txtaddress" >
                        </div>
                        <!-- Số điện thoại -->
                        <div class="mb-3">
                            <label for="phone" class="form-label" style="font-weight: bold;">Number phone:</label>
                            <input type="tel" class="form-control" id="phone" value="<%=a.getNumberPhone()%>" name="txtphone">
                        </div>
                        <!-- Nút Quay lại và Nút Update -->
                        <button class="btn btn-secondary" id="backButton">
                            <a href="/CustomerController/HomePage" onclick="return confirm('Are you sure?');" style="text-decoration: none; color: white;">Back</a>
                        </button>
                        <button class="btn btn-primary" id="updateButton" name="btneditImages">Update</button>
                    </form> 
                </div>
            </div>
        </div>
    </div>



</body>
<script>
    function showPreview(event) {
        if (event.target.files.length > 0) {
            var src = URL.createObjectURL(event.target.files[0]);
            document.getElementById("previewImage").src = src;
            document.getElementById("preview").style.display = "block";
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</html>