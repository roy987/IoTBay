<%-- 
    Document   : login
    Created on : 5 Apr 2024, 2:39:18 pm
    Author     : jakesolsky
--%>

<%@ page import="uts.isd.model.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <!-- Styling for the login page -->
    <style>
        .title {
            font-weight: bold;
            font-size: 60px;
            text-align: center;
            display: flex;
            align-items: center;
        }
        .header {
            padding: 30px;
            background-color: lightblue;
            border-radius: 10px; 
            display: flex;
            text-align: center;
            justify-content: space-between;
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
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    
    <body>
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
        <!-- Header section for the login page -->
        <div class="header">
            <div class="title">Login</div>
        </div>
        
        <!-- Form section for user login -->
        <div class="details">
        <p><a href="index.jsp">Back</a></p>
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
    </body>
</html>
