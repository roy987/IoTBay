/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import uts.isd.model.dao.DBDevice;

/**
 *
 * @author caitlinbaker
 */

public class UpdateDeviceController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int deviceId = Integer.parseInt(request.getParameter("deviceId"));
        String deviceName = request.getParameter("deviceName");
        String deviceCategory = request.getParameter("deviceCategory");
        String deviceBrand = request.getParameter("deviceBrand");
        int deviceQuantity = Integer.parseInt(request.getParameter("deviceQuantity"));
        float devicePrice = Float.parseFloat(request.getParameter("devicePrice"));

        try {
            String driverName = "org.apache.derby.jdbc.ClientDriver";
            String connectionUrl = "jdbc:derby://localhost:1527/devicedb";
            String userId = "APP";


            Class.forName(driverName);
            Connection connection = DriverManager.getConnection(connectionUrl, userId, "");
            DBDevice dbManager = new DBDevice(connection);
            dbManager.updateDevice(deviceId, deviceName, deviceCategory, deviceBrand, devicePrice, deviceQuantity);
            response.sendRedirect("EditDevice.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }
}

