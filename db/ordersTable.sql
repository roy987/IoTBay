CREATE TABLE orders (
    orderID int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date DATE DEFAULT CURRENT_DATE,
    email VARCHAR(50),
    orderStatus VARCHAR(20),
    productID int,
    paymentID int,
    shipmentID int
);
