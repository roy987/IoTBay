<%-- 
    Document   : main
    Created on : 29 Mar 2024, 3:58:04 pm
    Author     : Roy
--%>

<%@ page import="uts.isd.model.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
    // Retrieve the user object from the session
    User user = (User) session.getAttribute("user");
    
    // Initialize variables to store user details
    String name = "";
    String email = "";
    String password = "";
    String phone = "";
    String customer = "";
    String text_message = "";
    
    
    // Populate user details if user object exists
    if (user != null) {
        name = user.getName();
        email = user.getEmail();
        password = user.getPassword();
        phone = user.getPhone();
        customer = user.getCustomer();
        
        if (customer.strip().equals("1")) {
           text_message = "you are a customer";
        }
        else {
           text_message = "you are a staff member";
        }  
    }
%>  

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Main</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .title {
            font-weight: bold;
            font-size: 40px;
            text-align: center;
            display: flex;
            align-items: center;
        }
        .details {
            margin-top: 50px;
            font-size: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: left; 
        }
        label {
            width: 150px; 
            display: inline-block;
        }
        .terms-label {
            width: auto; 
            white-space: nowrap; 
            margin-right: 10px; 
        }
        .content{
            padding: 15px;
        }
    </style>
</head>
<%
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

    <div class="title">Welcome!</div>
    <!-- Main content section -->
    <div class="content">
        <div class="details">
            <p>Hi <%= name %>! Here's a bit about yourself,</p>
            <!-- Display user information in a styled container -->
            <div class="infoItems">
                <%= text_message %> <br><br>
                Your email is <%= email %> <br><br>
                Your phone number is <%= phone %><br><br>
            </div>
        </div>
    </div>
          
</body>
</html>
