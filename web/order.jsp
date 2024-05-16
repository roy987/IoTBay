<%-- 
    Document   : order
    Created on : 9 May 2024, 4:07:02 pm
    Author     : Roy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Product"%>

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
            }

            .section-title {
                font-size: 24px;
                font-weight: bold;
                text-align: center;
            }
            
            .button-section {
                display: flex;
                justify-content: space-between;
                width: 20%;
                padding: 20px;
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
                <div class="section">
                    <h2 class="section-title">Product</h2>
                    <table class="table table-striped table-bg  table-bordered table-hover table-rounded"> 
                        <thead className="">
                            <tr>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Price</th>

                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                // Retrieve products from request attribute
                                Product product = (Product) request.getAttribute("product");
                            %>    
                            <tr>
                                <td><%= product.getProductID() %></td>
                                <td><%= product.getProductName() %></td>
                                <td>$<%= product.getPrice() %></td>

                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="section">
                    <h2 class="section-title">Delivery Method</h2>
                    <select class="form-control" id="deliveryMethod">
                        <option value="standard">Standard Delivery</option>
                        <option value="express">Express Delivery</option>
                    </select>               
                </div>

                <div class="section">
                    <h2 class="section-title">Payment Method</h2>
                    <select class="form-control" id="paymentMethod">
                        <option value="creditCard">Credit Card</option>
                        <option value="paypal">PayPal</option>
                        <option value="bankTransfer">Bank Transfer</option>
                    </select>
                </div>
                <div class="button-section">
                    <button class="buttons bg-primary">Save</button>
                    <button class="buttons bg-primary">Submit</button>
                </div>
            </div>
        </div>
    </body>
</html>