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

 <%
    User user = (User) session.getAttribute("user");
    String backgroundColour = "";
    if (user != null) {
        backgroundColour = user.getFavouriteColour();
    }
    
    List<User> userList = (List<User>) session.getAttribute("userList");
            
    if (userList == null) {
        userList = new ArrayList<>();
        userList.add(new User("Iot1@mail.com", "Iot1", "12345", "M", "red"));
        userList.add(new User("Iot2@mail.com", "Iot1", "qwerty", "F", "yellow"));
        session.setAttribute("userList", userList);
     }
%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
        <style>
            .container {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            background-color: <%= backgroundColour %>;
            }
            .logout {
            text-align: right;
            }
            .title {
                font-weight: bold;
            }
            .details {
                margin-top: 50px;
            }
            .pageList {
                margin-left: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="title">IoTBay</div>
            <div class="details">
                <%
                    if(user!=null){
                %>
                    <p>You are logged in as <%= user.getName() %> &lt;<%= user.getEmail() %>&gt;</p>
                
               
                    <div class="logout">
                    <a href="logout.jsp">Logout</a>
                    </div>
            
                <% } else { %>
                    <p>You are not logged in</p>
                    <div class="logout">
                        <a href="login.jsp">Login</a> <br>
                        <a href="register.jsp">Register</a>
                    </div>
                <% } %>
            </div>
            
        </div>
        <%
                    
            if(user!=null){
        %>
            <div>
                <li class="pageList">
                    <a href="edit_user.jsp">My Account</a>
                </li>
            </div>
        <% } %>
    </body>
</html>
