package uts.isd.model;

import java.beans.*;
import java.io.Serializable;
import java.util.Date;


/**
 *
 * @author Roy
 */

public class Order implements Serializable {

    private int orderID;
    private Date date;
    private String email;
    private String orderStatus;
    private int productID;
    private int paymentID;
    private int shipmentID;
    private Product product;

    // Constructors, getters, and setters
    public Order() {
    }

    public Order(int orderID, Date date, String email, String orderStatus, int productID, int paymentID, int shipmentID) {
        this.orderID = orderID;
        this.date = date;
        this.email = email;
        this.orderStatus = orderStatus;
        this.productID = productID;
        this.paymentID = paymentID;
        this.shipmentID = shipmentID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
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

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public int getShipmentID() {
        return shipmentID;
    }

    public void setShipmentID(int shipmentID) {
        this.shipmentID = shipmentID;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "Order{"
                + "orderID=" + orderID
                + ", date=" + date
                + ", email='" + email + '\''
                + ", orderStatus='" + orderStatus + '\''
                + ", productID=" + productID
                + ", paymentID=" + paymentID
                + ", shipmentID=" + shipmentID
                + ", product=" + product
                + '}';
    }
}
