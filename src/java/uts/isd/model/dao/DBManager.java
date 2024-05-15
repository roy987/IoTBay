package uts.isd.model.dao;

import uts.isd.model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import uts.isd.model.Order;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class DBManager {

    private Statement st; 
    
    public DBManager(Connection conn) throws SQLException {       
       st = conn.createStatement();   
    }

    // Find user by email and password in the database
    public User findUser(String email, String password) throws SQLException {
        String query = "SELECT * FROM USERS WHERE email = '" + email + "' AND password = '" + password + "'";
        ResultSet rs = st.executeQuery(query);
        
        if (rs.next()) {
            User user = new User(rs.getString("email"), rs.getString("name"), rs.getString("password"), rs.getString("gender"), rs.getString("fav_col"));
            return user;
        }
        return null;
    }

    // Add a user-data into the database
    public void addUser(String email, String name, String password, String gender, String fav_col) throws SQLException {
        String query = "INSERT INTO users (email, name, password, gender, fav_col) VALUES ('" + email + "', '" + name + "', '" + password + "', '" + gender + "', '" + fav_col + "')";
        st.executeUpdate(query);
    }

    // Update a user details in the database
    public void updateUser(String email, String name, String password, String gender, String fav_col) throws SQLException {
        String query = "UPDATE users SET name = '" + name + "', password = '" + password + "', gender = '" + gender + "', fav_col = '" + fav_col + "' WHERE email = '" + email + "'";
        st.executeUpdate(query);
    }

    // Delete a user from the database
    public void deleteUser(String email) throws SQLException {
        String query = "DELETE FROM users WHERE email = '" + email + "'";
        st.executeUpdate(query);
    }
    
    
        // Find orders by email in the database
    public List<Order> findOrders(String email) throws SQLException {
    List<Order> orders = new ArrayList<>();
    String query = "SELECT * FROM ORDERS WHERE email = ?";
    PreparedStatement preparedStatement = st.getConnection().prepareStatement(query);
    preparedStatement.setString(1, email);
    ResultSet rs = preparedStatement.executeQuery();
    
    while (rs.next()) {
        Order order = new Order(
            rs.getString("orderID"),
            rs.getString("date"),
            rs.getString("email"),
            rs.getString("orderStatus"),
            rs.getString("productName"),
            rs.getString("orderTotal")
        );
        orders.add(order);
    }
    
    return orders;
}


    // Add a user-data into the database
    public void addOrder(String date, String email, String orderStatus, String productName, String orderTotal) throws SQLException {
        String query = "INSERT INTO orders (date, email, orderStatus, productName, orderTotal) VALUES ('" + date + "', '" + email + "', '" + orderStatus + "', '" + productName + "', '" + orderTotal + "')";
        st.executeUpdate(query);
    }

    // Update a user details in the database
    public void updateOrder(String orderID, String date, String email, String orderStatus, String productName, String orderTotal) throws SQLException {
        String query = "UPDATE orders SET date = '" + date + "', email = '" + email + "', orderStatus = '" + orderStatus + "', productName = '" + productName + "', orderTotal = '" + orderTotal + "' WHERE orderID = '" + orderID + "'";
        st.executeUpdate(query);
    } 

    // Delete a user from the database
//    public void deleteOrder(String email) throws SQLException {
//        String query = "DELETE FROM users WHERE email = '" + email + "'";
//        st.executeUpdate(query);
//    }


 

}