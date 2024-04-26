CREATE TABLE Users(
    user_email varchar(50), 
    user_name varchar(50),
    user_password varchar(50),
    user_gender varchar(10),
    user_fav_colour varchar(50),

    CONSTRAINT user_pk PRIMARY KEY (user_email)
);
