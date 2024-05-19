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
import uts.isd.model.Order;
import uts.isd.model.Product;

import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

public class LoadUpdateController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        int orderID = Integer.parseInt(request.getParameter("orderID"));
        

        // Retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        String email = user.getEmail();

        try {
            // Fetch orders from the database
            Order order = manager.getOrderByID(orderID);
            Product product = manager.getProductDetails(order.getProductID());
            System.out.println("order: " + order);
            // Store orders in request attribute
            request.setAttribute("order", order);
            
            request.setAttribute("product", product);

            // Forward to orders.jsp for rendering
            request.getRequestDispatcher("updateOrder.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(StartOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
