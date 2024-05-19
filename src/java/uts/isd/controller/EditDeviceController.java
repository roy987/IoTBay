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
import uts.isd.model.Device;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;


/**
 *
 * @author caitlinbaker
 */
public class EditDeviceController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null || !((User) session.getAttribute("user")).isStaff()) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        DBManager dbManager = new DBManager();

        if (null != action) switch (action) {
            case "delete":{
                int deviceId = Integer.parseInt(request.getParameter("deviceId"));
            try {
                dbManager.deleteDevice(deviceId);
            } catch (SQLException ex) {
                Logger.getLogger(EditDeviceController.class.getName()).log(Level.SEVERE, null, ex);
            }
                    break;
                }
            case "edit":{
                int deviceId = Integer.parseInt(request.getParameter("deviceId"));
                Device device = dbManager.getDeviceById(deviceId);
                request.setAttribute("editDevice", device);
                    break;
                }
            case "save":{
                int deviceId = Integer.parseInt(request.getParameter("deviceId"));
                int deviceName = Integer.parseInt(request.getParameter("deviceName"));
                String deviceCategory = request.getParameter("deviceCategory");
                String deviceBrand = request.getParameter("deviceBrand");
                int deviceQuantity = Integer.parseInt(request.getParameter("deviceQuantity"));
                float devicePrice = Float.parseFloat(request.getParameter("devicePrice"));
                Device device = new Device();
                device.setDeviceId(deviceId);
                device.setDeviceName(deviceName);
                device.setDeviceCategory(deviceCategory);
                device.setDeviceBrand(deviceBrand);
                device.setDeviceQuantity(deviceQuantity);
                device.setDevicePrice(devicePrice);
                dbManager.updateDevice(device);
                    break;
                }
            case "add":{
                int deviceName = Integer.parseInt(request.getParameter("deviceName"));
                String deviceCategory = request.getParameter("deviceCategory");
                String deviceBrand = request.getParameter("deviceBrand");
                int deviceQuantity = Integer.parseInt(request.getParameter("deviceQuantity"));
                float devicePrice = Float.parseFloat(request.getParameter("devicePrice"));
                Device newDevice = new Device();
                newDevice.setDeviceName(deviceName);
                newDevice.setDeviceCategory(deviceCategory);
                newDevice.setDeviceBrand(deviceBrand);
                newDevice.setDeviceQuantity(deviceQuantity);
                newDevice.setDevicePrice(devicePrice);
                dbManager.addDevice(newDevice);
                    break;
                }
            default:
                break;
        }

        List<Device> devices = null;
        try {
            devices = dbManager.getAllDevices();
        } catch (SQLException ex) {
            Logger.getLogger(EditDeviceController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("devices", devices);
        request.getRequestDispatcher("EditDevice.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}