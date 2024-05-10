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
    <title>Main Page</title>
    <!-- Styling for the main page -->
    <style>
        .page {
            background-color:#FAF9F6;
        }
        .header {
            padding:20px;
            background-color: <%= fav_col %>; /* Set header background color based on user's favorite color */
            border-radius: 10px; 
            display:flex;
            text-align:center;
            justify-content:space-between;
        }
        .pageLink {
            text-align: start;
            align-items: end;
        }
        .title {
            font-weight: bold;
            font-size:60px;
        }
        .details {
            margin-top: 20px;
            font-size:25px;
        }
        .infoItems {           
            text-align:center;
            align-items:center;  
            background-color: <%= fav_col %>; /* Set section background color based on user's favorite color */
            margin-left:30%;
            margin-right:30%;
            border-radius:20px;
            padding:20px;
        }
        .imageSection{
            display:flex;
            justify-content:center;
            margin-top:6%;
        }
        .image {
            border-radius:20px;
            width:90%;
            opacity:0.5;
            height:10%;
        }
    </style>
</head>
<body class="page">
    <!-- Header section with IoTBay title and logout link -->
    <div class="header">
        <div class="title">IoTBay</div>
        <div class="pageLink">
            <p>logged in as <%= email %></p>
            <a href="logout.jsp">Logout</a><br>
            <a href="manageUser.jsp">Manage User</a>  
        </div>
    </div>
    
    <!-- Main content section -->
    <div class="pageContent">
        <div class="details">
            <p>Hi <%= user.getName() %>! Here's a bit about yourself,</p>
            <!-- Display user information in a styled container -->
            <div class="infoItems">
                <%= text_message %> <br><br>
                Your email is <%= email %> <br><br>
                Your password is <%= password %><br><br>
                Your gender is <%= gender %><br><br>
                Your favourite colour is <%= fav_col %>
            </div>
        </div>
        <!-- Image section at the bottom of the page -->
        <div class="imageSection">
            <img class="image" src="Resources/new-footer-image.png" alt="Image at bottom of main page">
        </div>
    </div>
</body>
</html>
