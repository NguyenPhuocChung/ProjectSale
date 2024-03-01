<%-- 
    Document   : card
    Created on : Oct 18, 2023, 8:39:58 AM
    Author     : nguye
--%>

<%@page import="Model.Product"%>
<%@page import="Model.Cart"%>
<%@page import="DAO.cartDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

        <style type="text/css">
            .table > tbody > tr > td,
            .table > tfoot > tr > td {
                vertical-align: middle;
            }

            @media screen and (max-width: 600px) {
                table#cart tbody td .form-control {
                    width: 20%;
                    display: inline !important;
                }

                .actions .btn {
                    width: 36%;
                    margin: 1.5em 0;
                }

                .actions .btn-info {
                    float: left;
                }

                .actions .btn-danger {
                    float: right;
                }

                table#cart thead {
                    display: none;
                }

                table#cart tbody td {
                    display: block;
                    padding: .6rem;
                    min-width: 320px;
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
                    display: block;
                }

                table#cart tfoot td .btn {
                    display: block;
                }
            }
        </style>
    </head>
    <body>
        <h2 class="text-center">Cart<box-icon type='solid' name='cart-download' ></box-icon></h2>
                <%
                    // Get parameters
                    int product_id = Integer.parseInt(request.getParameter("product_id"));
                    int id = Integer.parseInt(request.getParameter("id"));
                    ProductDAO pDao = new ProductDAO();

                    cartDAO cDao = new cartDAO();
                    Cart cprice = cDao.getSumPrice(id);
                    if (product_id != 0) {
                        // Get product
                        ResultSet r = pDao.getProduct_id(product_id);
                        if (r.next()) {
                            // Transfer id and product into cart
                            Cart c = new Cart(id, r.getInt("product_id"), r.getString("name"), r.getString("picture"), r.getString("description"), r.getString("price"), r.getInt("stock_quantity"), r.getInt("category_id"));

                            // Add to the cart
                            Cart cd = cDao.addCart(c);
                        }
                    }
                    if (product_id == 0 || product_id != 0) {
                        // Get items from the cart
                        ResultSet rsp = pDao.getAll();
                        ResultSet rs = cDao.getCart(id);
                        while (rs.next() && rsp.next()) {
                %>
        <div class="container">
            <table id="cart" class="table table-hover table-condensed">
                <thead>
                    <tr>
                        <th style="width:50%">Product Name</th>
                        <th style="width:10%">Price</th>
                        <th style="width:8%">Quantity</th>
                        <th style="width:22%" class="text-center">Subtotal</th>
                        <th style="width:10%">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td data-th="Product">
                            <div class="row">
                                <div class="col-sm-2 hidden-xs">
                                    <img src="${pageContext.request.contextPath}/<%= rs.getString("picture")%>" alt="Product 1" class="img-responsive" width="100">
                                </div>
                                <div class="col-sm-10">
                                    <h4 class="nomargin"><%=rs.getString("name")%></h4>
                                    <p><%= rs.getString("description")%></p>
                                </div>
                            </div>
                        </td>
                        <td data-th="Price" style="padding-top: 30px;"><%=rs.getString("price")%></td>

                        <!--set quantity-->
                        <td data-th="Quantity" style="padding-top: 20px;">
                            <div style="display: flex;">

                                <button style="width: 30px; height: 30px; margin-top: 2px;" class="btn btn-sm btn-danger quantity-btn">
                                    <a style="color: white; text-decoration: none;" href="/CustomerController/Minus?user_id=<%=rs.getInt("user_id")%>&product_id=<%=rs.getInt("product_id")%>&price=<%=rs.getString("price")%>">-</a>
                                </button>
                                <input class="form-control text-center quantity-input" value="<%=rs.getInt("stock_quantity")%>" type="text">
                                <button style="width: 30px; height: 30px;margin-top: 2px;"class="btn btn-sm btn-success quantity-btn" >
                                    <a style="color: white; text-decoration: none;" href="/CustomerController/Plus?user_id=<%=rs.getInt("user_id")%>&product_id=<%=rs.getInt("product_id")%>&price=<%=rs.getString("price")%>">+</a></button>
                            </div>
                        </td>


                        <td data-th="Subtotal" style="padding-top: 30px;" class="text-center">
                            <span class="subtotal"><%=rs.getString("price")%></span>
                        </td>
                        <td>
                            <button style="margin-top: 20px;" class="btn btn-danger btn-sm" name="btndelete">
                                <a onclick="return confirm('Are you sure?');" href="/CustomerController/Delete?user_id=<%=rs.getInt("user_id")%>&product_id=<%=rs.getInt("product_id")%>" style="color: white;">Delete</a>

                            </button>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2" class="hidden-xs"></td>
                        <td class="hidden-xs text-center"><strong>Total: <span id="total-price"><%=rs.getString("price")%></span></strong></td>
                    </tr>
                </tfoot>
            </table>
        </div>

        <%
                }
            }

        %> 
        <hr>
        <h3 style="font-weight: bold; text-align: center;">Total ALL: <%=cprice.getTotal_price()%> </h3>
        <div class="text-center" style="margin-bottom: 30px;">
            <a href="/CustomerController/HomePage" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a>
            <a href="#" class="btn btn-success">Checkout <i class="fa fa-angle-right"></i></a>
        </div>

    </body>
</html>
