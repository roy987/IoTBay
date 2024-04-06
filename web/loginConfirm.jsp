<%-- 
    Document   : loginConfirm
    Created on : 6 Apr 2024, 10:58:48 am
    Author     : jakesolsky
--%>

<%@ page import="uts.isd.model.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ page session="true" %>--%>

<!DOCTYPE html>
<html>
    <%
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String expected_email = "Iot@mail.com";
        String expected_password = "12345";

        if((email == expected_email) && (password == expected_password)){
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
        <h1>Login Success</h1>
        <p><a href="welcome.jsp">Continue</a></p>
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
        <h1>Login Failure</h1>
        <p><a href="login.jsp">Back</a></p>
    </body>
    <% } %>
       
    </body>
</html>
