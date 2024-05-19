package unit.test;

import org.junit.*;
import static org.junit.Assert.*;
import java.sql.*;
import java.util.List;
import uts.isd.model.ShippingModel;
import uts.isd.model.dao.DBManager;

public class ShippingDBTest {
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
    public void testCreateShipping() throws SQLException {
        String address = "1 Sydney Street, Sydney";
        String methodType = "Express";
        String date = "10/01/2000";

        dbManager.createShipping(address, methodType, date);

        List<ShippingModel> ShippingModel = dbManager.getShippingModel();
        assertFalse(ShippingModel.isEmpty());
    }

    @Test
    public void testUpdateShipping() throws SQLException {
        String address = "2, Canberra Street, Sydney";
        String methodType = "Standard";
        String date = "12/12/2024";


        dbManager.updateShipping(address, methodType, date);
        

        ShippingModel expectedShippingModel = new ShippingModel(address, methodType, date);
        List<ShippingModel> shippingModels = dbManager.getShippingModel(); 

        
        ShippingModel actualShippingModel = shippingModels.get(shippingModels.size() - 1);

        assertEquals(expectedShippingModel.getAddress(), actualShippingModel.getAddress());
        assertEquals(expectedShippingModel.getMethod(), actualShippingModel.getMethod());
        assertEquals(expectedShippingModel.getDate(), actualShippingModel.getDate());
    }

}
