<%-- 
    Document   : index
    Created on : 29 Mar 2024, 3:58:04 pm
    Author     : Roy
--%>
<%@ page import="uts.isd.model.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.Serializable" %>

<% 
    HttpSession userSession = request.getSession();
    List<User> userList = (List<User>) userSession.getAttribute("userList");

    if (userList == null) {
        userList = new ArrayList<>();
        userList.add(new User("iot@mail.com", "Iot1", "123", "M", "red"));
    }
    session.setAttribute("userList", userList); 
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
        <style>
            .page {
            background-color:#FAF9F6;
            }
            .header {
            padding:20px;
            background-color: lightblue;
            border-radius: 10px; 
            display:flex;
            text-align:center;
            justify-content:space-between;
            }
             .login {
            text-align: start;
            align-items:end;
            }
            .title {
            font-weight: bold;
            font-size:60px;
            text-align: center;
            display:flex;
    
            align-items:center;
            }
            .details {
            margin-top: 20px;
            font-size:20px;
            font-style:italic;
            
            }
            .pageList {
            margin-left: 20px;
            }
            .pageContent {
            padding:30px;
            padding-top:15px;
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
            
            <div class="login">
                <p>You are not logged in</p>
                <a href="login.jsp">Login</a> <br>
                <a href="register.jsp">Register</a>
            </div>
       </div>
       <div>
           <div class="pageContent">
               <div class="details">
                   <p>Hi! Welcome to IoTBay, your one stop shop for all the devices you need</p>
                     
               </div>
                       <div class="imageSection">
                           <img class="image" src="Resources/new-footer-image.png" alt="Image at bottom of main page">
                       </div>
           </div>
       </div>
   </body>
</html>
