<%-- 
    Document   : loginConfirm
    Created on : 6 Apr 2024, 10:58:48 am
    Author     : jakesolsky
--%>

<%@ page import="uts.isd.model.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.Serializable" %>
<%--<%@ page session="true" %>--%>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    List<User> userList = (List<User>) session.getAttribute("userList");

    boolean user_found = false;

    int user_index;
    for (User user: userList) {
        if  (email.equals(user.getEmail()) & password.equals(user.getPassword())) {
           user_found = true;
           session.setAttribute("user", user);
        }
    }
%> 

<!DOCTYPE html>
<html>
    <style>
        .title {
            font-weight: bold;
            font-size:60px;
            text-align: center;
            display:flex;
            align-items:center;
        }

        .header {
            padding:30px;
            background-color: lightblue;
            border-radius: 10px; 
            display:flex;
            text-align:center;
            justify-content:space-between;
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
        if (user_found) {
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Success</title>
          <style>
            .title {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="title">Login Success</div>
        </div>
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
        
        <div class="header">
            <div class="title">Login Failed</div>
        </div>
        <div class="details">
            <p><a href="login.jsp">Back</a></p>
        </div>
    </body>
    <% } %>
       
    </body>
</html>
