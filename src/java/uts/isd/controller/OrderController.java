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
import static java.lang.System.console;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.isd.model.Order;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author roy987
 */
public class OrderController extends HttpServlet {
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
 
//        Validator validator = new Validator();

    
        String email = ((User) session.getAttribute("user")).getEmail();
      
        
        //5- retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        try {
            // Fetch orders from the database
            List<Order> orders = manager.findOrders(email);
            // Store orders in request attribute
            request.setAttribute("orders", orders);
            // Forward to orders.jsp for rendering
            request.getRequestDispatcher("orders.jsp").forward(request, response);
            System.out.println(orders);
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            // Handle exception
            // You might want to redirect to an error page here
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       

        HttpSession session = request.getSession();
 
        Validator validator = new Validator();

        String orderID = request.getParameter("orderID");
        String date = request.getParameter("date");
        String email = request.getParameter("email");
        String orderStatus = request.getParameter("orderStatus");
        String productName = request.getParameter("productName");
        String orderTotal = request.getParameter("orderTotal");
        
        //5- retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        System.out.println("manager :" + manager);
        Order order = (Order) session.getAttribute("order");     
        
        // Check if orderID is provided to determine whether to update or create
        if (orderID != null && !orderID.isEmpty()) {
        // Update existing order
        try {
            // Perform update operation
            manager.updateOrder(orderID, date, email, orderStatus, productName, orderTotal);
            System.out.println("Order Updated");
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            // Handle exception
        }
        } else {
        // Create new order
        try {
            // Perform create operation
            manager.addOrder(date, email, orderStatus, productName, orderTotal);
            System.out.println("New Order Created");
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            // Handle exception
        }
    }
    // Redirect to appropriate page after operation
    response.sendRedirect("orders.jsp");
    }

}
