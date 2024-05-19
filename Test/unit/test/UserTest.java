package unit.test;

import org.junit.*;
import static org.junit.Assert.*;
import java.sql.*;
import java.util.List;
import uts.isd.model.User;
import uts.isd.model.UserLog;
import uts.isd.model.dao.DBManager;
import static uts.isd.model.dao.DBManager.now;

public class UserTest {
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
    public void testCreateCustomer() throws SQLException {
        String email = "test01@example.com";
        String password = "123456";
        String name = "Test";
        String phone = "12345678";
        String customer = "1";

        User user1 = new User(email, name, password, phone, customer);
        dbManager.addUser(email, name, password, phone, customer);

        User user2 = dbManager.findUser(email, password);
        
        assertEquals(user1.getEmail(), user2.getEmail());
        assertEquals(user1.getName(), user2.getName());
        assertEquals(user1.getPassword(), user2.getPassword());
        assertEquals(user1.getPhone(), user2.getPhone());
        assertEquals(user1.getCustomer(), user2.getCustomer());
    }


    @Test
    public void testUpdateUser() throws SQLException {
        String email = "test02@example.com";
        String password = "123456";
        String name = "Test";
        String phone = "12345678";
        String customer = "1";
        
        dbManager.addUser(email, name, password, phone, customer);

        password = "654321";
        name = "Tset";
        phone = "87654321";
        
        User user1 = new User(email, name, password, phone, customer);
                
        dbManager.updateUser(email, name, password, phone);
        User user2 = dbManager.findUser(email, password);
        assertEquals(user1.getEmail(), user2.getEmail());
        assertEquals(user1.getName(), user2.getName());
        assertEquals(user1.getPassword(), user2.getPassword());
        assertEquals(user1.getPhone(), user2.getPhone());
        assertEquals(user1.getCustomer(), user2.getCustomer());
    }
    
    @Test
    public void testDeleteUser() throws SQLException {
        String email = "test03@example.com";
        String password = "123456";
        String name = "Test";
        String phone = "12345678";
        String customer = "1";
        
        dbManager.addUser(email, name, password, phone, customer);
        
        dbManager.deleteUser(email);
        
        User user = dbManager.findUser(email, password);
        
        assertNull(user);
    }
    
    @Test
    public void testLogCreation() throws SQLException { 
        String email = "test03@example.com";
        
        dbManager.addLogRegister(email);
        dbManager.addLogLogin(email);
        dbManager.addLogLogout(email);
        
        List<UserLog> userLogs = dbManager.getUserLogs(email);
        
        assertEquals(userLogs.size(), 3);
        assertEquals(userLogs.get(0).getEventType(), "Register");
        assertEquals(userLogs.get(1).getEventType(), "Login");
        assertEquals(userLogs.get(2).getEventType(), "Logout");
    }
}
