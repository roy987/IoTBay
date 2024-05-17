<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Shipping Details</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    .navbar {
        padding: 20px;
    }
    .navbar-brand {
        font-size: 30px;
    }
    .heading {
        font-size: 30px;
    }
    .centre {
        padding-top: 20px;
        text-align: center;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    
    .form-group select {
        width: 40%; /* Adjust the width as needed */
        padding: 8px;
        box-sizing: border-box;
    }
    .form-group input {
        width: 40%;
        padding: 8px;
        box-sizing: border-box;
    }
    .addButton {
        margin-top: 30px;
    }
    .addButton a {
        color: blue;
        padding: 10px 15px;
        margin: 0 10px;
        border: 1px solid blue;
        border-radius: 5px;
        text-decoration: none;
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

<div class="centre">
    <div class="heading">
        <p>Add Shipping Details</p>
    </div>
    <div class="shippingDisplay">
        <form action="ShippingController" method="post">
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" placeholder="Enter address" required>
            </div>
            <div class="form-group">
                <label for="method">Method:</label>
                <select id="method" name="method" required>
                    <option value="Standard">Standard</option>
                    <option value="Express">Express</option>
                </select>
            </div>
            <div class="form-group">
                <label for="date">Preferred Delivery Date</label>
                <input type="date" id="date" name="date" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Save</button>
                
                <input type="hidden" id="action" name="action" value="save">
                <button type="button" id="deleteButton" class="btn btn-danger" onclick="deleteShippingDetails()">Delete</button>
                
                <a href="./shippingMain.jsp" class="btn btn-secondary">Back</a>
            </div>
        </form>
    </div>
</div>

<script>
    function deleteShippingDetails() {
        document.getElementById('action').value = 'delete';
        document.querySelector('form').submit();
    }
</script>
</body>
</html>
