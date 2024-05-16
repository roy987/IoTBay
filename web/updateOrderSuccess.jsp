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
            .content{
                padding: 15px;
            }
            .order-page {
                padding: 20px;
                justify-content: center;
                width: 100%;
                text-align: center;
                
            }
        </style>

    </head>
    <body>
        <div class="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <a class="navbar-brand" href="./main.jsp">IoTBay</a>
                <div class="d-flex justify-content-between w-100">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="ViewProductsController">Products</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="ViewOrdersController">Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Payment</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">Shipment</a>
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
                    </ul>
                </div>
            </nav>
        </div>
        <div class="order-page">
            <h1>Order Success!</h1>
            <p>Head over to the Orders page to view and track your order</p>
        </div>

    </body>
</html>