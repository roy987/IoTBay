CREATE TABLE orders (
    orderID VARCHAR(20) PRIMARY KEY,
    date VARCHAR(20),
    email VARCHAR(20),
    orderStatus VARCHAR(20),
    productID VARCHAR(20),
    paymentID VARCHAR(20),
    deliveryID VARCHAR(20),
    FOREIGN KEY (productID) REFERENCES products(productID),
    FOREIGN KEY (paymentID) REFERENCES payments(paymentID),
    FOREIGN KEY (deliveryID) REFERENCES deliveries(deliveryID)
);
