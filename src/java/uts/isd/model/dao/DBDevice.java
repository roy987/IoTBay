/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model.dao;

import java.sql.Statement;
import uts.isd.model.Device;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;



/**
 *
 * @author caitlinbaker
 */
public class DBDevice {
    
    private final Statement st;

    public DBDevice(Connection conn) throws SQLException {
        st =conn.createStatement();
        
    }
    
    public Device findDevice(int id) throws SQLException {
        String query = "SELECT * FROM APP.DEVICES WHERE DEVICEID= " + id;
        ResultSet rs;
        rs = st.executeQuery(query);
       
        while(rs.next()) {
            int deviceID = rs.getInt("DEVICEID");
            int quantity = rs.getInt("DEVICEQUANTITY");
            float price = rs.getFloat("DEVICEPRICE");
            String name = rs.getString("DEVICENAME");
            String category = rs.getString("DEVICECATEGORY");
            String brand = rs.getString("DEVICEBRAND");
            
            Device device = new Device(deviceID, name, category, brand, price, quantity);
            return device;
        }
        return null;
    } 
    
    
    // Create - add a new device
    public void addDevice(int deviceID, int quantity, float price, String name, String category, String brand ) throws SQLException{
        String query = 
                "INSERT INTO APP.DEVICES(DEVICEID, DEVICEQUANTITY, DEVICEPRICE, DEVICENAME, DEVICECATEGORY, DEVICEBRAND) " +
                "VALUES('" + deviceID + "', '" + quantity + "', " + price + ", " + name + ", " + category + ", " + brand + ")";
        st.executeUpdate(query);
    
    }
        
        
    public ArrayList<Device> getAllDevices() throws SQLException {
        String query = "SELECT * FROM APP.DEVICES";
        ResultSet rs = st.executeQuery(query);
        ArrayList<Device> devices = new ArrayList<>();
        
        while (rs.next()) {
            int deviceId = rs.getInt("DEVICEID");
            String deviceName = rs.getString("DEVICENAME");
            String deviceCategory = rs.getString("DEVICECATEGORY");
            String deviceBrand = rs.getString("DEVICEBRAND");
            int deviceQuantity = rs.getInt("DEVICEQUANTITY");
            float devicePrice = rs.getFloat("DEVICEPRICE");
            
            Device device = new Device(deviceId, deviceName, deviceCategory, deviceBrand, deviceQuantity, devicePrice);
            devices.add(device);
        }
        return devices;
    }
    
    // Read - Search & List Device by NAME
    public ArrayList<Device> searchDevicesbyName(String search) throws SQLException {
        String query = "SELECT * FROM APP.DEVICES WHERE DEVICENAME LIKE " + "%" + search + "%";
        ResultSet rs = st.executeQuery(query);
        ArrayList<Device> device = new ArrayList<>();
        
        while(rs.next()) {
            int deviceID = rs.getInt("DEVICEID");
            int quantity = rs.getInt("DEVICEQUANTITY");
            float price = rs.getFloat("DEVICEPRICE");
            String name = rs.getString("DEVICENAME");
            String category = rs.getString("DEVICECATEGORY");
            String brand = rs.getString("DEVICEBRAND");
            
            device.add(new Device (deviceID, name, category, brand, price, quantity));
        }
        return device;
    }
        
    // Read - Search & List Device by Category
    public ArrayList<Device> searchDevicesbyType(String search) throws SQLException {
        String query = "SELECT * FROM APP.DEVICES WHERE DEVICECATEGORY LIKE " + "%" + search + "%";
        ResultSet rs = st.executeQuery(query);
        ArrayList<Device> device = new ArrayList<>();
        
        while(rs.next()) {
            int deviceID = rs.getInt("DEVICEID");
            int quantity = rs.getInt("DEVICEQUANTITY");
            float price = rs.getFloat("DEVICEPRICE");
            String name = rs.getString("DEVICENAME");
            String category = rs.getString("DEVICECATEGORY");
            String brand = rs.getString("DEVICEBRAND");
            
            device.add(new Device (deviceID, name, category, brand, price, quantity));
        }
        return device;
    }
        
    // Read - Search & List Device by NAME and Category
    public ArrayList<Device> searchDevices(String searchName, String searchcategory) throws SQLException {
        
        // Set defaults if search name and/or type is empty
        if (searchName == null) {
            searchName = "";
        }
        if (searchcategory == null) {
            searchcategory = "";
        }
         
        String query = 
                "SELECT * FROM APP.DEVICES " +
                "WHERE LOWER(DEVICENAME) LIKE " + "'%" + searchName + "%'" +
                "AND LOWER(DEVICECATEGORY) LIKE " + "'%" + searchcategory + "%'";
        ResultSet rs = st.executeQuery(query);
        ArrayList<Device> device = new ArrayList<>();
        
        while(rs.next()) {
            int deviceID = rs.getInt("DEVICEID");
            int quantity = rs.getInt("DEVICEQUANTITY");
            float price = rs.getFloat("DEVICEPRICE");
            String name = rs.getString("DEVICENAME");
            String category = rs.getString("DEVICECATEGORY");
            String brand = rs.getString("DEVICEBRAND");
            
            device.add(new Device (deviceID, name, category, brand, price, quantity));
        }
        return device;
    }

    // Update - Update a single device
    public void updateProduct(int deviceID, String name, String category, String brand, float price, int quantity) throws SQLException {
        String query = 
                "UPDATE APP.DEVICES SET" +
                " DEVICENAME= " + "'" + name + "'" + ", " +
                " DEVICECATEGORY= " + "'" + category + "'" + ", " +
                " DEVICEBRAND= " + "'" + brand + "'" + ", " +
                " DEVICEPRICE= " + price + ", " +
                " DEVICEQUANTITY= " + quantity + ", " +
                "WHERE DEVICEID = " + deviceID;
        
        st.executeUpdate(query);
    }
    
    // Delete - Delete a single product
    public void deleteDevice(String id) throws SQLException {
        String query = "DELETE FROM APP.DEVICES WHERE DEVICEID =" + id;
        st.executeUpdate(query);
    }

    public void updatedevice(int deviceID, String deviceName, String deviceCategory, String deviceBrand, float devicePrice, int deviceQuantity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }


    

}




    

