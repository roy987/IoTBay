<%-- 
    Document   : order
    Created on : 9 May 2024, 4:07:02 pm
    Author     : Roy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Product"%>
<%@page import="uts.isd.model.ShippingModel"%>


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
            .order-form {
                display: flex;
                align-items: center;
                flex-direction: column;
                justify-content: center;
                width: 100%;
            }
            .section {
                margin-top: 20px;
                text-align: center;
            }

            .section-title {
                font-size: 24px;
                font-weight: bold;
                text-align: center;
            }
            
            .button-section {
                display: flex;
                justify-content: space-between;
                width: 100%;
                padding: 40px;
                
            }
            
            .buttons {
                border-radius: 10px;
                padding: 8px;
                padding-left: 12px;
                padding-right: 12px;
                color: white;
                border: none;
                width: 75px;

            }
            
            .addButton {
                margin-top: 30px;
            }
            .addButton a {
                color: blue;
                padding: 10px 15px;
                margin: 0 10px;
                border: 1px solid blue;
                border-radius: 5px;
                text-decoration: none;
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
            <div class="order-form">
                <h1>Order</h1>
                <p>Please ensure you have added your payment and shipment details before completing the order.</p>
                <form action="CreateOrderController" method="post">
                    <div class="section">
                        <!-- Display selected product details (you might need to adjust this part based on how you pass the product object) -->
                        <h2 class="section-title">Product</h2>
                        <table class="table table-striped table-bg table-bordered table-hover table-rounded">
                            <thead>
                                <tr>
                                    <th>Product ID</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    Product product = (Product) session.getAttribute("product");                                    if (product != null) {
                                %>
                                <tr>
                                    <td><%= product.getProductID() %></td>
                                    <td><%= product.getProductName() %></td>
                                    <td>$<%= product.getPrice() %></td>
                                </tr>
                                <%
                                    } else {
                                %>
                                <tr>
                                    <td colspan="3">Product details not available</td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                            
                    

                    <div class="section">
                        <h2 class="section-title">Shipping Details</h2>
                        <%
                            ShippingModel shippingModel = (ShippingModel) session.getAttribute("shippingModel");
                            if (shippingModel != null) {
                                out.println("<p>Shipping Method: " + shippingModel.getMethod() + "</p>");
                                out.println("<p>Shipping Address: " + shippingModel.getAddress() + "</p>");
                                out.println("<p>Delivery Date: " + shippingModel.getDate() + "</p>");
                            } else {
                                out.println("<p>No details saved</p>");
                            }
                        %>
                    
                        <div class="addButton">
                            <a href="./shippingEditAdd.jsp">Edit Details</a>
                        </div>
                    </div>
                        
                    <div class="section">
                        <h2 class="section-title">Payment Method</h2>
                        <select class="form-control" name="paymentMethod">
                            <option value="1">Credit Card</option>
                            <option value="2">PayPal</option>
                            <option value="3">Bank Transfer</option>
                        </select>
                    </div>
                    <div class="button-section">
                        <input type="hidden" name="productID" value="<%= product.getProductID() %>">

                        <button type="submit" name="action" value="save" class="buttons bg-primary">Save</button>
                        <button type="submit" name ="action" value="submit" class="buttons bg-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>