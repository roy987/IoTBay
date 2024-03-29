<%-- 
    Document   : register
    Created on : 15 Mar 2024, 4:45:02 pm
    Author     : Roy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="./welcome.jsp" method="POST">
            <label>Email: </label>
            <input name="email"></input><br>
            <br>
             <label>Name: </label>
            <input name="name"></input><br>
             <br>
             <label>Password: </label>
            <input name="password" type="password"></input><br>
             <br>
                <label>Gender: </label>
            <input name="gender" ></input><br>
             <br>
                <label>Favorite Color: </label>
            <input name="favcol"></input><br>
             <br>
                <label>Terms And Conditions </label>
            <input  type="checkbox" name="tos"></input><br>
             <br>
            <input type="submit" value="Register">
             
             
        </form>
    </body>
</html>
