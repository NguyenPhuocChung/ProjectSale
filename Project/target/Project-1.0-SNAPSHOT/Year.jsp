<%-- 
    Document   : Year
    Created on : Nov 1, 2023, 1:49:54 PM
    Author     : nguye
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-3">
        <a href="/AddminController/HomePageAdmin" class="btn btn-danger" style="color: white; text-decoration: none;">Back to list</a>
        <form action="AddminController" method="post" class="mt-3">
            <div class="form-group">
                <label for="yearPicker">Choose Year</label>
                <input type="number" id="yearPicker" name="selectedYear" min="2000" max="2099" value="2023" class="form-control">
            </div>
            <button name="btnsubmityear" class="btn btn-primary mt-3">SUBMIT</button>
        </form>
    </div>
    <hr>
</body>
</html>
