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
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            HttpSession session = request.getSession();

            session.removeAttribute("shippingModel");

            response.sendRedirect("shippingMain.jsp");
            
        } else {
            HttpSession session = request.getSession();

            String address = request.getParameter("address");
            String method = request.getParameter("method");
            String date = request.getParameter("date");

            ShippingModel shippingModel = new ShippingModel(address, method, date);
            session.setAttribute("shippingModel", shippingModel);
            response.sendRedirect("shippingMain.jsp"); 
        }
    }
}
