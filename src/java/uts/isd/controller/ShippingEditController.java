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
import uts.isd.model.ShippingModel;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

/**
 * ShippingController class to handle shipping related requests.
 * 
 * Author: jyapr
 */
public class ShippingEditController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ShippingModel shippingModel = (ShippingModel) session.getAttribute("shippingModel");

        if (shippingModel != null) {
            request.setAttribute("shippingModel", shippingModel);
        } else {
            request.setAttribute("shippingModel", null);
        }

        request.getRequestDispatcher("order.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            HttpSession session = request.getSession();

            session.removeAttribute("shippingModel");

            response.sendRedirect("order.jsp");
            
        } else {
            // Retrieve the manager instance from session     
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            
            DBManager manager = (DBManager) session.getAttribute("manager");
            String email = user.getEmail();

            String address = request.getParameter("address");
            String methodType = request.getParameter("methodType");
            String date = request.getParameter("date");

            try {
               
                manager.createShipping(address, methodType, date);
                
                response.sendRedirect("shippingMain.jsp");


            } catch (SQLException ex) {
                Logger.getLogger(CreateOrderController.class.getName()).log(Level.SEVERE, null, ex);
                // Handle exception
            }
            
        }
    }
}
