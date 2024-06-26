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
import uts.isd.model.Order;
import uts.isd.model.Product;
import uts.isd.model.ShippingModel;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

public class ViewOrdersController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Redirect to login page if user is not logged in
            response.sendRedirect("login.jsp");
            return;
        }


        // Retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        String email = user.getEmail();

        try {
            // Fetch orders from the database
            List<Order> orders = manager.getAllOrders(email);
            System.out.println("orders: " + orders.size());
            
            for (Order order : orders) {
                // Retrieve product details using product ID
                Product product = manager.getProductDetails(order.getProductID());
                // Set product details in the order object
                order.setProduct(product);
            }
            // Store orders in request attribute
            request.setAttribute("orders", orders);
            // Forward to orders.jsp for rendering
            request.getRequestDispatcher("orders.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(ViewOrdersController.class.getName()).log(Level.SEVERE, null, ex);
            // Handle exception
        }
        
        //shipment logic to display details
            ShippingModel shippingModel = (ShippingModel) session.getAttribute("shippingModel");

            if (shippingModel != null) {
                request.setAttribute("shippingModel", shippingModel);
            } else {
                request.setAttribute("shippingModel", null);
            }

            if (user == null) {
                // Redirect to login page if user is not logged in
                response.sendRedirect("login.jsp");
                return;
            }
        
    }
}
