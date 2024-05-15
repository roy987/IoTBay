<%-- 
    Document   : shippingView
    Created on : 10 May 2024, 1:47:27 pm
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
        <p>Shipping Details</p>
    </div>
    <div class="shippingDisplay">
        <c:choose>
            <c:when test="${not empty shippingDetails}">
                <p>Shipping Method: ${shippingDetails.method}</p>
                <p>Shipping Address: ${shippingDetails.address}</p>
                <p>Date: ${shippingDetails.date}</p>
            </c:when>
            <c:otherwise>
                <p>No details saved</p>
            </c:otherwise>
        </c:choose>
    </div>
            
            <div class="button">
                <a href="./shippingAdd.jsp">Add Details</a>
            </div>
            
</div>
</body>
</html>
