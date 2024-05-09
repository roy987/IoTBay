<%-- 
    Document   : welcome
    Created on : 15 Mar 2024, 4:59:30 pm
    Author     : Roy
--%>

<%@ page import="uts.isd.model.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.Serializable" %>

<!DOCTYPE html>
<%
    // Retrieve the user object from the session
    User user = (User) session.getAttribute("user");
    
    // Initialize variables to store user details
    String email = "";
    String name = "";
    String password = "";
    String gender = "";
    String fav_col = "";
    
    // Populate user details if user object exists
    if (user != null) {
        email = user.getEmail();
        name = user.getName();
        password = user.getPassword();
        gender = user.getGender();
        fav_col = user.getFavouriteColour();
    }
%>  

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <style>
            /* Styling for the welcome page */
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
                align-items: center;
                text-align: center; 
            }
            .next {
                font-size: 25px;
            }
        </style>
    </head>
    <body>
        <!-- Display welcome message and user details if terms of service are accepted -->
        <div class="header">
            <div class="title">Welcome Page</div>
        </div>
        <div class="details">
            <h1>Welcome, <%= name%>!</h1>
            <p>Your Email is <%= email%></p>
            <p>Your password is <%= password%></p>
            <p>Your gender is <%= gender%></p>
            <p>Your favourite colour is <%= fav_col%></p>
        
            <br>
            <div class="next">
                <p>Click <a href="main.jsp">here</a> to proceed to the main page.</p>
            </div>
        </div>
    </body>
</html>

