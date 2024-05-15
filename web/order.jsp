<%-- 
    Document   : order
    Created on : 9 May 2024, 4:07:02 pm
    Author     : Roy
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
            .button-section {
                padding: 10px;
                padding-bottom: 10px;
            }
            .order-page {
                padding: 20px;
            }
            .order-form {
                display: flex;
                align-items: center;
                flex-direction: column;
                justify-content: center;
                width: 100%;
            }
            
        </style>

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">

            <a class="navbar-brand" href="./main.jsp">IoTBay</a>
            <div class="d-flex justify-content-between w-100">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item ">
                        <a class="nav-link" href="#">Products </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Orders</a>
                    </li>
                    <li class="nav-item dropdown">

                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">My Account</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                     <li class="nav-item ">
                        <a class="nav-link" href="#">Logout </a>
                    </li>

                </ul>
            </div>
        </nav>
        <div class="order-page">
            <div class="d-flex justify-content-start w-100 button-section">
                <a href="./orders.jsp" class="btn btn-primary">
                   < My Orders
                </a>
            </div>
            <div class="order-form">
                <h1>My Orders</h1>
                <div class=""> 
                    <form  method="POST">
                        <div class="form-group">
                        <label for="date">Date</label>
                        <input type="text" class="form-control" name="date" placeholder="Enter date" required>
                        <small class="form-text text-muted">Enter today's date</small>
                        </div>
                        <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" class="form-control" name="email" placeholder="Enter email" required>
                        <small class="form-text text-muted">Enter the email you registered with</small>
                        </div>
                        <div class="form-group">
                        <label for="product">Product</label>
                        <input type="select" class="form-control" name="productName" placeholder="Select product" required>
                        <small class="form-text text-muted">Enter today's date</small>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>