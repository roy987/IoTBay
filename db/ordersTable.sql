CREATE TABLE Orders (
    orderID VARCHAR(50),
    date VARCHAR(20),
    email VARCHAR(50),
    orderStatus VARCHAR(20),
    productID VARCHAR(50), 
    orderTotal VARCHAR(20),
    CONSTRAINT order_pk PRIMARY KEY (orderID)
);