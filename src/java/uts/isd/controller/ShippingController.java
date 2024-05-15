/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uts.isd.model.Shipping.ShippingDetails;

/**
 *
 * @author jyapr
 */
public class ShippingController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ShippingDetails shippingDetails = (ShippingDetails) session.getAttribute("shippingDetails");

        if (shippingDetails != null) {
            request.setAttribute("shippingDetails", shippingDetails);
        } else {
            request.setAttribute("shippingDetails", null);
        }

        request.getRequestDispatcher("shippingView.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String address = request.getParameter("address");
        String method = request.getParameter("method");
        String date = request.getParameter("date");

        ShippingDetails shippingDetails = new ShippingDetails(address, method, date);
        session.setAttribute("shippingDetails", shippingDetails);

        response.sendRedirect("shipping");
    }
}