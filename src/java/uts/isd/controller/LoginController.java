package uts.isd.controller;

 

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

public class LoginController extends HttpServlet {
    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //2- create an instance of the Validator class    
        Validator validator = new Validator();
        //3- capture the posted email      
        String email = request.getParameter("email");
        //4- capture the posted password    
        String password = request.getParameter("password");
        //5- retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        System.out.println("manager :" + manager);
        User user = null;     
        try {
            //6- find user by email and password
            user = manager.findUser(email, password);
            manager.addLogLogin(email);
        } catch (SQLException ex) {           
              Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);       
        }

        
        System.out.println("VALIDATE");
        System.out.println(email);
        System.out.println(validator.validateEmail(email));
        if (validator.validateEmail(email) == false) {           
            //8-set incorrect email error to the session           
            session.setAttribute("loginErr", "Invalid email");
            //9- redirect user back to the login.jsp  
            response.sendRedirect("login.jsp");
        } else if (validator.validatePassword(password) == false) {                  
            //11-set incorrect password error to the session           
            session.setAttribute("loginErr", "Invalid password");
            //12- redirect user back to the login.jsp
            response.sendRedirect("login.jsp");
        } else if (user != null) {                     
            //13-save the logged in user object to the session 
            System.out.println("LOGIN SUCCESS");
            session.setAttribute("user", user);
            //14- redirect user to the main.jsp 
            session.setAttribute("loginErr", "");
            response.sendRedirect("main.jsp");
        } else {                       
            //15-set user does not exist error to the session  
            System.out.println("LOGIN FAIL");
            System.out.println(user);
            session.setAttribute("loginErr", "User does not exist, incorrect username or password");
            //16- redirect user back to the login.jsp   
            response.sendRedirect("login.jsp");
        }
    }
}