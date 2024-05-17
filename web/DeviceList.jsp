<%-- 
    Document   : DeviceList
    Created on : 15 May 2024, 1:30:22 pm
    Author     : caitlinbaker
--%>
<%@page import="uts.isd.model.Device"%>
<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.dao.DBDevice"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Device List</title>
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
            .navbar{
            padding: 20px;
            }
            .navbar-brand{
                font-size: 30px;
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
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="registerStaff.jsp">Register (Staff)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="registerCustomer.jsp">Register (Customer)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="DeviceListController">Device List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="FindDevice.jsp">Search Device</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="EditDevice.jsp">Manage Devices</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="container mt-5">
        <h2>Device List</h2>
        <table class="table table-bordered">
<!--            <tr>
                <th>DeviceID</th>
                <th>DeviceName</th>
                <th>DeviceCategory</th>
                <th>DeviceBrand</th>
                <th>DeviceQuantity</th>
                <th>DevicePrice</th>                   
            </tr>-->
            
                <%
                    List<Device> devices = (List<Device>) session.getAttribute("devices");
                    out.println("<tr><th class=\"content\">DeviceID</th><th class=\"content\">DeviceName</th><th class=\"content\">Brand</th><th class=\"content\">Category</th><th class=\"content\">Quantity</th><th class=\"content\">Price</th></tr>");
                    
                    for (Device device : devices) {
                        out.println("<tr>");
                        out.println("<td>"+device.getDeviceId()+"</td>");
                        out.println("<td>"+device.getDeviceName()+"</td>");
                        out.println("<td>"+device.getDeviceCategory()+"</td>");
                        out.println("<td>"+device.getDeviceBrand()+"</td>");
                        out.println("<td>"+device.getDeviceQuantity()+"</td>");
                        out.println("<td>"+device.getDevicePrice()+"</td>");
                    }

                %>
        </table>
    </div>
</body>
</html>
