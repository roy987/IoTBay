
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uts.isd.model.dao.DBDevice;
import java.sql.DriverManager;

/**
 *
 * @author caitlinbaker
 */
public class DeleteDeviceController extends HttpServlet {

    private DBDevice getDeviceManager(HttpSession session) throws ServletException {
        DBDevice deviceManager = (DBDevice) session.getAttribute("deviceManager");
        if (deviceManager == null) {
            try {
                String driverName = "org.apache.derby.jdbc.ClientDriver";
                String connectionUrl = "jdbc:derby://localhost:1527/devicedb";
                String userId = "APP";

                Class.forName(driverName);
                Connection connection = DriverManager.getConnection(connectionUrl, userId, ""); // No password required
                deviceManager = new DBDevice(connection);
                session.setAttribute("deviceManager", deviceManager);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DeleteDeviceController.class.getName()).log(Level.SEVERE, null, ex);
                throw new ServletException("Database connection problem", ex);
            }
        }
        return deviceManager;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBDevice deviceManager = getDeviceManager(session);

        // Retrieve the deviceId parameter and convert it to an int
        int deviceId = Integer.parseInt(request.getParameter("deviceId"));

        try {
            deviceManager.deleteDevice(deviceId); // Pass the deviceId as an int
            response.sendRedirect("EditDeviceController");
        } catch (SQLException ex) {
            Logger.getLogger(DeleteDeviceController.class.getName()).log(Level.SEVERE, null, ex);
            throw new ServletException("Error deleting device", ex);
        }
    }
}
