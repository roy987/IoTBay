CREATE TABLE Users(
    email varchar(50), 
    name varchar(50),
    password varchar(50),
    gender varchar(10),
    fav_col varchar(50),

    CONSTRAINT user_pk PRIMARY KEY (email)
);
