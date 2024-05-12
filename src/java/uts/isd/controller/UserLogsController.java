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
import java.util.List;
import uts.isd.model.User;
import uts.isd.model.UserLog;
import uts.isd.model.dao.DBManager;

 

public class UserLogsController extends HttpServlet {
    
    @Override   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the user is logged in
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Redirect to login page if user is not logged in
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve user logs by email
        DBManager manager = (DBManager) session.getAttribute("manager");
        String email = user.getEmail();
        try {
            List<UserLog> userLogs = manager.getUserLogs(email);
            System.out.println("Userlogs: " + userLogs.size());
            session.setAttribute("userLogs", userLogs);
            response.sendRedirect("logs.jsp");
    
        } catch (SQLException ex) {
            Logger.getLogger(UserLogsController.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Set user logs attribute and forward to JSP
      
    }
}