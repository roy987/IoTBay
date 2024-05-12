CREATE TABLE UserLog (
    LogId int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Email varchar(50) NOT NULL,
    EventType varchar(20) NOT NULL,
    EventTime varchar(50) NOT NULL
);
