/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package data;

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
    public final static int employeesInDepartment = 18;
    public final static int employeesInSector = 100;
    public final static int workHoursPerWeek = 40;
    public final static int publicationsPerYear = 10;
}
