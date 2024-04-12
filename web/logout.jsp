<%-- 
    Document   : logout
    Created on : 29 Mar 2024, 4:19:37 pm
    Author     : Roy
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
    <!-- Styling for the logout page -->
    <style>
        .title {
            font-weight: bold;
            font-size: 40px;
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
            text-align: center; 
        }
    </style>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
    
    <body>
        <% 
            // Invalidate the current session by setting "user" attribute to null
//            session.setAttribute("user", null);
        %>
        
        <!-- Header section for logout message -->
        <div class="header">
            <div class="title">You have been logged out.</div>
        </div>
        
        <!-- Details section with link to return to main page -->
        <div class="details">
            <p>Click <a href="index.jsp">here</a> to return to the main page</p>
        </div>
    </body>
</html>
