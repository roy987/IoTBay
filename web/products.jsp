<%@page import="java.util.List"%>
<%@page import="uts.isd.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Products</title>
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
                        <a class="nav-link" href="ViewProductsController">Products</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="ViewOrdersController">Orders</a>
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

<div class="content">
    <div class="container">
        <h1>All Products</h1>
        <table class="table">
            <thead>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Stock</th>
                <th>Price</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <% 
                // Retrieve products from request attribute
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null) {
                    for (Product product : products) {
            %>
                        <tr>
                            <td><%= product.getProductID() %></td>
                            <td><%= product.getProductName() %></td>
                            <td><%= product.getStock() %></td>
                            <td>$<%= product.getPrice() %></td>
                            <td>                        
                                <form action="StartOrderController" method="post">
                                <input type="hidden" name="productID" value="<%= product.getProductID() %>">
                                <button type="submit" <% if (product.getStock() <= 0) out.print("disabled"); %> class="btn btn-primary">Purchase</button>
                                <% if (product.getStock() <= 0) { %>
                                <p class="out-of-stock">Out of Stock</p>
                                <% } %>                                
                                </form>
                            </td>
                        </tr>
            <% 
                    }
                } else {
            %>
                    <tr>
                        <td colspan="4">No products found</td>
                    </tr>
            <% 
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
