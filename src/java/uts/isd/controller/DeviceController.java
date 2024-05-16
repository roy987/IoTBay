/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import uts.isd.model.Device;
import uts.isd.model.dao.DBDevice;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/device")
public class DeviceController extends HttpServlet {
    private DBDevice dbDevice;

    @Override
    public void init() throws ServletException {
        try {
            // Initialize the database connection and DAO
            Connection conn = DriverManager.getConnection("jdbc:yourdatabaseurl", "username", "password");
            dbDevice = new DBDevice(conn);
        } catch (SQLException e) {
            throw new ServletException("Unable to initialize database connection", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int deviceID = Integer.parseInt(request.getParameter("id"));
        try {
            Device device = dbDevice.findDevice(deviceID);
            request.setAttribute("device", device);
            request.getRequestDispatcher("/device.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving device", e);
        }
    }
}  

