/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tests;

/**
 *
 * @author Sigve
 */
import data.WorkHours;
import junit.framework.TestCase;

public class WorkHoursTest extends TestCase {

    private WorkHours wh;

    protected void setUp() throws Exception {
        wh = new WorkHours();
    }

    public void testSetAndGetHoursTotal() {
        int testHoursTotal = 10;
        assertEquals(0,0);
        wh.setHoursTotal(testHoursTotal);
        assertEquals(testHoursTotal, wh.getHoursTotal());
    }

    public void testSetAndGetPercentExternal() {
        double testPercentExternal = 100.00;
        assertEquals(0, 0, 0);    
        wh.setPercentExternal(testPercentExternal);
        assertEquals(testPercentExternal, wh.getPercentExternal(), 0);
    }
  
}
