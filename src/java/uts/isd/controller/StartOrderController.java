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
import uts.isd.model.Product;
import uts.isd.model.dao.DBManager;

public class StartOrderController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
     
        int productID = Integer.parseInt(request.getParameter("productID"));
        
        // Retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");

        try {
            // Fetch product details from the database
            Product product = manager.getProductDetails(productID);
            
            // Store product in session attribute
            session.setAttribute("product", product);
            
            // Redirect to order.jsp
            response.sendRedirect("order.jsp");

        } catch (SQLException ex) {
            Logger.getLogger(StartOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
