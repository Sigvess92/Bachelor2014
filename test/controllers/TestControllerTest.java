/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import junit.framework.TestCase;
import org.springframework.ui.ModelMap;

/**
 *
 * @author Frode
 */
public class TestControllerTest extends TestCase {
    
    public TestControllerTest(String testName) {
        super(testName);
    }

    /**
     * Test of showWorkHours method, of class TestController.
     */
    public void testShowWorkHours() {
        System.out.println("showWorkHours");
        ModelMap model = null;
        TestController instance = new TestController();
        String expResult = "";
        String result = instance.showWorkHours(model);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
