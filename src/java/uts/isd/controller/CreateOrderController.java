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

public class CreateOrderController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
//        if (user == null) {
//            // Redirect to login page if user is not logged in
//            response.sendRedirect("login.jsp");
//            return;
//        }
        String productID = request.getParameter("productID");


        // Retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        String email = user.getEmail();

        try {
            // Fetch orders from the database
            Product product = manager.getProductDetails(productID);
            System.out.println("product: " + product);
            // Store orders in request attribute
            request.setAttribute("product", product);
            // Forward to orders.jsp for rendering
            request.getRequestDispatcher("order.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(ViewOrdersController.class.getName()).log(Level.SEVERE, null, ex);
            // Handle exception
        }
    }
}
