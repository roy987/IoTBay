<%@page import="java.util.List"%>
<%@page import="uts.isd.model.Order"%>
<%@page import="uts.isd.model.Product"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar {
            padding: 20px;
        }

        .navbar-brand {
            font-size: 30px;
        }

        .button-section {
            padding: 10px;
            padding-bottom: 10px;
        }

        .order-page {
            padding: 20px;
        }


    </style>

</head>
<body>
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
    <div class="order-page">
    <div class="d-flex justify-content-end w-100 button-section">
        <a href="ViewProductsController" class="btn btn-primary">
            Create New +
        </a>
    </div>
    <div>
        <h1>My Orders</h1>
        <div>
            <table class="table table-striped table-bg  table-bordered table-hover table-rounded">
                <thead className="">
                <tr>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Product</th>
                    <th>Order Status</th>
                    <th>Edit</th>
                    <th>Cancel</th>
                </tr>
                </thead>
                <tbody>
                <%
                    // Retrieve products from request attribute
                    List<Order> orders = (List<Order>) request.getAttribute("orders");
                    if (orders != null) {
                        for (Order order : orders) {
                            Product product = order.getProduct();
                            
                %>
                <tr>
                    <td><%= order.getOrderID() %></td>
                    <td><%= order.getDate() %></td>
                    <%
                        if (product != null) {
                    %>
                    <td><%= product.getProductName() %></td>
                    <%
                        } else {
                    %>
                    <td>Product Not Available</td>
                    <%
                        }
                    %>
                    <td><%= order.getOrderStatus() %></td>
                    <% if (order.getOrderStatus().equalsIgnoreCase("Pending")) { %>
                    <td>
                        <form action="LoadUpdateController" method="post">
                            <input type="hidden" name="orderID" value="<%= order.getOrderID() %>">
                            <button type="submit" class="btn btn-link">Edit</button>
                        </form>
                    </td>
                    <td>
                        <form action="CancelOrderController" method="post">
                            <input type="hidden" name="orderID" value="<%= order.getOrderID() %>">
                            <button type="submit" class="btn btn-link">Cancel</button>
                        </form>
                    </td>
                    <% } else { %>
                    <td></td>
                    <td></td>
                    <% } %>
                </tr>

                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="4">No orders found</td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
