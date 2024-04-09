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

<!DOCTYPE html>
<html>
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
        
//        if (session_user != null) {
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
        <h1>Login Success</h1>
        <p><a href="main.jsp">Continue</a></p>
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
