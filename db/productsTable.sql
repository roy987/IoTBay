CREATE TABLE Products (
    productID int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    productName VARCHAR(100),
    stock INT,
    price DECIMAL(10, 2)
);
