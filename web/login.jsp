<%-- 
    Document   : login
    Created on : 5 Apr 2024, 2:39:18 pm
    Author     : jakesolsky
--%>
<%@ page import="uts.isd.model.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <div>
            <h1>Login</h1>
        <p><a href="index.jsp">Back</a></p>
        <form action="./loginConfirm.jsp" method="post">
        <label>Email: </label>
            <input name="email"></input><br>
            <br>
        <label>Password: </label>
            <input name="password" type="password"></input><br>
            
        <input type="submit" value="login">
        <form/>
        </div>
    </body>
</html>