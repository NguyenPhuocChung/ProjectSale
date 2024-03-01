<%-- 
    Document   : Month
    Created on : Nov 1, 2023, 1:50:02 PM
    Author     : nguye
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<form action="AddminController" method="post" class="m-3">
        <a href="/AddminController/HomePageAdmin" class="btn btn-danger" style="color: white; text-decoration: none;">Back to list</a>
        <div class="form-group mt-3">
            <label for="monthPicker">Choose Year and Month</label>
            <input type="month" id="monthPicker" name="selectedMonth" value="2023-11" class="form-control">
        </div>
        <button name="btnsubmitmonth" class="btn btn-primary mt-3">SUBMIT</button>
    </form>
    <hr>
</head>
</html>
