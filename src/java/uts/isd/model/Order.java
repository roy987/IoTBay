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
    private String productID;
    private String paymentID;
    private String deliveryID;

    public Order() {
    }

    public Order(String orderID, String date, String email, String orderStatus, String productID, String paymentID, String deliveryID) {
        this.orderID = orderID;
        this.date = date;
        this.email = email;
        this.orderStatus = orderStatus;
        this.productID = productID;
        this.paymentID = paymentID;
        this.deliveryID = deliveryID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(String paymentID) {
        this.paymentID = paymentID;
    }

    public String getDeliveryID() {
        return deliveryID;
    }

    public void setDeliveryID(String deliveryID) {
        this.deliveryID = deliveryID;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderID='" + orderID + '\'' +
                ", date='" + date + '\'' +
                ", email='" + email + '\'' +
                ", orderStatus='" + orderStatus + '\'' +
                ", productID='" + productID + '\'' +
                ", paymentID='" + paymentID + '\'' +
                ", deliveryID='" + deliveryID + '\'' +
                '}';
    }
}
