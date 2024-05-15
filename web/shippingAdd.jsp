<%-- 
    Document   : shippingAdd
    Created on : 14 May 2024, 10:05:25 pm
    Author     : jyapr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            
            .heading{
                font-size:30px;
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

            .form-group input {
                width: 40%;
                padding: 8px;
                box-sizing: border-box;
            }
            
            .addButton {
                color: 'red';
              
            }
            

</style>
 
    </head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
<a class="navbar-brand" href="./main.jsp">IoTBay</a>
<div class="d-flex justify-content-between w-100">
<ul class="navbar-nav mr-auto">
<li class="nav-item ">
<a class="nav-link" href="#">Products</a>
</li>
<li class="nav-item">
<a class="nav-link" href="#">Orders</a>
</li>
<li class="nav-item dropdown">
</li>
<li class="nav-item">
<a class="nav-link" href="shippingMain.jsp">Shipping</a>
</li>
<li class="nav-item">
<a class="nav-link" href="#">My Account</a>
</li>
</ul>
<ul class="navbar-nav ml-auto">
<li class="nav-item ">
<a class="nav-link" href="#">Logout</a>
</li>
</ul>
</div>
</nav>

<div class="centre">
    <div class="heading">
        <p>Add Shipping Details</p>
    </div>
    <div class="shippingDisplay">
        <form action="submitForm" method="post">
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" placeholder="Enter address" required>
            </div>
            <div class="form-group">
                <label for="method">Method:</label>
                <input type="text" id="method" name="method" placeholder="Enter method" required>
            </div>
            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>
            </div>

        </form>
    </div>
            
            <div class="addButton">
                <a href="./shippingMain.jsp">Add Details</a>
            </div>
            
</div>
</body>
</html>
