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
    
    List<User> userList = (List<User>) userSession.getAttribute("userList");
    
    userList.add(user);
    
    userSession.setAttribute("userList", userList);
    userSession.setAttribute("user", user);

    
 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
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
           
                align-items: center;
                text-align: center; 
            }
            
            .next{
                font-size: 25px;
            }
        </style>
    </head>
    <body>
        <% if (tos) { %>
        <div class=header>
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
            <p>Sorry, you must agree to the Terms of Service.</p>
            <br>
            <a href="./register.jsp">Click here to go back</a>
        <% } %>
    </body>
    
</html>
