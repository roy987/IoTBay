package uts.isd.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.isd.model.Product;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

public class UpdateOrderController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        


        // Retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        String email = user.getEmail();
        String action = request.getParameter("action");
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        int productID = Integer.parseInt(request.getParameter("productID"));
        int shipmentID = Integer.parseInt(request.getParameter("shipmentMethod"));
        int paymentID = Integer.parseInt(request.getParameter("paymentMethod"));

        try {
            if ("save".equals(action)) {
                // Code to save the order with status "pending"
                manager.updateOrder(orderID, email, "Pending", productID, shipmentID, paymentID);
            } else if ("submit".equals(action)) {
                // Code to submit the order with status "shipping"
                manager.decrementProductStock(productID);

                manager.updateOrder(orderID, email, "Shipping", productID, shipmentID, paymentID);
                
            }
            response.sendRedirect("updateOrderSuccess.jsp");
            // Forward to orders.jsp for rendering

        } catch (SQLException ex) {
            Logger.getLogger(CreateOrderController.class.getName()).log(Level.SEVERE, null, ex);
            // Handle exception
        }
    }
}
