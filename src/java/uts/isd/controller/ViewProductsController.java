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
import uts.isd.model.dao.DBManager;

public class ViewProductsController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");

        try {
            // Fetch products from the database
            List<Product> products = manager.getAllProducts();
            // Store products in request attribute
            request.setAttribute("products", products);
            // Forward to products.jsp for rendering
            request.getRequestDispatcher("products.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ViewProductsController.class.getName()).log(Level.SEVERE, null, ex);
            // Handle exception
            
        }
    }
}
