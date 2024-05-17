/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author jakesolsky
 */
public class RegisterStaffController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       

        HttpSession session = request.getSession();
 
        Validator validator = new Validator();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String tos = request.getParameter("tos");
        
        //5- retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        System.out.println("manager :" + manager);
        System.out.println("tos :" + tos);
        User user = null;     
        
        boolean email_val = validator.validateEmail(email);
        boolean password_val = validator.validatePassword(password);
        boolean name_val = validator.validateName(name);
        boolean phone_val = validator.validatePhone(phone);
        
        if (email_val == false) {
            session.setAttribute("registerErr", "Invalid email");
            response.sendRedirect("registerStaff.jsp");
        } else if (name_val == false ) {
            session.setAttribute("registerErr", "Invalid name");
            response.sendRedirect("registerStaff.jsp");
        } else if (password_val == false ) {
            session.setAttribute("registerErr", "Invalid password");
            response.sendRedirect("registerStaff.jsp");
        } else if (phone_val == false ) {
            session.setAttribute("registerErr", "Invalid phone number");
            response.sendRedirect("registerStaff.jsp");
        } else if (tos == null) {
            session.setAttribute("registerErr", "please accept the terms of service");
            response.sendRedirect("registerStaff.jsp");
        }
        
        else {
            try {
            //6- find user by email and password
                user = manager.findUser(email, password);
            } catch (SQLException ex) {           
              Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);       
            }

            if (user == null) {
                try {
                    manager.addUser(email, name, password, phone, "0");
                    manager.addLogRegister(email);
                } catch (SQLException ex) {
                    Logger.getLogger(RegisterCustomerController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            session.setAttribute("user", new User(email, name, password, phone, "0"));
            response.sendRedirect("main.jsp");
        }  
    }

}
