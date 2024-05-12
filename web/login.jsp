<%-- 
    Document   : login
    Created on : 5 Apr 2024, 2:39:18 pm
    Author     : jakesolsky
--%>

<%@ page import="uts.isd.model.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
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
    
    <body>
        <div class="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <a class="navbar-brand" href="./index.jsp">IoTBay</a>
                <div class="d-flex justify-content-between w-100">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item ">
                                <a class="nav-link" href="login.jsp">Login </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="registerStaff.jsp">Register (Staff)</a>
                        </li>

                        <li class="nav-item dropdown">
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="registerCustomer.jsp">Resister (Customer)</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="content">
                <%-- Check for errors in session and display them --%>
            <% if (session.getAttribute("emailErr") != null) { %>
                <p><%= session.getAttribute("emailErr") %></p>
            <% } %>
            <% if (session.getAttribute("passwordErr") != null) { %>
                <p><%= session.getAttribute("passwordErr") %></p>
            <% } %>
            <% if (session.getAttribute("userErr") != null) { %>
                <p><%= session.getAttribute("userErr") %></p>
            <% } %>
            
            <div class="title">Login</div>

            <!-- Form section for user login -->
            <div class="details">
                <form action="LoginController" method="post">
                    <label>Email: </label>
                        <input name="email"></input><br>
                        <br>
                    <label>Password: </label>
                        <input name="password" type="password"></input><br>
                        <br>
                    <input type="submit" value="login">
                <form/>
            </div>
        </div>
    </body>
</html>
