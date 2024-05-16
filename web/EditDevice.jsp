<%-- 
    Document   : EditDevice
    Created on : 15 May 2024, 2:44:46 pm
    Author     : caitlinbaker
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Devices</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <a class="navbar-brand" href="./index.jsp">IoTBay</a>
                <div class="d-flex justify-content-between w-100">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item ">
                                <a class="nav-link" href="login.jsp">Login </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="registerStaff.jsp">Register (Staff)</a>
                        </li>

                        <li class="nav-item dropdown">
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="registerCustomer.jsp">Resister (Customer)</a>
                        </li>
                        
                        <li class ="nav-item">
                            <a class="nav-link" href="DeviceList.jsp">Device List</a>
                        </li>
                        
                        <li class ="nav-item">
                            <a class="nav-link" href="FindDevice.jsp">Search Device</a>
                        </li>
                        
                        <li class ="nav-item">
                            <a class="nav-link" href="AddDevice.jsp">Add Device</a>
                        </li>
                        
                        <li class="nav-item">
                        <a class="nav-link" href="EditDevice.jsp">Manage Devices</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        
       <div class ="container my-3">
            <div class ="table-responsive">
                <table class="table table-sm table-bordered">
                    <p class="display-6">Devices</p>
                    <p class="display-7">USER ID: <%=user.getuseremail()%></p>
                    <p class="display-7">user Name: <%=user.getname()%> 
                    <p class="display-7">user Name: <%=user.getusercustomer()%>
                    <thead>
                      <tr>
                        <th scope="col">Device ID</th>
                        <th scope="col">Device Name</th>
                        <th scope="col">Device Category</th>
                        <th scope="col">Device Brand</th>
                        <th scope="col">Device Price</th>
                        <th scope="col">Device Quantity</th>
                      </tr>
                    </thead>
                    <% 
                        try {
                        for (Device device : devices) {
                    %>
                    <tr>
                        <td><%=device.getDeviceID()%></td>
                        <td><%=device.getDeviceName()%></td>
                        <td><%=device.getDeviceCategory()%></td>
                        <td><%=device.getDeviceBrand()%></td>
                        <td><%=device.get=DevicePrice()%></td>
                        <td><%=device.getDeviceQuantity()%></td>
                    </tr>
                    <%
                        }

                        } catch (Exception e) {
                        e.printStackTrace();
                        }
                    %>
                </table> 
            </div>
        </div>
        <div class ="container my-3">
            <div class ="table-responsive">
                <form action="editDeviceServlet" method="POST">
                    <table class="table table-sm table-bordered">
                        <p class="display-6">Edit Device</p>
                        <thead>
                          <tr>
                            <th scope="col">Device ID</th>
                            <th scope="col">Device Name</th>
                            <th scope="col">Device Category</th>
                            <th scope="col">Device Brand</th>
                            <th scope="col">Device Price</th>
                            <th scope="col">Device Quantity</th>
                          </tr>
                        </thead>
                        <tr>
                            <td><input type="text" class="device-field" name="deviceID" placeholder="Enter Device ID"></td>
                            <td><input type="text" class="device-field" name="deviceName" placeholder="Enter Device Name"></td>
                            <td><input type="text" class="device-field" name="deviceCategory" placeholder="Enter Device Category"></td>
                            <td><input type="text" class="device-field" name="deviceBrand" placeholder="Enter Device Brand"></td>
                            <td><input type="text" class="device-field" name="devicePrice" placeholder="Enter Device Price"></td>
                            <td><input type="text" class="device-field" name="deviceQuantity" placeholder="Enter Device Quantity"></td>
                        </tr>
                        <tr>
                            <button type="submit" class="btn btn-primary">Edit</button>
                        </tr>
                    </table> 
                </form>
            </div>
        </div>
        <div class ="container my-3">
            <p class="display-6">Delete Device</p>
            <form action="deleteDeviceServlet" method="POST">
                <div class="form-group pb-4">
                  <label for="deviceID">Device ID:</label>
                  <input type="number" class="device-field" name="deviceID" placeholder="Enter Device ID">
                </div>
                <button type="submit" class="btn btn-primary ">Delete</button>
            </form>
        </div>
    </body>
</html>
