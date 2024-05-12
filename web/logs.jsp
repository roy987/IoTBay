<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.User" %>
<%@ page import="uts.isd.model.UserLog" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>


<!DOCTYPE html>
<html>
<%
    String userEmail = (String) session.getAttribute("userEmail");

    // Retrieve user logs by email
    List<UserLog> userLogs = (List<UserLog>) session.getAttribute("userLogs");
%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .navbar{
                padding: 20px;
            }
            .navbar-brand{
                font-size: 30px;
            }
        </style>

    </head>
<body>
        <h1>User Logs</h1>
        <!--<p><%= userLogs.get(0) %></p>-->
        <%
        if (userLogs == null) {
            out.println("<p>No logs found for user: " + userEmail + "</p>");
        } else {
            out.println("<table border='1'>");
            out.println("<tr><th>Log ID</th><th>Event Type</th><th>Event Time</th></tr>");
            for (UserLog log : userLogs) {
                out.println("<tr>");
                out.println("<td>" + log.getLogId() + "</td>");
                out.println("<td>" + log.getEventType() + "</td>");
                out.println("<td>" + log.getEventTime() + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        }
        %>
</body>
</html>