package uts.isd.model;

import java.io.Serializable;

public class Product implements Serializable {

    private int productID;
    private String productName;
    private int stock;
    private double price;

    public Product() {
    }

    public Product(int productID, String productName, int stock, double price) {
        this.productID = productID;
        this.productName = productName;
        this.stock = stock;
        this.price = price;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
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
