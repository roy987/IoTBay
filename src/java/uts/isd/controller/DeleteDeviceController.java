
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uts.isd.model.User;
import uts.isd.model.dao.DBDevice;

/**
 *
 * @author caitlinbaker
 */
public class DeleteDeviceController extends HttpServlet {
    HttpSession session;
    DBDevice DBDevice;
    User user;

@Override   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    session = request.getSession();
        

        user = (User)session.getAttribute("user");
        
        if (user != null && user.getClass().getSimpleName().equals("Staff")) {
            DBDevice = (DBDevice)session.getAttribute("DBDevice");
            String id = request.getParameter("id");

        try {    
            DBDevice.deleteDevice(id);
            session.setAttribute("deviceErr", "Device " + id + " deleted");
             } catch (SQLException ex) {           
                            Logger.getLogger(DeleteDeviceController.class.getName()).log(Level.SEVERE, null, ex);       
                           }
    }
        response.sendRedirect("DeviceListController");
     }
}
