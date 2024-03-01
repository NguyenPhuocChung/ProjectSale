<%-- 
    Document   : buy
    Created on : Oct 18, 2023, 12:38:47 PM
    Author     : nguye
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"><script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
    <style type="text/css">.table&amp;amp;gt;tbody&amp;amp;gt;tr&amp;amp;gt;td, .table&amp;amp;gt;tfoot&amp;amp;gt;tr&amp;amp;gt;td {
            vertical-align: middle;
        }

        @media screen and (max-width: 600px) {
            table#cart tbody td .form-control {
                width:20%;
                display: inline !important;
            }

            .actions .btn {
                width:36%;
                margin:1.5em 0;
            }

            .actions .btn-info {
                float:left;
            }

            .actions .btn-danger {
                float:right;
            }

            table#cart thead {
                display: none;
            }

            table#cart tbody td {
                display: block;
                padding: .6rem;
                min-width:320px;
            }

            table#cart tbody tr td:first-child {
                background: #333;
                color: #fff;
            }

            table#cart tbody td:before {
                content: attr(data-th);
                font-weight: bold;
                display: inline-block;
                width: 8rem;
            }

            table#cart tfoot td {
                display:block;
            }
            table#cart tfoot td .btn {
                display:block;
            }
        }
    </style>
    <body>
        <%
            String id = request.getParameter("id");
            ProductDAO pDao = new ProductDAO();
            ResultSet rs = pDao.getBuy(id);
            while (rs.next()) {
        %>
        <h2 class="text-center">Mua <%=rs.getString("name")%></h2>
        <div class="container"> 
            <table id="cart" class="table table-hover table-condensed"> 
                <thead> 
                    <tr> 
                        <th style="width:50%">Tên sản phẩm</th> 
                        <th style="width:10%">Giá</th> 
                        <th style="width:8%">Số lượng</th> 
                        <th style="width:22%" class="text-center">Thành tiền</th> 
                        <th style="width:10%"> </th> 
                    </tr> 
                </thead> 
                <tbody><tr> 
                        <td data-th="Product"> 
                            <div class="row"> 
                                <div class="col-sm-2 hidden-xs"><img src="${pageContext.request.contextPath}/<%= rs.getString("picture")%>" alt="Sản phẩm 1" width="100" class="img-responsive" >
                                </div> 
                                <div class="col-sm-10"> 
                                    <h4 class="nomargin"><%= rs.getString("name")%></h4> 
                                    <p><%= rs.getString("description")%></p> 
                                </div> 
                            </div> 
                        </td> 
                        <td data-th="Price" style="padding-top: 30px;"><%=rs.getString("price")%></td>
                        <td data-th="Quantity" style="padding-top: 20px;">
                            <input class="form-control text-center quantity-input" value="1" type="number">
                        </td>
                        <td data-th="Subtotal" style="padding-top: 30px;" class="text-center">
                            <span class="subtotal"><%=rs.getString("price")%></span>
                        </td>
                        <td class="actions" data-th="">

                            <button style="margin-top: 20px;"class="btn btn-danger btn-sm"><i class="fa fa-trash-o">Delete</i>
                            </button>
                        </td> 
                    </tr> 
                </tbody>
                <tfoot> 
                    <tr> 
                        <td><a href="/CustomerController/HomePage" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>
                        </td> 
                        <td colspan="2" class="hidden-xs"> </td> 
                        <td class="hidden-xs text-center"><strong>Total: <span id="total-price"><%=rs.getString("price")%></span></strong></td>

                        </td> 
                        <td><a href="http://hocwebgiare.com/" class="btn btn-success btn-block">Thanh toán <i class="fa fa-angle-right"></i></a>
                        </td> 
                    </tr> 
                </tfoot> 
            </table>
        </div>
        <%}%>
    </body>
    <script>
        const quantityInputs = document.querySelectorAll('.quantity-input');
        const totalPriceElement = document.getElementById('total-price');
        let total = 0;

        quantityInputs.forEach(input => {
            input.addEventListener('input', function () {
                const row = input.closest('tr');
                const price = parseFloat(row.querySelector('[data-th="Price"]').textContent);
                const quantity = parseInt(input.value);
                const subtotal = price * quantity;
                row.querySelector('.subtotal').textContent = subtotal;

                // Calculate the total price
                const subtotals = document.querySelectorAll('.subtotal');
                total = Array.from(subtotals).reduce((acc, el) => acc + parseFloat(el.textContent), 0);

                // Update the total price element
                totalPriceElement.textContent = total;
            });
        });
    </script>

</html>

