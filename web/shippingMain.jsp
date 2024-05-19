<%-- 
    Document   : shippingView
    Created on : 10 May 2024, 1:47:27 pm
    Author     : jyapr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.ShippingModel" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shipping</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    .navbar {
        padding: 20px;
    }
    .navbar-brand {
        font-size: 30px;
    }
    .heading {
        font-size: 30px;
    }
    .centre {
        padding-top: 20px;
        text-align: center;
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
    .heading2 {
        font-size: 30px;
        padding-top: 50px;
        text-align: center;
    }
    
    .search {
        padding-bottom: 20px;
    }
    
    .pastShipments {
        text-align: center;
        margin: 0 auto;
        width: 60%;
        
        
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
      
<div class="centre">
    <div class="heading">
        <p>Shipping Details</p>
    </div>
    <div class="shippingDisplay">
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
    </div>
    <div class="addButton">
        <a href="./shippingAdd.jsp">Edit Details</a>
    </div>      
</div>
<div class="heading2">
    <p>Past Shipments</p>
</div>
    
    <div class="pastShipments">
        <div class="search">
            <form action="searchPastShipments.jsp" method="get">
                <input type="text" name="shipmentId" placeholder="Enter Shipment ID">
                <input type="date" name="dateShipped" placeholder="Select Date">
                <button type="submit">Search</button>
            </form>
        </div>

        <table class="table">
            <thead>
                <tr>
                    <th>Shipping ID</th>
                    <th>Method</th>
                    <th>Date Shipped</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty pastShipmentsList}">
                        <tr>
                            <td colspan="3">No previous shipments found</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="shipment" items="${pastShipmentsList}">
                            <tr>
                                <td>${shipment.shippingID}</td>
                                <td>${shipment.method}</td>
                                <td>${shipment.dateShipped}</td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
    
    
</body>
</html>
