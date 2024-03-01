<%-- 
    Document   : Allyear
    Created on : Nov 2, 2023, 12:10:09 PM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        #chart2 {
            margin: 10px auto; /* Căn giữa biểu đồ theo chiều ngang */
            width: 70%;     /* Đặt chiều rộng của biểu đồ */
            height: 400px;  /* Đặt chiều cao của biểu đồ */
            text-align: center; /* Căn giữa nội dung trong div */
        }

        /* Add a flex container to center the "No Data" message */


        #noData {
            text-align: center;
            font-size: 24px; /* Tùy chỉnh kích thước chữ */
        }
    </style>
    <head>
        <title>Year</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            google.load('visualization', '1', {'packages': ['corechart']});
            google.setOnLoadCallback(drawChart);

            function drawChart() {
                var dataAvailable = ${not empty data6};

                if (dataAvailable) {
                    var data = google.visualization.arrayToDataTable([
                        ['Year', 'Total Price'],
            <c:forEach items="${data6}" var="entry">
                        [${entry.year}, ${entry.totalPrice}],
            </c:forEach>
                    ]);

                    var options2 = {
                        title: 'Total Price by Year',
                        hAxis: {title: 'Year'},
                        vAxis: {
                            title: 'Total Price',
                            format: 'currency' // Format the Y-axis as currency
                        },
                        width: 900,
                        height: 600
                    };

                    var chart2 = new google.visualization.ColumnChart(document.getElementById('chart2'));
                    chart2.draw(data, options2);
                } else {
                    // Display a centered and enlarged "No Data" message
                    var noDataDiv = document.getElementById('chart2');
                    noDataDiv.innerHTML = '<p id="noData">No Data</p>';
                }
            }
        </script>

    <a href="/AddminController/HomePageAdmin" class="btn btn-danger" style="color: white; text-decoration: none; margin: 10px 0 0 10px;">Back to list</a>
</head>
<body>
    <div id="chart2">
    </div>


</body>
</html>

