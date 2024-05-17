CREATE TABLE Devices(
    deviceID int PRIMARY KEY,
    deviceName varchar(50) NOT NULL,
    deviceCategory varchar(50) NOT NULL,
    deviceBrand varchar(50) NOT NULL,
    deviceQuantity int NOT NULL,
    devicePrice Float NOT NULL
);
