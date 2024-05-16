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
import uts.isd.model.dao.DBManager;

public class CancelOrderController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();        


        // Retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        int orderID = Integer.parseInt(request.getParameter("orderID"));

        try {
            
            manager.updateOrderStatus(orderID, "Cancelled");
            response.sendRedirect("cancelOrderSuccess.jsp");
            // Forward to orders.jsp for rendering

        } catch (SQLException ex) {
            Logger.getLogger(CancelOrderController.class.getName()).log(Level.SEVERE, null, ex);
            // Handle exception
        }
    }
}
