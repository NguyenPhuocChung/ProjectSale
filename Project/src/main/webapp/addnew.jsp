<%-- 
    Document   : addnew
    Created on : Oct 27, 2023, 5:13:14 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <style>
        #preview {
            display: none;
        }

        #preview img {
            width: 30%;
            margin-top: 10px;
        }

        body {
            width: 80%;
            margin-left: 100px;
        }
    </style>
    <body>
        <h1 style="text-align: center;">Add new Product</h1>

        <form method="post" action="AddminController" enctype="multipart/form-data">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Product Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="txtPN">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Price</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="txtP">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Quantity</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="txtQ">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Picture</label>
                <div class="col-sm-10">
                    <div id="preview">
                        <img id="previewImage" src="#" alt="Image Preview"/>
                    </div>
                    <input type="file" class="form-control" name="txtPT" onchange="showPreview(event)">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Description</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="txtD">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Category</label>
                <div class="col-sm-10">
                    <select class="form-control" name="txtcate">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select>
                </div>
            </div>

            <button name="btncreate"  class="btn btn-primary">Create</button>
            <a href="/AddminController/HomePageAdmin" class="btn btn-danger" style="color: white; text-decoration: none;">Back to list</a>
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

