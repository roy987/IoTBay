CREATE TABLE ShippingDetails (
    shippingID int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    address VARCHAR(100) NOT NULL,
    methodType VARCHAR(100) NOT NULL,
    shippingDate DATE NOT NULL,
    FOREIGN KEY (shippingID) REFERENCES Orders(orderID)
);
