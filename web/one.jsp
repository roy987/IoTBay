<%-- 
    Document   : one
    Created on : 28 Mar 2024, 7:27:06 pm
    Author     : Roy
--%>

<%@ page import="java.util.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    // Retrieve user registration parameters from request
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String favcol = request.getParameter("favcol");
    boolean tos = "on".equals(request.getParameter("tos"));
    String submitted = request.getParameter("submitted"); 
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <!-- CSS for body background color -->
        <style>
            body {
                background-color: <%= favcol %>;
            }
        </style>
    </head>
    
    <body>
        <% 
            // Check if the form has been submitted
            if (submitted != null && submitted.equals("yes")) {
        %>
            <% 
                // Display user details if terms of service are accepted
                if (tos) { 
            %>
                    <p>Welcome, <%= name%>!</p>
                    <p>Your Email is <%= email%></p>
                    <p>Your password is <%= password%></p>
                    <p>Your gender is <%= gender%></p>
                    <p>Your favourite colour is <%= favcol%></p>
            <% 
                } else { 
            %>
                    <p>Sorry, you must agree to the Terms of Service.</p>
                    <br>
                    <a href="./register.jsp">Click here to go back</a>
            <% 
                } 
            %>
        
        <% } else { %>
            <!-- Display registration form if form has not been submitted -->
            <form method="POST">
                <label>Email: </label>
                <input name="email"></input><br><br>
                <label>Name: </label>
                <input name="name"></input><br><br>
                <label>Password: </label>
                <input name="password" type="password"></input><br><br>
                <label>Gender: </label>
                <input name="gender"></input><br><br>
                <label>Favorite Color: </label>
                <input name="favcol"></input><br><br>
                <label>Terms And Conditions: </label>
                <input type="checkbox" name="tos"></input><br><br>
                <input type="hidden" name="submitted" value="yes">
                <input type="submit" value="Register">
            </form>
        <% } %>
    </body>
</html>
