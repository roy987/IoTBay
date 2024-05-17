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
    <title>Main</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .title {
            font-weight: bold;
            font-size: 40px;
            text-align: center;
            display: flex;
            align-items: center;
        }
        .details {
            margin-top: 50px;
            font-size: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: left; 
        }
        label {
            width: 150px; 
            display: inline-block;
        }
        .terms-label {
            width: auto; 
            white-space: nowrap; 
            margin-right: 10px; 
        }
        .content{
            padding: 15px;
        }
    </style>
</head>
<%@page import="uts.isd.model.User"%>
<%
    User user = (User) session.getAttribute("user");
    String home = "index.jsp";
    
    if (user != null) {
        home = "main.jsp";
    }

%>
<body>
    <div class="header">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href=<%=home%>>IoTBay</a>
            <div class="d-flex justify-content-between w-100">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="products.jsp">Products</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="orders.jsp">Orders</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="payment_1.jsp">Payment</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="shippingMain.jsp">Shipping</a>
                    </li>   


                </ul>

                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="UserLogsController">View Logs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manageUser.jsp">Manage Account</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutController">Logout</a>
                    </li>
                    <li class ="nav-item">
                         <a class="nav-link" href="DeviceListController">Device List</a>
                    </li>
                        
                    <li class ="nav-item">
                         <a class="nav-link" href="FindDevice.jsp">Search Device</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="EditDevice.jsp">Manage Devices</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="title">User Logs</div>
    <div class="content">
        <%
        if (userLogs == null) {
            out.println("<p>No logs found for user: " + userEmail + "</p>");
        } else {
            out.println("<table border='1'>");
            out.println("<tr><th class=\"content\">Log ID</th><th class=\"content\">Event Type</th><th class=\"content\">Event Date and Time</th></tr>");
            for (UserLog log : userLogs) {
                out.println("<tr>");
                out.println("<td class=\"content\">" + log.getLogId() + "</td>");
                out.println("<td class=\"content\">" + log.getEventType() + "</td>");
                out.println("<td class=\"content\">" + log.getEventTime() + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        }
        %>
    </div>
</body>
</html>