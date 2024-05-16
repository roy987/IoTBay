package uts.isd.model;

import java.io.Serializable;

public class Product implements Serializable {

    private String productID;
    private String productName;
    private int stock;
    private double price;

    public Product() {
    }

    public Product(String productID, String productName, int stock, double price) {
        this.productID = productID;
        this.productName = productName;
        this.stock = stock;
        this.price = price;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productID='" + productID + '\'' +
                ", productName='" + productName + '\'' +
                ", stock=" + stock +
                ", price=" + price +
                '}';
    }
}
