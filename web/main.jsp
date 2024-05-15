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
    String email = "";
    String password = "";
    String gender = "";
    String fav_col = "";
    String customer = "";
    String text_message = "";
    
    // Populate user details if user object exists
    if (user != null) {
        email = user.getEmail();
        password = user.getPassword();
        gender = user.getGender();
        fav_col = user.getFavouriteColour();
        customer = user.getCustomer();
        
        if (customer == "1") {
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
<body>
    <!-- Header section with IoTBay title and logout link -->
    <div class="header">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="./main.jsp">IoTBay</a>
            <div class="d-flex justify-content-between w-100">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item ">
                            <a class="nav-link" href="LogoutController">Logout </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="manageUser.jsp">Manage User</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="orders.jsp">Orders</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="UserLogsController">View Logs</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="title">Welcome!</div>
    <!-- Main content section -->
    <div class="content">
        <div class="details">
            <p>Hi <%= user.getName() %>! Here's a bit about yourself,</p>
            <!-- Display user information in a styled container -->
            <div class="infoItems">
                <%= text_message %> <br><br>
                Your email is <%= email %> <br><br>
                Your password is <%= password %><br><br>
                Your gender is <%= gender %><br><br>
            </div>
        </div>
    </div>
          
</body>
</html>
