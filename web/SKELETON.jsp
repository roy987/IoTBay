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
        <!--<h1 >Hello World!</h1>-->
    </body>
</html>