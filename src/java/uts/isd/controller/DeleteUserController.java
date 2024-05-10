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
public class DeleteUserController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       

        HttpSession session = request.getSession();
 
        String email = request.getParameter("email");
        
        //5- retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        System.out.println("manager :" + manager);     
        
        try {
            manager.deleteUser(email);
            System.out.println("USER DELETED");
        } catch (SQLException ex) {
            Logger.getLogger(ManageUserController.class.getName()).log(Level.SEVERE, null, ex);
        }
        session.setAttribute("user", null);
        response.sendRedirect("index.jsp");
    }
}
