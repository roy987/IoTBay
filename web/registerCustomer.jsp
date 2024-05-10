<%-- 
    Document   : register
    Created on : 15 Mar 2024, 4:45:02 pm
    Author     : Roy
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Styling for the registration page -->
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
        <title>Register Page</title>
    </head>
    
    <body>
        <!-- Header section for the registration page -->
        <div class="header">
            <div class="title">Register</div>
        </div>
        
        <!-- Registration form section -->
        <div class="details">
            <form action="RegistrationCustomerController" method="POST">
                <label>Email: </label>
                <input name="email"></input><br><br>
                <label>Name: </label>
                <input name="name"></input><br><br>
                <label>Password: </label>
                <input name="password" type="password"></input><br><br>
                <label>Gender: </label>
                <input name="gender"></input><br><br>
                <label>Favorite Color: </label>
                <input name="fav_col"></input><br><br>
                <label class="terms-label">Terms And Conditions: </label>
                <input type="checkbox" name="tos"></input><br><br>
                
                <input type="submit" value="Register">
            </form>
        </div>
    </body>
</html>
