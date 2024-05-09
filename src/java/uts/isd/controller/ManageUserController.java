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
public class ManageUserController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       

        HttpSession session = request.getSession();
 
        Validator validator = new Validator();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String fav_col = request.getParameter("fav_col");
        String gender = request.getParameter("gender");
        
        //5- retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        System.out.println("manager :" + manager);
        User user = (User) session.getAttribute("user");     
        
        boolean password_val = validator.validatePassword(password);
        System.out.print("User update attempt!");
        if (password_val == false) {
            
            System.out.print("Invalid");
            response.sendRedirect("manageUser.jsp");
        } 
        else {
            try {
                manager.updateUser(email, name, password, gender, fav_col);
                System.out.println("USER UPDATED");
            } catch (SQLException ex) {
                Logger.getLogger(ManageUserController.class.getName()).log(Level.SEVERE, null, ex);
            }
            session.setAttribute("user", new User(email, name, password, gender, fav_col));
            response.sendRedirect("main.jsp");
        }  
    }

}
