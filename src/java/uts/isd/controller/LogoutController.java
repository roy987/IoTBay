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

 

public class LogoutController extends HttpServlet {
    @Override   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        User user = (User) session.getAttribute("user");
        String email = user.getEmail();
        
        try {
            manager.addLogLogout(email);
        } catch (SQLException ex) {
            Logger.getLogger(LogoutController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        session.setAttribute("user", null);
        session.setAttribute("userLogs", null);
        
        response.sendRedirect("index.jsp");
    }
    
}