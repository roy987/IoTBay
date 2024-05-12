<%-- 
    Document   : index
    Created on : 29 Mar 2024, 3:58:04 pm
    Author     : Roy
--%>

<%@ page import="uts.isd.model.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.Serializable" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Index</title>
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
    <body class="page">
       <div class="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <a class="navbar-brand" href="./main.jsp">IoTBay</a>
                <div class="d-flex justify-content-between w-100">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item ">
                                <a class="nav-link" href="login.jsp">Login </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="registerStaff.jsp">Register (Staff)</a>
                        </li>

                        <li class="nav-item dropdown">
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="registerCustomer.jsp">Resister (Customer)</a>
                        </li>
                    </ul>
                </div>
            </nav>
           <div class="content">
                <h1 >Welcome!</h1>
                <p>You are not currently logged in</p> 
           </div>
       </div>
    
    <jsp:include page="/ConnServlet" flush="true" />
</body>
</html>
