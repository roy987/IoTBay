<%-- 
    Document   : order
    Created on : 9 May 2024, 4:07:02 pm
    Author     : Roy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Product"%>
<%@page import="uts.isd.model.Order"%>

<!DOCTYPE html>
<%
    // Declare the Order object
    Order order = (Order) request.getAttribute("order");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Order</title>
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
            
        </style>

    </head>
<%@page import="uts.isd.model.User"%>
<%
    User user = (User) session.getAttribute("user");
    String home = "index.jsp";
    
    if (user != null) {
        home = "main.jsp";
    }

%>
<body>
    <div class="header">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href=<%=home%>>IoTBay</a>
            <div class="d-flex justify-content-between w-100">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="ViewProductsController">Products</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="ViewOrdersController">Orders</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="payment_1.jsp">Payment</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="shippingMain.jsp">Shipping</a>
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
                    <li class ="nav-item">
                         <a class="nav-link" href="DeviceListController">Device List</a>
                    </li>
                        
                    <li class ="nav-item">
                         <a class="nav-link" href="FindDevice.jsp">Search Device</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="EditDevice.jsp">Manage Devices</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
        <div class="order-page">
            <div class="order-form">
                <h1>Order</h1>
                <p>Please ensure you have added your payment and shipment details before completing the order.</p>
                <form action="UpdateOrderController" method="post">
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
                                    Product product = (Product) request.getAttribute("product");
                                    if (product != null) {
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
                        <h2 class="section-title">Payment Method</h2>
                        <select class="form-control" name="paymentMethod">
                            <option value="1" <% if (order != null && order.getPaymentID() == 1) out.print("selected"); %>>Credit Card</option>
                            <option value="2" <% if (order != null && order.getPaymentID() == 2) out.print("selected"); %>>PayPal</option>
                            <option value="3" <% if (order != null && order.getPaymentID() == 3) out.print("selected"); %>>Bank Transfer</option>
                        </select>
                    </div>
                    <div class="button-section">
                        <input type="hidden" name="productID" value="<%= product.getProductID() %>">
                        <input type="hidden" name="orderID" value="<%= order.getOrderID()%>">

                        <button type="submit" name="action" value="save" class="buttons bg-primary">Save</button>
                        <button type="submit" name ="action" value="submit" class="buttons bg-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>