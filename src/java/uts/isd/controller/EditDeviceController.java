/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.isd.model.dao.DBDevice;
import uts.isd.model.Device;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author caitlinbaker
 */
@WebServlet("/editDevice") // This annotation makes this servlet available at the URL /editDevice
public class EditDeviceController extends HttpServlet {
 
    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // get session
        HttpSession session = request.getSession();

        DBDevice deviceManager = (DBDevice) session.getAttribute("deviceManager");
        if (deviceManager == null) {
            // Initialize the database connection and DAO
            try {
                String driverName = "org.apache.derby.jdbc.ClientDriver";
                String connectionUrl = "jdbc:derby://localhost:1527/devicedb";
                String userId = "APP";
                
                Class.forName(driverName);
                Connection connection = DriverManager.getConnection(connectionUrl, userId, "");
                deviceManager = new DBDevice(connection);
                session.setAttribute("deviceManager", deviceManager);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(EditDeviceController.class.getName()).log(Level.SEVERE, null, ex);
                throw new ServletException("Database connection problem", ex);
            }
        }
        
        int deviceID = Integer.parseInt(request.getParameter("deviceID"));
        
        try {
            Device device = deviceManager.findDevice(deviceID);
            if (device != null) {
                session.setAttribute("device", device);
                request.getRequestDispatcher("devices.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Device not found");
                request.getRequestDispatcher("FindDevice.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EditDeviceController.class.getName()).log(Level.SEVERE, null, ex);
            throw new ServletException("Error retrieving device", ex);
        }
    }
}