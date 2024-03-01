<%-- 
    Document   : Edit
    Created on : Oct 27, 2023, 4:49:08 PM
    Author     : nguye
--%>

<%@page import="Model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
    </head>
    <h2 style="text-align: center;">Edit Product</h2>
    <body>

        <%
            Product kh = (Product) session.getAttribute("thongtinkhachhang");
        %>
        <form method="post" action="AddminController" enctype="multipart/form-data">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Product ID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="txtID" value="<%=kh.getProduct_id()%>" readonly="">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Product Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="txtPN" value="<%=kh.getName()%>">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Price</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="txtP" value="<%=kh.getPrice()%>">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Quantity</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="txtQ" value="<%=kh.getStock_quantily()%>">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Picture</label>
                <div class="col-sm-10">
                    <div id="preview">
                        <img id="previewImage" src="${pageContext.request.contextPath}/<%=kh.getPicture()%>" width="60px;" height="60px;"alt="Image Preview"/>
                    </div>
                    <input type="file" class="form-control" name="txtPT" value="<%=kh.getPicture()%>" onchange="showPreview(event)">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Description</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="txtD" value="<%=kh.getDescription()%>">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Category</label>
                <div class="col-sm-10">
                    <select class="form-control" name="txtcate">
                        <option value="1" <% if (kh.getCategory() == 1) { %>selected="selected"<% } %>>1</option>
                        <option value="2" <% if (kh.getCategory() == 2) { %>selected="selected"<% } %>>2</option>
                        <option value="3" <% if (kh.getCategory() == 3) { %>selected="selected"<% } %>>3</option>
                        <option value="4" <% if (kh.getCategory() == 4) { %>selected="selected"<% }%>>4</option>
                    </select>
                </div>
            </div>

            <div style="text-align: center; margin-top: 20px;">
                <button name="btnupdate"  class="btn btn-primary">Update</button>
                <a href="/AddminController/HomePageAdmin" class="btn btn-danger" style="color: white; text-decoration: none;">Back to list</a>
            </div>
        </form>
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
