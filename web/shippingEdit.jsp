<%-- 
    Document   : shippingEdit
    Created on : 14 May 2024, 10:05:55 pm
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
            
            .shippingDisplay{
                
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
<a class="nav-link" href="#">Shipping</a>
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
        <p>Shipping Details</p>
    </div>
    
    <form action="shipping" method="post">
        <input type="text" name="address" placeholder="Enter address" required>
        <input type="text" name="method" placeholder="Enter method" required>
        <input type="date" name="date" required>
        <button type="submit">Add/Update Details</button>// fix this
    </form>
</div>
</body>
</html>
