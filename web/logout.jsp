<%-- 
    Document   : logout
    Created on : 29 Mar 2024, 4:19:37 pm
    Author     : Roy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
    <body>
          <% 
              session.setAttribute("user", null);
              
//              HttpSession userSession = request.getSession();
//           userSession.invalidate(); 
          %>
        <p>You have been logged out. Click <a href="index.jsp">here</a> to return to the main page</p>
    </body>
</html>
