<%-- 
    Document   : register
    Created on : 15 Mar 2024, 4:45:02 pm
    Author     : Roy
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register staff</title>
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
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="registerStaff.jsp">Register (Staff)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="registerCustomer.jsp">Register (Customer)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="DeviceListController">Device List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="FindDevice.jsp">Search Device</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="EditDevice.jsp">Manage Devices</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
        
        <% if (session.getAttribute("registerErr") != null) { %>
            <p><%= session.getAttribute("registerErr") %></p>
        <% } %>
            
        <div class="title">Register (Staff)</div>
        <!-- Registration form section -->
        <div class="details">
            <form action="RegisterStaffController" method="POST">
                <label>Email: </label>
                <input name="email"></input><br><br>
                <label>Name: </label>
                <input name="name"></input><br><br>
                <label>Password: </label>
                <input name="password" type="password"></input><br><br>
                <label>Phone Number: </label>
                <input name="phone"></input><br><br>
                <label class="terms-label">Terms And Conditions: </label>
                <input type="checkbox" name="tos"></input><br><br>
                
                <input type="submit" value="Register">
            </form>
        </div>
    </body>
</html>
