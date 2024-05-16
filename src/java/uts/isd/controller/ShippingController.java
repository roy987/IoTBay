package uts.isd.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uts.isd.model.shippingModel;  // Corrected import statement

/**
 * ShippingController class to handle shipping related requests.
 * 
 * Author: jyapr
 */
public class ShippingController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        shippingModel shippingModel = (shippingModel) session.getAttribute("shippingModel");

        if (shippingModel != null) {
            request.setAttribute("shippingModel", shippingModel);
        } else {
            request.setAttribute("shippingModel", null);
        }

        request.getRequestDispatcher("shippingMain.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String address = request.getParameter("address");
        String method = request.getParameter("method");
        String date = request.getParameter("date");

        session.setAttribute("shippingModel", new shippingModel(address, method, date));

        response.sendRedirect("shippingMain.jsp"); 
    }
    
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Remove the shippingDetails attribute from the session
        session.removeAttribute("shippingModel");

        // Redirect to the shippingMain.jsp to display the updated state
        response.sendRedirect("shippingMain.jsp");
    }
}
