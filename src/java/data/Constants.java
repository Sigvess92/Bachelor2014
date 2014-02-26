/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package data;

import java.util.ArrayList;

/**
 *
 * @author Sigve
 * 
 * Class containing the constants used in the application.
 * 
 */
public class Constants {
    
    /**
     * Constants related to the database. 
     */
    public final static String DatabaseURL = "jdbc:mysql://localhost:3306/bachelor";
    public final static String DatabaseDriver = "com.mysql.jdbc.Driver";
    public final static String DatabaseUser = "root";
    public final static String DatabasePassword = "admin";
    /**
     * Constants related to the statistics. 
     */
    public final int employeesInDepartment = 18;
    public final int employeesInSector = 100;
    public final int workHoursPerWeek = 40;
    public final int publicationsPerYear = 10;
    
    public ArrayList<Integer> getStats(){
        ArrayList<Integer> stats = new ArrayList<Integer>();
        stats.add(employeesInDepartment);        
        stats.add(employeesInSector);
        stats.add(workHoursPerWeek);
        stats.add(publicationsPerYear);
        return stats;
    }
}
