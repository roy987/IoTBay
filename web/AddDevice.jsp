<%-- 
    Document   : AddDevice
    Created on : 15 May 2024, 10:31:31 am
    Author     : caitlinbaker
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Device</title>
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
                    <p class="display-6">Device</p>
                    <thead>
                      <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Brand</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td> <input class='add-device' type="text" placeholder="Enter DeviceID" name="deviceID" > </td>                        <td> <input class='add-product' type="text" placeholder="Enter Serial_Num" name="serialNum" > </td>
                        <td> <input class='add-device' type="text" placeholder="Enter DeviceName" name="device_name" > </td>
                        <td> <input class='add-device' type="text" placeholder="Enter Category" name="category" > </td>
                        <td> <input class='add-device' type="text" placeholder="Enter Brand" name="brand" > </td>
                        <td> <input class='add-device' type="text" placeholder="Enter Price" name="price" > </td>
                        <td> <input class='add-device' type="text" placeholder="Enter Quantity" name="quantity" > </td>
                      </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn-container" style="margin-top: 0.5cm">
                <button type="submit" class="add-device btn btn-outline-secondary btn-lg">Add</button>
            </div>
        </div>
    
    
    
    </body>
    
</html>
