/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Beans/Bean.java to edit this template
 */
package uts.isd.model;

import java.beans.*;
import java.io.Serializable;

public class Payment implements Serializable {
    private String paymentID;
    private PaymentDetails paymentDetails;
    private String orderID;

    public Payment(String paymentID, PaymentDetails paymentDetails, String orderID) {
        this.paymentID = paymentID;
        this.paymentDetails = paymentDetails;
        this.orderID = orderID;
    }

    public String getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(String paymentID) {
        this.paymentID = paymentID;
    }

    public PaymentDetails getPaymentDetails() {
        return paymentDetails;
    }

    public void setPaymentDetails(PaymentDetails paymentDetails) {
        this.paymentDetails = paymentDetails;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    @Override
    public String toString() {
        return "Payment{" +
                "paymentID='" + paymentID + '\'' +
                ", paymentDetails=" + paymentDetails +
                ", orderID='" + orderID + '\'' +
                '}';
    }
}
