package uts.isd.model.dao;

import uts.isd.model.User;
import uts.isd.model.UserLog;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import uts.isd.model.Order;
import uts.isd.model.Product;


/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class DBManager {

    private Statement st; 
    public static final String date_format = "yyyy-MM-dd @ HH:mm:ss";
    

    public DBManager(Connection conn) throws SQLException {       
       st = conn.createStatement();   
    }

   public static String now() {
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat(date_format);
        return sdf.format(cal.getTime());
    }

    // Find user by email and password in the database
    public User findUser(String email, String password) throws SQLException {
        String query = "SELECT * FROM USERS WHERE email = '" + email + "' AND password = '" + password + "'";
        ResultSet rs = st.executeQuery(query);
        
        if (rs.next()) {
            User user = new User(rs.getString("email"), rs.getString("name"), rs.getString("password"), rs.getString("phone"), rs.getString("customer"));
            return user;
        }
        return null;
    }

    // Add a user-data into the database
    public void addUser(String email, String name, String password, String phone, String customer) throws SQLException {
        String query = "INSERT INTO users (email, name, password, phone, customer) VALUES ('" + email + "', '" + name + "', '" + password + "', '" + phone + "', '" + customer + "')";
        st.executeUpdate(query);
    }

    // Update a user details in the database
    public void updateUser(String email, String name, String password, String phone) throws SQLException {
        String query = "UPDATE users SET name = '" + name + "', password = '" + password + "', phone = '" + phone + "' WHERE email = '" + email + "'";
        st.executeUpdate(query);
    }
    


    public void addLogLogin(String email) throws SQLException {
        String datetime = now();
        System.out.println(datetime + " ");
        String query = "INSERT INTO Userlog (email, eventType, eventTime) VALUES ('"+email+"', 'Login', '"+datetime+"')";
        st.executeUpdate(query);
    }
            
    public void addLogLogout(String email) throws SQLException {
        String datetime = now();
        System.out.println(datetime + " ");
        String query = "INSERT INTO Userlog (email, eventType, eventTime) VALUES ('"+email+"', 'Logout', '"+datetime+"')";
        st.executeUpdate(query);
    }
            
    public void addLogRegister(String email) throws SQLException {
        String datetime = now();
        System.out.println(datetime + " ");
        String query = "INSERT INTO Userlog (email, eventType, eventTime) VALUES ('"+email+"', 'Register', '"+datetime+"')";
        st.executeUpdate(query);
    }

    // Delete a user from the database
    public void deleteUser(String email) throws SQLException {
        String query = "DELETE FROM users WHERE email = '" + email + "'";
        st.executeUpdate(query);
    }
    
    public List<UserLog> getUserLogs(String email) throws SQLException {
        String query = "SELECT * FROM USERLOG WHERE email = '" + email + "'";
        ResultSet rs = st.executeQuery(query);
        
        System.out.println("USERLOGS");
        List<UserLog> userLogs = new ArrayList<>();  
        while (rs.next()) {
//            ResultSetMetaData metaData = rs.getMetaData();
//            int columnCount = metaData.getColumnCount();
//            for (int i = 1; i <= columnCount; i++) {
//                System.out.println(metaData.getColumnLabel(i) + ": " + rs.getObject(i));
//            }
//
//            // Check for null values
//            int logId = rs.getInt("LogId");
//            if (!rs.wasNull()) {
//                System.out.println("LogId: " + logId);
//            } else {
//                System.out.println("LogId is null");
//            }
            

            int logId = rs.getInt("LogId");
            String logIdStr = Integer.toString(logId);
            String eventType = rs.getString("EventType");
            String eventTime = rs.getString("EventTime");
            
            UserLog userLog = new UserLog(logIdStr, email, eventType, eventTime);
            userLogs.add(userLog);
        } 
        
        if (!userLogs.isEmpty()) {
            return userLogs;
        }
        return null;
        
    }
//    
//          // Find orders by email in the database
//    public List<Order> findOrders(String email) throws SQLException {
//    List<Order> orders = new ArrayList<>();
//    String query = "SELECT * FROM ORDERS WHERE email = ?";
//    PreparedStatement preparedStatement = st.getConnection().prepareStatement(query);
//    preparedStatement.setString(1, email);
//    ResultSet rs = preparedStatement.executeQuery();
//
//    while (rs.next()) {
//        Order order = new Order(
//            rs.getString("orderID"),
//            rs.getString("date"),
//            rs.getString("email"),
//            rs.getString("orderStatus"),
//            rs.getString("productName"),
//            rs.getString("orderTotal")
//        );
//        orders.add(order);
//    }
//
//    return orders;
//}
//
//
//    // Add a user-data into the database
//    public void addOrder(String date, String email, String orderStatus, String productName, String orderTotal) throws SQLException {
//        String query = "INSERT INTO orders (date, email, orderStatus, productName, orderTotal) VALUES ('" + date + "', '" + email + "', '" + orderStatus + "', '" + productName + "', '" + orderTotal + "')";
//        st.executeUpdate(query);
//    }
//
//    // Update a user details in the database
//    public void updateOrder(String orderID, String date, String email, String orderStatus, String productName, String orderTotal) throws SQLException {
//        String query = "UPDATE orders SET date = '" + date + "', email = '" + email + "', orderStatus = '" + orderStatus + "', productName = '" + productName + "', orderTotal = '" + orderTotal + "' WHERE orderID = '" + orderID + "'";
//        st.executeUpdate(query);
//    } 
//
//    // Delete a user from the database
////    public void deleteOrder(String email) throws SQLException {
////        String query = "DELETE FROM users WHERE email = '" + email + "'";
////        st.executeUpdate(query);
////    }
//    

    public List<Order> getAllOrders(String userEmail) throws SQLException {     
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders WHERE email = '" + userEmail + "'";
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
               
            int orderID = rs.getInt("orderID");
            Date date = rs.getDate("date");
            String email = rs.getString("email");
            String orderStatus = rs.getString("orderStatus");
            int productID = rs.getInt("productID");
            int paymentID = rs.getInt("paymentID");
            int shipmentID = rs.getInt("shipmentID");

            Order order = new Order(orderID, date, email, orderStatus, productID, paymentID, shipmentID);
            orders.add(order);
        }
        System.out.println(orders + "these are the orders g");
        return orders;
    }    
    
    public void createOrder(String email, String orderStatus, int productID, int shipmentID, int paymentID) throws SQLException {
        String query = "INSERT INTO orders (email, orderStatus, productID, paymentID, shipmentID) VALUES ('" + email + "', '" + orderStatus + "', " + productID + ", " + paymentID + ", " + shipmentID + ")";
        st.executeUpdate(query);
    }

    public void updateOrder(int orderID, String email, String orderStatus, int productID, int shipmentID, int paymentID) throws SQLException {
        String query = "UPDATE orders SET email = '" + email + "', orderStatus = '" + orderStatus + "', productID = " + productID + ", shipmentID = " + shipmentID + ", paymentID = " + paymentID + " WHERE orderID = " + orderID;
        st.executeUpdate(query);
    }

    public void updateOrderStatus(int orderID, String newOrderStatus) throws SQLException {
        String query = "UPDATE orders SET orderStatus = '" + newOrderStatus + "' WHERE orderID = " + orderID;
        st.executeUpdate(query);
    }
    
    public Order getOrderByID(int orderID) throws SQLException {
        Order order = null;
        String query = "SELECT * FROM orders WHERE orderID = " + orderID;
        ResultSet rs = st.executeQuery(query);
        if (rs.next()) {
            // Retrieve order details from the ResultSet
            String email = rs.getString("email");
            Date date = rs.getDate("date");

            String orderStatus = rs.getString("orderStatus");
            int productID = rs.getInt("productID");
            int shipmentID = rs.getInt("shipmentID");
            int paymentID = rs.getInt("paymentID");

            // Create an Order object with retrieved details
            order = new Order(orderID, date, email, orderStatus, productID, shipmentID, paymentID);
        }
        return order;
    }
    
    
    public Product getProductFromDatabase(int productID) throws SQLException {
        String query = "SELECT * FROM products WHERE productID = ?";
        PreparedStatement preparedStatement = st.getConnection().prepareStatement(query);
        preparedStatement.setInt(1, productID); // Set int parameter
        ResultSet rs = preparedStatement.executeQuery();

        if (rs.next()) {
            Product product = new Product(
                    rs.getInt("productID"),
                    rs.getString("productName"),
                    rs.getInt("stock"),
                    rs.getDouble("price")
            );
            return product;
        }
        return null;
    }


    // Method to get product details based on productID
    public Product getProductDetails(int productID) throws SQLException {
        return getProductFromDatabase(productID);
    }
    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM products";
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            Product product = new Product(
                rs.getInt("productID"),
                rs.getString("productName"),
                rs.getInt("stock"),
                rs.getDouble("price")
            );
            products.add(product);
        }

        return products;
    }
    public void decrementProductStock(int productID) throws SQLException {
        // Retrieve the current stock level of the product
        String getStockQuery = "SELECT stock FROM products WHERE productID = " + productID;
        ResultSet rs = st.executeQuery(getStockQuery);
        if (rs.next()) {
            int currentStock = rs.getInt("stock");
            if (currentStock > 0) {
                // Decrement the stock by 1
                int newStock = currentStock - 1;
                // Update the product record in the database
                String updateStockQuery = "UPDATE products SET stock = " + newStock + " WHERE productID = " + productID;
                st.executeUpdate(updateStockQuery);
            } else {
                throw new SQLException("Insufficient stock for productID: " + productID);
            }
        } else {
            throw new SQLException("Product not found for productID: " + productID);
        }
    }

    
    // Create payment details in the database
    public void createPayment(String cardNumber, String cardName, String expiryDate, String cvv, String email) throws SQLException {
        String query = "INSERT INTO paydetails (cardNumber, cardName, expiryDate, cvv, email) VALUES ('" + cardNumber + "', '" + cardName + "', '" + expiryDate + "', '" + cvv + "', '" + email + "')";
        st.executeUpdate(query);
    }

    
    // Update payment details in the database
    public void updatePayment(String email, String cardNumber, String cardName, String expiryDate, String cvv) throws SQLException {
        String query = "UPDATE paydetails SET cardName = '" + cardName + "', expiryDate = '" + expiryDate + "', cvv = '" + cvv + "' WHERE email = '" + email + "' AND cardNumber = '" + cardNumber + "'";
        st.executeUpdate(query);
    }

    // Delete payment details from the database
    public void deletePayment(String email, String cardNumber) throws SQLException {
        String query = "DELETE FROM paydetails WHERE email = '" + email + "' AND cardNumber = '" + cardNumber + "'";
        st.executeUpdate(query);
    }
}