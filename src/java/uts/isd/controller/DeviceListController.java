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
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.isd.model.Device;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author jakesolsky
 */
public class DeviceListController extends HttpServlet {

    @Override   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the user is logged in
        HttpSession session = request.getSession();

        // Retrieve user logs by email
        DBManager manager = (DBManager) session.getAttribute("manager");
        try {
            List<Device> deviceList = manager.getAllDevices();
           
            session.setAttribute("devices", deviceList);
            response.sendRedirect("DeviceList.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(UserLogsController.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Set user logs attribute and forward to JSP
    }

}
