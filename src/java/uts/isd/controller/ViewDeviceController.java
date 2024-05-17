/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uts.isd.model.Device;
import uts.isd.model.dao.DBDevice;

/**
 *
 * @author caitlinbaker
 */
@WebServlet("/viewDevices") // Add this annotation to map the servlet to a URL
public class ViewDeviceController extends HttpServlet {
    @Override   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create product array
        ArrayList<Device> deviceList = new ArrayList<>();

        // Get session
        HttpSession session = request.getSession();

        DBDevice deviceManager = (DBDevice) session.getAttribute("deviceManager");

        try {
            deviceList = deviceManager.getAllDevices();
            if (!deviceList.isEmpty()) {
                session.setAttribute("Devices", deviceList);
                System.out.println("Devices Found");
            } else {
                System.out.println("Devices Not Found");
            }
        } catch (SQLException | NullPointerException ex) {
            System.out.println(ex.getMessage());
        }

        request.getRequestDispatcher("Devices.jsp").include(request, response);
    }
}
