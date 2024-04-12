<%-- 
    Document   : loginConfirm
    Created on : 6 Apr 2024, 10:58:48 am
    Author     : jakesolsky
--%>

<%@ page import="uts.isd.model.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.Serializable" %>

<%
    // Retrieve email and password from request parameters
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Retrieve user list from session
    List<User> userList = (List<User>) session.getAttribute("userList");

    // Initialize variables to track login status
    boolean user_found = false;

    // Iterate over user list to check for matching credentials
    for (User user : userList) {
        if (email.equals(user.getEmail()) && password.equals(user.getPassword())) {
            // Set "user" attribute in session upon successful login
            user_found = true;
            session.setAttribute("user", user);
        }
    }
%> 

<!DOCTYPE html>
<html>
    <style>
        /* Styling for login success/failure pages */
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

    <% 
        // Conditionally display success or failure content based on login result
        if (user_found) { 
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Success</title>
        <style>
            /* Additional styling for success page */
            .title {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <!-- Header section for login success -->
        <div class="header">
            <div class="title">Login Success</div>
        </div>
        <!-- Details section for success message -->
        <div class="details">
            <p><a href="main.jsp">Continue</a></p>
        </div>
    </body>
    <% } else { %>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Failed</title>
        <style>
            .title {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <!-- Header section for login failure -->
        <div class="header">
            <div class="title">Login Failed</div>
        </div>
        <!-- Details section for failure message -->
        <div class="details">
            <p><a href="login.jsp">Back</a></p>
        </div>
    </body>
    <% } %>
       
</html>

