/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Beans/Bean.java to edit this template
 */
package uts.isd.model;

import java.beans.*;
import java.io.Serializable;

/**
 *
 * @author Roy
 */
public class Order implements Serializable {
    
    private String orderID;
    private String date;
    private String email;
    private String orderStatus;
    private String productName;
    private String orderTotal;
    
    
    
    public Order() {
    }

    public Order(String orderID, String date, String email, String orderStatus, String productName, String orderTotal) {
        this.orderID = orderID;
        this.date = date;
        this.email = email;
        this.orderStatus = orderStatus;
        this.productName = productName;
        this.orderTotal = orderTotal;

    }
   // Getter and Setter methods for email
    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }
    
    // Getter and Setter methods for date
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    // Getter and Setter methods for date
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    // Getter and Setter methods for order status
    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    // Getter and Setter methods for product name
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
    // Getter and Setter methods for order total
    public String getOrderTotal() {
        return orderTotal;
    }
    public void setOrderTotal(String orderTotal) {
        this.orderTotal = orderTotal;
    }

    // toString method to display object's information
    @Override
    public String toString() {
        return "User{" +
                "orderID='" + orderID + '\'' +
                ", date='" + date + '\'' +
                ", orderStatus='" + orderStatus + '\'' +
                ", productName='" + productName + '\'' +           
                ", orderTotal='" + orderTotal + '\'' +            

                '}';
    }
    
}
