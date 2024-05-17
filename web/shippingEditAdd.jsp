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
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
<a class="navbar-brand" href="./main.jsp">IoTBay</a>
<div class="d-flex justify-content-between w-100">
<ul class="navbar-nav mr-auto">
<li class="nav-item">
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
<li class="nav-item">
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
        <form action="ShippingController" method="post">
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" placeholder="Enter address" required>
            </div>
            <div class="form-group">
                <label for="method">Method:</label>
                <select id="methodType" name="methodType" required>
                    <option value="Standard">Standard</option>
                    <option value="Express">Express</option>
                </select>
            </div>
            <div class="form-group">
                <label for="date">Preferred Delivery Date</label>
                <input type="text" id="date" name="date" placeholder="Enter date" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Save</button>
                
                <input type="hidden" id="action" name="action" value="save">
                <button type="button" id="deleteButton" class="btn btn-danger" onclick="deleteShippingDetails()">Delete</button>
                
                <a href="./order.jsp" class="btn btn-secondary">Back</a>
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
