<%-- 
    Document   : register
    Created on : 15 Mar 2024, 4:45:02 pm
    Author     : Roy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.User" %>
<%@ page session="true" %>

<%
    session = request.getSession();
    User user = (User) session.getAttribute("user");
    
    // Check if the form has been submitted
    if (request.getMethod().equals("POST")) {
        // Update user details from the form data
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String favcol = request.getParameter("favcol");
        
        // Update user object with new data
        user.setEmail(email);
        user.setName(name);
        user.setPassword(password);
        user.setGender(gender);
        user.setFavouriteColour(favcol);
        
        // Update user object in session
        session.setAttribute("user", user);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
        <style>
            .title {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div>
            <h1 class="title">My Account</h1>
      
     <form action="" method="POST">
        <label>Email: </label>
        <input name="email" value="<%= user.getEmail() %>"><br><br>
        
        <label>Full name: </label>
        <input name="name" value="<%= user.getName() %>"><br><br>
        
        <label>Password: </label>
        <input name="password" type="password" value="<%= user.getPassword() %>"><br><br>
        
        <label>Gender: </label>
        <input name="gender" value="<%= user.getGender() %>"><br><br>
        
        <label>Favorite Color: </label>
        <input name="favcol" value="<%= user.getFavouriteColour() %>"><br><br>
        
        
        <input type="submit" value="Save">
    </form>
        <p>Return to the <a href="index.jsp">main</a> page</p>
        </div>
    </body>
</html>
