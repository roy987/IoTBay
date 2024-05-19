package uts.isd.model.dao;

import uts.isd.model.User;
import uts.isd.model.UserLog;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import uts.isd.model.Device;
import uts.isd.model.Order;
import uts.isd.model.Product;
import uts.isd.model.Payment;
import uts.isd.model.PaymentDetails;
import uts.isd.model.ShippingModel;

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

    public List<Order> getAllOrders(String userEmail) throws SQLException {
        // Initialize an empty list to hold the orders
        List<Order> orders = new ArrayList<>();

        // SQL query to retrieve all orders for the given email
        String query = "SELECT * FROM orders WHERE email = '" + userEmail + "'";

        // Execute the query and get the result set
        ResultSet rs = st.executeQuery(query);

        // Iterate through the result set and create Order objects
        while (rs.next()) {
            int orderID = rs.getInt("orderID");
            Date date = rs.getDate("date");
            String email = rs.getString("email");
            String orderStatus = rs.getString("orderStatus");
            int productID = rs.getInt("productID");
            int paymentID = rs.getInt("paymentID");
            int shipmentID = rs.getInt("shipmentID");

            // Create a new Order object and add it to the list
            Order order = new Order(orderID, date, email, orderStatus, productID, paymentID, shipmentID);
            orders.add(order);
        }

        // Return the list of orders
        return orders;
    }

    public void createOrder(String email, String orderStatus, int productID, int paymentID) throws SQLException {
        // SQL query to insert a new order into the orders table
        String query = "INSERT INTO orders (email, orderStatus, productID, paymentID) VALUES ('" + email + "', '" + orderStatus + "', " + productID + ", " + paymentID + ")";

        // Execute the update
        st.executeUpdate(query);
    }

    public void updateOrder(int orderID, String email, String orderStatus, int productID, int paymentID) throws SQLException {
        // SQL query to update an existing order in the orders table
        String query = "UPDATE orders SET email = '" + email + "', orderStatus = '" + orderStatus + "', productID = " + productID + ", paymentID = " + paymentID + " WHERE orderID = " + orderID;

        // Execute the update
        st.executeUpdate(query);
    }

    public void updateOrderStatus(int orderID, String newOrderStatus) throws SQLException {
        // SQL query to update the order status of an existing order
        String query = "UPDATE orders SET orderStatus = '" + newOrderStatus + "' WHERE orderID = " + orderID;

        // Execute the update
        st.executeUpdate(query);
    }

    public Order getOrderByID(int orderID) throws SQLException {
        Order order = null;

        // SQL query to retrieve an order by its ID
        String query = "SELECT * FROM orders WHERE orderID = " + orderID;

        // Execute the query and get the result set
        ResultSet rs = st.executeQuery(query);

        // If an order is found, create an Order object
        if (rs.next()) {
            String email = rs.getString("email");
            Date date = rs.getDate("date");
            String orderStatus = rs.getString("orderStatus");
            int productID = rs.getInt("productID");
            int shipmentID = rs.getInt("shipmentID");
            int paymentID = rs.getInt("paymentID");

            // Create a new Order object with the retrieved details
            order = new Order(orderID, date, email, orderStatus, productID, shipmentID, paymentID);
        }

        // Return the Order object
        return order;
    }

    public Product getProductFromDatabase(int productID) throws SQLException {
        // SQL query to retrieve a product by its ID
        String query = "SELECT * FROM products WHERE productID = ?";

        // Prepare the statement to prevent SQL injection
        PreparedStatement preparedStatement = st.getConnection().prepareStatement(query);
        preparedStatement.setInt(1, productID); // Set the product ID parameter

        // Execute the query and get the result set
        ResultSet rs = preparedStatement.executeQuery();

        // If a product is found, create a Product object
        if (rs.next()) {
            Product product = new Product(
                    rs.getInt("productID"),
                    rs.getString("productName"),
                    rs.getInt("stock"),
                    rs.getDouble("price")
            );

            // Return the Product object
            return product;
        }

        // Return null if no product is found
        return null;
    }

// Method to get product details based on productID
    public Product getProductDetails(int productID) throws SQLException {
        // Call the method to retrieve the product from the database
        return getProductFromDatabase(productID);
    }

    public List<Product> getAllProducts() throws SQLException {
        // Initialize an empty list to hold the products
        List<Product> products = new ArrayList<>();

        // SQL query to retrieve all products
        String query = "SELECT * FROM products";

        // Execute the query and get the result set
        ResultSet rs = st.executeQuery(query);

        // Iterate through the result set and create Product objects
        while (rs.next()) {
            Product product = new Product(
                    rs.getInt("productID"),
                    rs.getString("productName"),
                    rs.getInt("stock"),
                    rs.getDouble("price")
            );

            // Add the Product object to the list
            products.add(product);
        }

        // Return the list of products
        return products;
    }

    public void decrementProductStock(int productID) throws SQLException {
        // SQL query to retrieve the current stock level of the product
        String getStockQuery = "SELECT stock FROM products WHERE productID = " + productID;

        // Execute the query and get the result set
        ResultSet rs = st.executeQuery(getStockQuery);

        // If the product is found, check the stock level
        if (rs.next()) {
            int currentStock = rs.getInt("stock");

            // If there is sufficient stock, decrement the stock by 1
            if (currentStock > 0) {
                int newStock = currentStock - 1;

                // SQL query to update the stock level of the product
                String updateStockQuery = "UPDATE products SET stock = " + newStock + " WHERE productID = " + productID;

                // Execute the update
                st.executeUpdate(updateStockQuery);
            } else {
                // Throw an exception if there is insufficient stock
                throw new SQLException("Insufficient stock for productID: " + productID);
            }
        } else {
            // Throw an exception if the product is not found
            throw new SQLException("Product not found for productID: " + productID);
        }
    }

    public List<Payment> getAllPayments(String userEmail) throws SQLException {
    List<Payment> payments = new ArrayList<>();
    String query = "SELECT * FROM payment WHERE email = '" + userEmail + "'";
    ResultSet rs = st.executeQuery(query);

    while (rs.next()) {
        String paymentID = rs.getString("paymentID");
        String cardNumber = rs.getString("cardNumber");
        String cardName = rs.getString("cardName");
        String expiryDate = rs.getString("expiryDate");
        String cvv = rs.getString("cvv");
        String orderID = rs.getString("orderID");
        String email = rs.getString("email");

        PaymentDetails paymentDetails = new PaymentDetails(cardNumber, cardName, expiryDate, cvv, email);
        Payment payment = new Payment(paymentID, paymentDetails, orderID);
        payments.add(payment);
    }

    return payments;
    }

    
    public List<PaymentDetails> getPayDetails(String userEmail) throws SQLException {
    List<PaymentDetails> payDetails = new ArrayList<>();
    String query = "SELECT * FROM paydetails WHERE email = '" + userEmail + "'";
    ResultSet rs = st.executeQuery(query);

    while (rs.next()) {
        String cardNumber = rs.getString("cardNumber");
        String cardName = rs.getString("cardName");
        String expiryDate = rs.getString("expiryDate");
        String cvv = rs.getString("cvv");
        String email = rs.getString("email");

        PaymentDetails paymentDetails = new PaymentDetails(cardNumber, cardName, expiryDate, cvv, email);
        payDetails.add(paymentDetails);
    }

    return payDetails;
    }
    
    //shipping functions to insert, update and retrieve data from the database
    public void createShipping(String address, String methodType, String date) throws SQLException {
        String query = "INSERT INTO orders (address, methodType, date) VALUES ('" + address + "', '" + methodType + "', " + date + ",)";
        st.executeUpdate(query);
    }
    
    public void updateShipping (String address, String methodType, String date) throws SQLException {
        String query = "UPDATE ShippingDetails SET address = '" + address + "', methodType = '" + methodType + "' WHERE shippingDate = '" + date + "'";
        st.executeUpdate(query);
    }
    
    public List<ShippingModel> getShippingModel() throws SQLException {
    List<ShippingModel> shippingDetails = new ArrayList<>();
    String query = "SELECT * FROM shippingDetails";
    ResultSet rs = st.executeQuery(query);

    while (rs.next()) {
                    int shippingID = rs.getInt("shippingID");

        String address = rs.getString("address");
        String methodType = rs.getString("methodType");
        String shippingDate = rs.getString("shippingDate");

        ShippingModel shippingModel = new ShippingModel(address, methodType,shippingDate );
        shippingDetails.add(shippingModel);
    }

    return shippingDetails;
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
    public Device findDevice(int id) throws SQLException {
        String query = "SELECT * FROM APP.DEVICES WHERE DEVICEID= " + id;
        ResultSet rs;
        rs = st.executeQuery(query);

        while (rs.next()) {
            int deviceID = rs.getInt("DEVICEID");
            int quantity = rs.getInt("DEVICEQUANTITY");
            float price = rs.getFloat("DEVICEPRICE");
            String name = rs.getString("DEVICENAME");
            String category = rs.getString("DEVICECATEGORY");
            String brand = rs.getString("DEVICEBRAND");

            Device device = new Device(deviceID, name, category, brand, price, quantity);
            return device;
        }
        return null;
    }

    // Create - add a new device
    public void addDevice(int deviceID, int quantity, float price, String name, String category, String brand) throws SQLException {
        String query
                = "INSERT INTO APP.DEVICES(DEVICEID, DEVICEQUANTITY, DEVICEPRICE, DEVICENAME, DEVICECATEGORY, DEVICEBRAND) "
                + "VALUES('" + deviceID + "', '" + quantity + "', " + price + ", " + name + ", " + category + ", " + brand + ")";
        st.executeUpdate(query);

    }

    public ArrayList<Device> getAllDevices() throws SQLException {
        String query = "SELECT * FROM APP.DEVICES";
        ResultSet rs = st.executeQuery(query);
        ArrayList<Device> devices = new ArrayList<>();

        while (rs.next()) {
            int deviceId = rs.getInt("DEVICEID");
            String deviceName = rs.getString("DEVICENAME");
            String deviceCategory = rs.getString("DEVICECATEGORY");
            String deviceBrand = rs.getString("DEVICEBRAND");
            int deviceQuantity = rs.getInt("DEVICEQUANTITY");
            float devicePrice = rs.getFloat("DEVICEPRICE");

            Device device = new Device(deviceId, deviceName, deviceCategory, deviceBrand, deviceQuantity, devicePrice);
            devices.add(device);
        }
        return devices;
    }

    // Read - Search & List Device by NAME
    public ArrayList<Device> searchDevicesbyName(String search) throws SQLException {
        String query = "SELECT * FROM APP.DEVICES WHERE DEVICENAME LIKE " + "%" + search + "%";
        ResultSet rs = st.executeQuery(query);
        ArrayList<Device> device = new ArrayList<>();

        while (rs.next()) {
            int deviceID = rs.getInt("DEVICEID");
            int quantity = rs.getInt("DEVICEQUANTITY");
            float price = rs.getFloat("DEVICEPRICE");
            String name = rs.getString("DEVICENAME");
            String category = rs.getString("DEVICECATEGORY");
            String brand = rs.getString("DEVICEBRAND");

            device.add(new Device(deviceID, name, category, brand, price, quantity));
        }
        return device;
    }

    // Read - Search & List Device by Category
    public ArrayList<Device> searchDevicesbyType(String search) throws SQLException {
        String query = "SELECT * FROM APP.DEVICES WHERE DEVICECATEGORY LIKE " + "%" + search + "%";
        ResultSet rs = st.executeQuery(query);
        ArrayList<Device> device = new ArrayList<>();

        while (rs.next()) {
            int deviceID = rs.getInt("DEVICEID");
            int quantity = rs.getInt("DEVICEQUANTITY");
            float price = rs.getFloat("DEVICEPRICE");
            String name = rs.getString("DEVICENAME");
            String category = rs.getString("DEVICECATEGORY");
            String brand = rs.getString("DEVICEBRAND");

            device.add(new Device(deviceID, name, category, brand, price, quantity));
        }
        return device;
    }

    // Read - Search & List Device by NAME and Category
    public ArrayList<Device> searchDevices(String searchName, String searchcategory) throws SQLException {

        // Set defaults if search name and/or type is empty
        if (searchName == null) {
            searchName = "";
        }
        if (searchcategory == null) {
            searchcategory = "";
        }

        String query
                = "SELECT * FROM APP.DEVICES "
                + "WHERE LOWER(DEVICENAME) LIKE " + "'%" + searchName + "%'"
                + "AND LOWER(DEVICECATEGORY) LIKE " + "'%" + searchcategory + "%'";
        ResultSet rs = st.executeQuery(query);
        ArrayList<Device> device = new ArrayList<>();

        while (rs.next()) {
            int deviceID = rs.getInt("DEVICEID");
            int quantity = rs.getInt("DEVICEQUANTITY");
            float price = rs.getFloat("DEVICEPRICE");
            String name = rs.getString("DEVICENAME");
            String category = rs.getString("DEVICECATEGORY");
            String brand = rs.getString("DEVICEBRAND");

            device.add(new Device(deviceID, name, category, brand, price, quantity));
        }
        return device;
    }

    // Update - Update a single device
    public void updateProduct(int deviceID, String name, String category, String brand, float price, int quantity) throws SQLException {
        String query
                = "UPDATE APP.DEVICES SET"
                + " DEVICENAME= " + "'" + name + "'" + ", "
                + " DEVICECATEGORY= " + "'" + category + "'" + ", "
                + " DEVICEBRAND= " + "'" + brand + "'" + ", "
                + " DEVICEPRICE= " + price + ", "
                + " DEVICEQUANTITY= " + quantity + ", "
                + "WHERE DEVICEID = " + deviceID;

        st.executeUpdate(query);
    }

    // Delete - Delete a single product
    public void deleteDevice(int id) throws SQLException {
        String query = "DELETE FROM APP.DEVICES WHERE DEVICEID =" + id;
        st.executeUpdate(query);
    }

    public void updatedevice(int deviceID, String deviceName, String deviceCategory, String deviceBrand, float devicePrice, int deviceQuantity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void updateDevice(int deviceId, String deviceName, String deviceCategory, String deviceBrand, float devicePrice, int deviceQuantity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }


}
