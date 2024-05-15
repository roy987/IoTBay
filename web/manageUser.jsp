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
    String phone = "";
    
    // Populate user details if user object exists
    if (user != null) {
        email = user.getEmail();
        name = user.getName();
        password = user.getPassword();
        phone = user.getPhone();
    }
%>  

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
        .emailInput {
            background-color: #f2f2f2; 
        }
        .deleteButton {
            background-color: red;
            color: white;
            cursor: pointer;
            display: block;
            float: left; /* or you can use display: inline-block; */
        }
    </style>
</head>
<body>
    <!-- Header section for the registration page -->
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

                    <li class="nav-item dropdown">
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="UserLogsController">View Logs</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="title">Manage User Details</div>
    <!-- Registration form section -->
    <div class="details">
        <form action="ManageUserController" method="POST">
            <label>Email: </label>
            <input class="emailInput" name="email" value=<%= email %> readonly></input><br><br>
            <label>Name: </label>
            <input name="name" value=<%=name%>></input><br><br>
            <label>Password: </label>
            <input name="password" type="password" value=<%=password%>></input><br><br>
            <label>Phone Number: </label>
            <input name="phone" value=<%=phone%>></input><br><br>
            <input type="submit" value="Change details">
        </form>
        <br><br>
        <form action="DeleteUserController" method="POST">
            <input type="hidden" name="email" value="<%= email %>">
            <input type="submit" value="Delete User" class="deleteButton">
        </form>
    </div>
</body>
</html>
