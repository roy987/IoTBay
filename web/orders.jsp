<%-- 
    Document   : order
    Created on : 9 May 2024, 4:07:02 pm
    Author     : Roy
--%>
<%@page import="java.util.List"%>
<%@page import="uts.isd.model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .navbar{
                padding: 20px;
            }
            .navbar-brand{
                font-size: 30px;
            }
            .button-section {
                padding: 10px;
                padding-bottom: 10px;
            }
            .order-page {
                padding: 20px;
            }
            
            
        </style>

    </head>
    <body>
        <div class="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <a class="navbar-brand" href="./main.jsp">IoTBay</a>
                <div class="d-flex justify-content-between w-100">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="ViewProductsController">Products</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="ViewOrdersController">Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Payment</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">Shipment</a>
                        </li>


                    </ul>

                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="UserLogsController">View Logs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="manageUser.jsp">Manage Account</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LogoutController">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="order-page">
            <div class="d-flex justify-content-end w-100 button-section">
                <a href="./order.jsp" class="btn btn-primary">
                    Create New +
                </a>
            </div>
            <div>
                <h1>My Orders</h1>
                <div>
                    <table class="table table-striped table-bg  table-bordered table-hover table-rounded"> 
                        <thead className="">
                            <tr>
                                <th>Order ID</th>
                                <th>Date</th>
                                <th>Email</th>
                                <th>Order Status</th>
                                <th>Edit</th>
                                <th>Cancel</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% 
                            // Retrieve products from request attribute
                            List<Order> orders = (List<Order>) request.getAttribute("orders");
                            if (orders != null) {
                                for (Order order : orders) {
                        %>
                            <tr>
                                <td><%= order.getOrderID() %></td>
                                <td><%= order.getDate() %></td>
                                <td><%= order.getEmail() %></td>
                                <td><%= order.getOrderStatus() %></td>
                                <td><a href="#">Edit</a></td>
                                <td><a href="#">Cancel</a></td>
                            </tr>
                        <% 
                            }
                            } else {
                        %>
                           <tr>
                                <td colspan="4">No orders found</td>
                           </tr>
                        <% 
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>