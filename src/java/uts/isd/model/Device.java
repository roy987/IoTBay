/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author caitlinbaker
 */

public class Device {
    private int deviceId;
    private String deviceName;
    private String deviceCategory;
    private String deviceBrand;
    private int deviceQuantity;
    private float devicePrice;

    public Device(int deviceId, String deviceName, String deviceCategory, String deviceBrand, int deviceQuantity, float devicePrice) {
        this.deviceId = deviceId;
        this.deviceName = deviceName;
        this.deviceCategory = deviceCategory;
        this.deviceBrand = deviceBrand;
        this.deviceQuantity = deviceQuantity;
        this.devicePrice = devicePrice;
    }

    public Device(int deviceID, String name, String category, String brand, float price, int quantity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    // Getter methods
    public int getDeviceId() {
        return deviceId;
    }
    
    public void setDeviceID(int deviceID) {
        this.deviceId = deviceID;
    }

    public String getDeviceName() {
        return deviceName;
    }
    
    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getDeviceCategory() {
        return deviceCategory;
    }
    
    public void setDeviceCategegory(String deviceCategory) {
        this.deviceCategory = deviceCategory;
    }

    public String getDeviceBrand() {
        return deviceBrand;
    }
    
    public void setDeviceBrand(String deviceBrand) {
        this.deviceBrand = deviceBrand;
    }

    public int getDeviceQuantity() {
        return deviceQuantity;
    }
    
    public void setDeviceQuantity(int deviceQuantity) {
        this.deviceQuantity = deviceQuantity;
    }

    public float getDevicePrice() {
        return devicePrice;
    }
    
    public void setDevicePrice(float devicePrice) {
        this.devicePrice = devicePrice;
    }
}