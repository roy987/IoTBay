<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="uts.isd.model.dao.DBManager"%>
<%@ page import="uts.isd.model.User"%>
<%@ page import="uts.isd.model.PaymentDetails"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Payment Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
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
    <div class="container">
        <h1>Create Payment</h1>
        <%
            try {
                DBManager manager = (DBManager) session.getAttribute("manager");
                User user = (User) session.getAttribute("user");

                if (manager != null && user != null) {
                    String email = user.getEmail();

                    // Handle form submission
                    if (request.getMethod().equalsIgnoreCase("POST")) {
                        String cardNumber = request.getParameter("cardNumber");
                        String cardName = request.getParameter("cardName");
                        String expiryDate = request.getParameter("expiryDate");
                        String cvv = request.getParameter("cvv");

                        // Create payment details in the database
                        manager.createPayment(cardNumber, cardName, expiryDate, cvv, email);
                        out.println("<p class='alert alert-success'>Payment created successfully!</p>");
                    }
        %>
                    <form method="post">
                        <div class="form-group">
                            <label for="cardNumber">Card Number:</label>
                            <input type="text" class="form-control" id="cardNumber" name="cardNumber">
                        </div>
                        <div class="form-group">
                            <label for="cardName">Card Name:</label>
                            <input type="text" class="form-control" id="cardName" name="cardName">
                        </div>
                        <div class="form-group">
                            <label for="expiryDate">Expiry Date:</label>
                            <input type="text" class="form-control" id="expiryDate" name="expiryDate">
                        </div>
                        <div class="form-group">
                            <label for="cvv">CVV:</label>
                            <input type="text" class="form-control" id="cvv" name="cvv">
                        </div>
                        <button type="submit" class="btn btn-primary">Create</button>
                    </form>
        <%
                } else {
                    out.println("<p>Error: DBManager or User not found in session.</p>");
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
                out.println("<p class='alert alert-danger'>Error creating payment: " + ex.getMessage() + "</p>");
            }
        %>
    </div>
</body>
</html>
