/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  jyapr
 * Created: 26 Apr 2024
 */


CREATE TABLE users (
    email VARCHAR(30),
    username VARCHAR(50),
    password VARCHAR(50),
    gender VARCHAR(20),
    favouriteColour VARCHAR(50),

    PRIMARY KEY (email)
);



