/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tests;

import controller.database.connections.Establish;
import java.sql.Connection;
import junit.framework.TestCase;

/**
 *
 * @author Sigve
 */
public class EstablishTest extends TestCase {
    
    public EstablishTest(String testName) {
        super(testName);
    }
    
    @Override
    protected void setUp() throws Exception {
        super.setUp();
    }
    
    @Override
    protected void tearDown() throws Exception {
        super.tearDown();
    }

    /**
     * Test of getConnect method, of class Establish.
     */
    public void testGetConnect() {
        System.out.println("getConnect");
        Establish instance = null;
        Connection expResult = null;
        Connection result = instance.getConnect();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of openConnection method, of class Establish.
     */
    public void testOpenConnection() {
        System.out.println("openConnection");
        Establish instance = null;
        instance.openConnection();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of closeConnection method, of class Establish.
     */
    public void testCloseConnection() {
        System.out.println("closeConnection");
        Establish instance = null;
        instance.closeConnection();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
