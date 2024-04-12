<%-- 
    Document   : welcome
    Created on : 15 Mar 2024, 4:59:30 pm
    Author     : Roy
--%>

<%@ page import="uts.isd.model.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.Serializable" %>

<!DOCTYPE html>

<%
    // Retrieve user registration parameters from request
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String favcol = request.getParameter("favcol");
    boolean tos = request.getParameter("tos") != null && "on".equals(request.getParameter("tos"));
    
    // Create a new User instance with the provided information
    User user = new User(email, name, password, gender, favcol);

    // Retrieve or create a session and user list
    HttpSession userSession = request.getSession();
    List<User> userList = (List<User>) userSession.getAttribute("userList");
    
    // If the user list is null (first session access), create a new list
    if (userList == null) {
        userList = new ArrayList<>();
    }
    
    // Add the new User instance to the user list
    userList.add(user);
    
    // Store the updated user list and the current user in session attributes
    userSession.setAttribute("userList", userList);
    userSession.setAttribute("user", user);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <style>
            /* Styling for the welcome page */
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
                align-items: center;
                text-align: center; 
            }
            .next {
                font-size: 25px;
            }
        </style>
    </head>
    <body>
        <% if (tos) { %>
        <!-- Display welcome message and user details if terms of service are accepted -->
        <div class="header">
            <div class="title">Welcome Page</div>
        </div>
        <div class="details">
            <h1>Welcome, <%= name%>!</h1>
            <p>Your Email is <%= email%></p>
            <p>Your password is <%= password%></p>
            <p>Your gender is <%= gender%></p>
            <p>Your favourite colour is <%= favcol%></p>
        
            <br>
            <div class="next">
                <p>Click <a href="main.jsp">here</a> to proceed to the main page.</p>
            </div>
        </div>
        <% } else { %>
        <!-- Display error message if terms of service are not accepted -->
        <p>Sorry, you must agree to the Terms of Service.</p>
        <br>
        <a href="./register.jsp">Click here to go back</a>
        <% } %>
    </body>
</html>

