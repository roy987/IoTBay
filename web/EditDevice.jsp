<%-- 
    Document   : EditDevice
    Created on : 15 May 2024, 2:44:46 pm
    Author     : caitlinbaker
--%>
<%@page import="uts.isd.model.Device"%>
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
    <title>Edit Device</title>
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
    <body>
    <%
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null || !((User) session.getAttribute("user")).isStaff()) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Device> devices = (List<Device>) request.getAttribute("devices");
        String errorMessage = (String) request.getAttribute("errorMessage");
    %>
    <h1>Edit Device</h1>
    <%
        if (errorMessage != null) {
            out.println("<p style='color: red;'>" + errorMessage + "</p>");
        }
    %>
    <h2>Add New Device</h2>
    <form action="EditDeviceController" method="post">
        <input type="hidden" name="action" value="add">
        <label for="newDeviceName">Device Name:</label>
        <input type="text" id="newDeviceName" name="deviceName">
        <br><br>
        <label for="newDeviceCategory">Device Category:</label>
        <input type="text" id="newDeviceCategory" name="deviceCategory">
        <br><br>
        <label for="newDeviceBrand">Device Brand:</label>
        <input type="text" id="newDeviceBrand" name="deviceBrand">
        <br><br>
        <label for="newDeviceQuantity">Device Quantity:</label>
        <input type="text" id="newDeviceQuantity" name="deviceQuantity">
        <br><br>
        <label for="newDevicePrice">Device Price:</label>
        <input type="text" id="newDevicePrice" name="devicePrice">
        <br><br>
        <input type="submit" value="Add Device">
    </form>
    <h2>Device List</h2>
    <table border="1">
        <tr>
            <th>Device ID</th>
            <th>Device Name</th>
            <th>Device Category</th>
            <th>Device Brand</th>
            <th>Device Quantity</th>
            <th>Device Price</th>
            <th>Actions</th>
        </tr>
        <%
            if (devices != null) {
                for (Device device : devices) {
                    out.println("<tr>");
                    out.println("<td>" + device.getDeviceId() + "</td>");
                    out.println("<td>" + device.getDeviceName() + "</td>");
                    out.println("<td>" + device.getDeviceCategory() + "</td>");
                    out.println("<td>" + device.getDeviceBrand() + "</td>");
                    out.println("<td>" + device.getDeviceQuantity() + "</td>");
                    out.println("<td>" + device.getDevicePrice() + "</td>");
                    out.println("<td>");
                    out.println("<form action='EditDeviceController' method='post' style='display:inline;'>");
                    out.println("<input type='hidden' name='action' value='edit'>");
                    out.println("<input type='hidden' name='deviceId' value='" + device.getDeviceId() + "'>");
                    out.println("<input type='submit' value='Edit'>");
                    out.println("</form>");
                    out.println("<form action='EditDeviceController' method='post' style='display:inline;'>");
                    out.println("<input type='hidden' name='action' value='delete'>");
                    out.println("<input type='hidden' name='deviceId' value='" + device.getDeviceId() + "'>");
                    out.println("<input type='submit' value='Delete'>");
                    out.println("</form>");
                    out.println("</td>");
                    out.println("</tr>");
                }
            }
        %>
    </table>
    <%
        Device editDevice = (Device) request.getAttribute("editDevice");
        if (editDevice != null) {
    %>
    <h2>Edit Device Details</h2>
    <form action="EditDeviceController" method="post">
        <input type="hidden" name="action" value="save">
        <input type="hidden" name="deviceId" value="<%= editDevice.getDeviceId() %>">
        <label for="deviceName">Device Name:</label>
        <input type="text" id="deviceName" name="deviceName" value="<%= editDevice.getDeviceName() %>">
        <br><br>
        <label for="deviceCategory">Device Category:</label>
        <input type="text" id="deviceCategory" name="deviceCategory" value="<%= editDevice.getDeviceCategory() %>">
        <br><br>
        <label for="deviceBrand">Device Brand:</label>
        <input type="text" id="deviceBrand" name="deviceBrand" value="<%= editDevice.getDeviceBrand() %>">
        <br><br>
        <label for="deviceQuantity">Device Quantity:</label>
        <input type="text" id="deviceQuantity" name="deviceQuantity" value="<%= editDevice.getDeviceQuantity() %>">
        <br><br>
        <label for="devicePrice">Device Price:</label>
        <input type="text" id="devicePrice" name="devicePrice" value="<%= editDevice.getDevicePrice() %>">
        <br><br>
        <input type="submit" value="Save">
    </form>
    <%
        }
    %>
</body>
</html>