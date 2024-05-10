/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Beans/Bean.java to edit this template
 */
package uts.isd.model;

import java.beans.*;
import java.io.Serializable;

/**
 *
 * @author Roy
 */
public class User implements Serializable {
    
    private String email;
    private String name;
    private String password;
    private String gender;
    private String favouriteColour;
    private String customer;
    
    public User() {
    }

    public User(String email, String name, String password, String gender, String favouriteColour, String customer) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.gender = gender;
        this.favouriteColour = favouriteColour;
        this.customer = customer;
    }
   // Getter and Setter methods for email
    public String getEmail() {
        return email;
    }
    
    public String getCustomer() {
        return customer;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter and Setter methods for name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Getter and Setter methods for password
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Getter and Setter methods for gender
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    // Getter and Setter methods for favouriteColour
    public String getFavouriteColour() {
        return favouriteColour;
    }

    public void setFavouriteColour(String favouriteColour) {
        this.favouriteColour = favouriteColour;
    }

    // toString method to display object's information
    @Override
    public String toString() {
        return "User{" +
                "email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", gender='" + gender + '\'' +
                ", favouriteColour='" + favouriteColour + '\'' +
                ", customer='" + customer + '\'' +
                '}';
    }
    
}
