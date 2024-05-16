package uts.isd.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uts.isd.model.ShippingModel;

/**
 * ShippingController class to handle shipping related requests.
 * 
 * Author: jyapr
 */
public class ShippingController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("GET!");
        HttpSession session = request.getSession();
        ShippingModel shippingModel = (ShippingModel) session.getAttribute("shippingModel");

        if (shippingModel != null) {
            request.setAttribute("shippingModel", shippingModel);
        } else {
            request.setAttribute("shippingModel", null);
        }

        request.getRequestDispatcher("shippingMain.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("POST!");
        HttpSession session = request.getSession();

        String address = request.getParameter("address");
        String method = request.getParameter("method");
        String date = request.getParameter("date");

        ShippingModel shippingModel = new ShippingModel(address, method, date);
        session.setAttribute("shippingModel", shippingModel);
        response.sendRedirect("shippingMain.jsp"); 
    }
    
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("DELETE!");
        HttpSession session = request.getSession();

        // Remove the shippingDetails attribute from the session
        session.removeAttribute("shippingModel");

        // Redirect to the shippingMain.jsp to display the updated state
        response.sendRedirect("shippingMain.jsp");
    }
}
