<%-- 
    Document   : manageUser
    Created on : 9 May 2024, 10:42:20 am
    Author     : jakesolsky
--%>

<%@ page import="uts.isd.model.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
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
    <title>Edit registration</title>
    <!-- Styling for the manageUser page -->
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
        .logout {
            text-align: center;
            display:flex;
            align-items:end;
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
        .emailInput {
            background-color: #f2f2f2; 
        }
    </style>
    </head>
    <body>
        <!-- Header section for the registration page -->
        <div class="header">
            <div class="title">Manage User</div>
        </div>
        
        <!-- Registration form section -->
        <div class="details">
            <form action="ManageUserController" method="POST">
                <label>Email: </label>
                <input class="emailInput" name="email" value=<%= email %> readonly></input><br><br>
                <label>Name: </label>
                <input name="name" value=<%=name%>></input><br><br>
                <label>Password: </label>
                <input name="password" type="password" value=<%=password%>></input><br><br>
                <label>Gender: </label>
                <input name="gender" value=<%=gender%>></input><br><br>
                <label>Favorite Color: </label>
                <input name="fav_col" value=<%=fav_col%>></input><br><br>
                <input type="submit" value="Change details">
            </form>
        </div>
    </body>
</html>
