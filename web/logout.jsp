<%-- 
    Document   : logout
    Created on : 29 Mar 2024, 4:19:37 pm
    Author     : Roy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
    <style>
            
            .title {
                font-weight: bold;
                font-size:40px;
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
                text-align: center; 
            }
            
    </style>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
    <body>
          <% 
//            session.setAttribute("user", null);
              
            HttpSession userSession = request.getSession();
            userSession.invalidate(); 
          %>
        <div class="header">
          <div class="title">You have been logged out.</div>
         </div>
        <div class="details">
        <p>Click <a href="index.jsp">here</a> to return to the main page</p>
        </div>
    </body>
</html>
