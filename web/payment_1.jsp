<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="uts.isd.model.Payment"%>
<%@page import="uts.isd.model.PaymentDetails"%>
<%@page import="uts.isd.model.dao.DBManager"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar {
            padding: 20px;
        }
        .navbar-brand {
            font-size: 30px;
        }
        .content {
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
    
    <div class="payment-page">
        <div class="button-section d-flex justify-content-end w-100">
            <% 
            List<Payment> payments = null; // Declare payments list
            List<PaymentDetails> paydetails = null; 
            
            try {
                // Retrieve the manager instance from session
                DBManager manager = (DBManager) session.getAttribute("manager");
                String email = user.getEmail();

                // Fetch payments from the database
                if (manager != null) {
                    payments = manager.getAllPayments(email); // Assign payments
                    paydetails = manager.getPayDetails(email);
                    
                }

                if (paydetails != null && !paydetails.isEmpty()) { %>
                    <a href="paymentupdatedelete.jsp" class="btn btn-danger">Update/Delete</a>
                <% } else { %>
                    <a href="paymentcreate.jsp" class="btn btn-primary">Create</a>
                <% } 
            } catch (Exception ex) {
                ex.printStackTrace();
            } %>
        </div>
        <div>
            <h1>Payment Details</h1>
            <div>
                <table class="table table-striped table-bg  table-bordered table-hover table-rounded"> 
                    <thead>
                        <tr>
                            <th>Payment ID</th>
                            <th>Card Number</th>
                            <th>Card Name</th>
                            <th>Expiry Date</th>
                            <th>CVV</th>
                            <th>Order ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        try {
                            if (payments != null) {
                                for (Payment payment : payments) {
                        %>
                        <tr>
                            <td><%= payment.getPaymentID() %></td>
                            <td><%= payment.getPaymentDetails().getCardNumber() %></td>
                            <td><%= payment.getPaymentDetails().getCardName() %></td>
                            <td><%= payment.getPaymentDetails().getExpiryDate() %></td>
                            <td><%= payment.getPaymentDetails().getCvv() %></td>
                            <td><%= payment.getOrderID() %></td>
                        </tr>
                        <% 
                                }
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>
