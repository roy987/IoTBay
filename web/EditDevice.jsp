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
    </style>
</head>
<body>
    <div class="header">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="./index.jsp">IoTBay</a>
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
                        <a class="nav-link" href="DeviceList.jsp">Device List</a>
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
        <h2>Edit Devices</h2>
        <%
            List<Device> devices = null;
            try {
                String driverName = "org.apache.derby.jdbc.ClientDriver";
                String connectionUrl = "jdbc:derby://localhost:1527/devicedb";
                String userId = "APP";
                String password = "APP"; // Add your database password here

                Class.forName(driverName);
                Connection connection = DriverManager.getConnection(connectionUrl, userId, password);
                DBDevice dbManager = new DBDevice(connection);
                devices = dbManager.getAllDevices();

                session.setAttribute("devices", devices); // Store devices in session for use in JSP
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }

            if (devices != null && !devices.isEmpty()) {
        %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>DeviceID</th>
                    <th>DeviceName</th>
                    <th>DeviceCategory</th>
                    <th>DeviceBrand</th>
                    <th>DeviceQuantity</th>
                    <th>DevicePrice</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Device device : devices) {
                %>
                <tr>
                    <td><%= device.getDeviceId() %></td>
                    <td><%= device.getDeviceName() %></td>
                    <td><%= device.getDeviceCategory() %></td>
                    <td><%= device.getDeviceBrand() %></td>
                    <td><%= device.getDeviceQuantity() %></td>
                    <td><%= device.getDevicePrice() %></td>
                    <td>
                        <form action="DeleteDeviceController" method="post" style="display:inline;">
                            <input type="hidden" name="deviceId" value="<%= device.getDeviceId() %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                        <form action="EditDeviceController" method="post" style="display:inline;">
                            <input type="hidden" name="deviceId" value="<%= device.getDeviceId() %>">
                            <button type="submit" class="btn btn-primary">Edit</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            } else {
                out.println("<p>No devices found.</p>");
            }
        %>
    </div>
</body>
</html>