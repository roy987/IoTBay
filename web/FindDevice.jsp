<%-- 
    Document   : FindDevice
    Created on : 15 May 2024, 2:10:36 pm
    Author     : caitlinbaker
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Find Device </title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
    </body>     
        <div class ="container my-3">
            <p class="display-6">Find Device</p>
            <form action="EditDeviceController" method="POST">
                <div class="form-group pb-4">
                  <label for="deviceID">Device ID:</label>
                  <input type="number" class="device-field" name="deviceID" placeholder="Enter Device ID">
                </div>
                <div class="form-group pb-4">
                  <label for="deviceID">Device Category:</label>
                  <input type="text" class="device-field" name="deviceCategory" placeholder="Enter Device Category">
                </div>
                <button type="submit" class="btn btn-primary ">Submit</button>
            </form>
        </div>
</html>
