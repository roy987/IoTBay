package unit.test;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;
import uts.isd.model.ShippingModel;

public class ShippingModelTest {
    private ShippingModel shippingModel;

    @Before
    public void setUp() {
        shippingModel = new ShippingModel("123 Main St", "Air", "2024-05-15");
    }

    @Test
    public void testGetAddress() {
        assertEquals("123 Main St", shippingModel.getAddress());
    }

    @Test
    public void testSetAddress() {
        shippingModel.setAddress("456 Elm St");
        assertEquals("456 Elm St", shippingModel.getAddress());
    }

    @Test
    public void testGetMethod() {
        assertEquals("Air", shippingModel.getMethod());
    }

    @Test
    public void testSetMethod() {
        shippingModel.setMethod("Sea");
        assertEquals("Sea", shippingModel.getMethod());
    }

    @Test
    public void testGetDate() {
        assertEquals("2024-05-15", shippingModel.getDate());
    }

    @Test
    public void testSetDate() {
        shippingModel.setDate("2024-05-20");
        assertEquals("2024-05-20", shippingModel.getDate());
    }
}