package unit.test;

import org.junit.*;
import static org.junit.Assert.*;
import java.sql.*;
import java.util.List;
import uts.isd.model.Order;
import uts.isd.model.dao.DBManager;

public class OrderTest {
    private static Connection conn;
    private static DBManager dbManager;

    @BeforeClass
    public static void setUpClass() throws SQLException {
        // Setup the database connection here
        String url = "jdbc:derby://localhost:1527/iotdb;";
        String username = "app";
        String password = "app";
        conn = DriverManager.getConnection(url, username, password);
        dbManager = new DBManager(conn);
    }

    @AfterClass
    public static void tearDownClass() throws SQLException {
        conn.close();
    }

    @Test
    public void testCreateOrder() throws SQLException {
        String email = "testnonemail";
        String orderStatus = "Pending";
        int productID = 1;
        int paymentID = 1;

        dbManager.createOrder(email, orderStatus, productID, paymentID);

        List<Order> orders = dbManager.getAllOrders(email);
        assertFalse(orders.isEmpty());
    }
    

   

    @Test
    public void testUpdateOrderStatus() throws SQLException {
        int orderID = 1;  // Assume this orderID exists
        String newOrderStatus = "Cancelled";

        dbManager.updateOrderStatus(orderID, newOrderStatus);
        Order order = dbManager.getOrderByID(orderID);

        assertEquals(newOrderStatus, order.getOrderStatus());
    }

    @Test
    public void testGetOrderByID() throws SQLException {
        int orderID = 1;  // Assume this orderID exists

        Order order = dbManager.getOrderByID(orderID);

        assertNotNull(order);
        assertEquals(orderID, order.getOrderID());
    }
    
    @Test
    public void testGetAllOrders() throws SQLException {
        String email = "john123@mail.com"; //Assume this email has >0 orders linked to it

        List<Order> orders = dbManager.getAllOrders(email);
        assertFalse(orders.isEmpty());
    }
    
    @Test
    public void testGetOrderStatus() throws SQLException {
        String email = "john123@mail.com"; //Assume this email has >0 orders linked to it

        List<Order> orders = dbManager.getAllOrders(email);
        assertFalse(orders.isEmpty());
        
        for (Order order : orders) {
            assertNotNull("Order status should not be null", order.getOrderStatus());
        }
    }

}
