<%-- 
    Document   : CharMonth
    Created on : Nov 1, 2023, 3:26:21 PM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        #chart1 {
            margin: 10px auto; /* Căn giữa biểu đồ theo chiều ngang */
            width: 70%;     /* Đặt chiều rộng của biểu đồ */
            height: 400px;  /* Đặt chiều cao của biểu đồ */
            text-align: center; /* Căn giữa nội dung trong div */
        }

        #noData {
            text-align: center;
            font-size: 24px; /* Tùy chỉnh kích thước chữ */
        }
    </style>
    <head>
        <title>Month</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            google.load('visualization', '1', {'packages': ['corechart']});
            google.setOnLoadCallback(drawChart);

            function drawChart() {
                // Check if there is data available
                var dataAvailable = ${not empty data};

                if (dataAvailable) {
                    var data1 = google.visualization.arrayToDataTable([
                        ['Time Period', 'Total Price'],
            <c:forEach items="${data}" var="entry">
                        ['${entry.year}-${entry.month}', ${entry.totalPrice}],
            </c:forEach>
                                    ]);

                                    var options1 = {
                                        title: 'Total Price by Time Month',
                                        hAxis: {title: 'Time Period'},
                                        vAxis: {title: 'Total Price'},
                                        width: 900,
                                        height: 600
                                    };

                                    var chart1 = new google.visualization.ColumnChart(document.getElementById('chart1'));
                                    chart1.draw(data1, options1);
                                } else {
                                    // Display a centered and enlarged "No Data" message
                                    var noDataDiv = document.getElementById('chart1');
                                    noDataDiv.innerHTML = '<p id="noData">No Data</p>';
                                }
                            }
        </script>
            <a href="/AddminController/AllMonth" class="btn btn-danger" style="color: white; text-decoration: none; margin: 10px 0 0 10px;">All Month</a>

    <a href="/AddminController/HomePageAdmin" class="btn btn-danger" style="color: white; text-decoration: none; margin: 10px 0 0 10px;">Back to list</a>
</head>
<body>
    <div id="chart1"></div>
</body>
</html>
