<%-- 
    Document   : editDeviceDetails
    Created on : 17 May 2024, 10:15:44 am
    Author     : caitlinbaker
--%>

<%@page import="uts.isd.model.Device"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Device Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Device Details</h2>
        <%
            Device device = (Device) session.getAttribute("device");
            if (device != null) {
        %>
        <form action="UpdateDeviceServlet" method="post">
            <input type="hidden" name="deviceId" value="<%= device.getDeviceId() %>">
            <div class="form-group">
                <label for="deviceName">Device Name:</label>
                <input type="text" class="form-control" name="deviceName" value="<%= device.getDeviceName() %>">
            </div>
            <div class="form-group">
                <label for="deviceCategory">Device Category:</label>
                <input type="text" class="form-control" name="deviceCategory" value="<%= device.getDeviceCategory() %>">
            </div>
            <div class="form-group">
                <label for="deviceBrand">Device Brand:</label>
                <input type="text" class="form-control" name="deviceBrand" value="<%= device.getDeviceBrand() %>">
            </div>
            <div class="form-group">
                <label for="deviceQuantity">Device Quantity:</label>
                <input type="number" class="form-control" name="deviceQuantity" value="<%= device.getDeviceQuantity() %>">
            </div>
            <div class="form-group">
                <label for="devicePrice">Device Price:</label>
                <input type="text" step="0.01" class="form-control" name="devicePrice" value="<%= device.getDevicePrice() %>">
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
        <%
            } else {
                out.println("<p>No device found.</p>");
            }
        %>
    </div>
</body>
</html>
