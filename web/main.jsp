<%-- 
    Document   : main
    Created on : 29 Mar 2024, 3:58:04 pm
    Author     : Roy
--%>
<%@ page import="uts.isd.model.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
    User user = (User) session.getAttribute("user");
    String email = "";
    String password = "";
    String gender = "";
    String favColour = "";
    if (user != null) {
        email = user.getEmail();
        password = user.getPassword();
        gender = user.getGender();
        favColour = user.getFavouriteColour();
    }
    

%>  

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Main Page</title>
    <style>
        .page {
            background-color:#FAF9F6;
        }
        .header {
            padding:20px;
            background-color: <%= favColour %>;
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
        .pageList {
            margin-left: 20px;
        }
        .pageContent {
            padding:30px;
            padding-top:15px;
        }
      
        .infoItems {           
            text-align:center;
            align-items:center;  
            background-color: <%= favColour %>;
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
    <div class="header">
        <div class="title">IoTBay</div>
        <div class="logout">
            <a href="logout.jsp">Logout</a>
        </div>
    </div>
    <div>
        <div class="pageContent">
            <div class="details">
                <p>Hi <%= user.getName() %>! Here's a bit about yourself,</p>
                    <div class="infoItems">
                        Your email is <%= email%> <br><br>
                        Your password is <%= password%><br><br>
                        Your gender is <%= gender%><br><br>
                        Your favourite colour is <%= favColour%>
                    </div>
            </div>
                    <div class="imageSection">
                        <img class="image" src="Resources/new-footer-image.png" alt="Image at bottom of main page">
                    </div>
        </div>
    </div>
</body>
</html>
