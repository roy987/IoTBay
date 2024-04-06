<%-- 
    Document   : welcome
    Created on : 15 Mar 2024, 4:59:30 pm
    Author     : Roy
--%>
<%@ page import="uts.isd.model.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.Serializable" %>
<!DOCTYPE html>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String favcol = request.getParameter("favcol");
    boolean tos = request.getParameter("tos") != null && "on".equals(request.getParameter("tos"));
    
  // Creating a new instance of User
    User user = new User(email, name, password, gender, favcol);

    // Storing the User instance into the session
    HttpSession userSession = request.getSession();
    
    List<User> userList = (List<User>) session.getAttribute("userList");
    userList.add(user);
    session.setAttribute("userList", userList);
    
    session.setAttribute("user", user);
    
 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <style>
        
        </style>
    </head>
    <body bgcolor="<%= favcol %>">
        <% if (tos) { %>
            <h1>Welcome, <%= name%>!</h1>
            <p>Your Email is <%= email%></p>
            <p>Your password is <%= password%></p>
            <p>Your gender is <%= gender%></p>
            <p>Your favourite colour is <%= favcol%></p>
            <p>Click <a href="index.jsp">here</a> to proceed to the main page.</p>
        <% } else { %>
            <p>Sorry, you must agree to the Terms of Service.</p>
            <br>
            <a href="./register.jsp">Click here to go back</a>
        <% } %>
    </body>
    
</html>
