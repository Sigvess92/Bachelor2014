/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.database.connections;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * This class is used for anything with connections to avoid duplication in the
 * code
 *
 * 
 */
public class Establish {

    private Connection connect;
    private String databasenavn ;
    private String databasedriver;
    private String user ;
    private String pw ;

    

    public Establish(String databasenavn, String databasedriver, String user, String pw) {
        this.databasenavn = databasenavn;
        this.databasedriver = databasedriver;
        this.user = user;
        this.pw = pw;
    }
    

    public Connection getConnect() {
        return connect;
    }

    public void openConnection() {

        try {
            Class.forName(databasedriver);  // laster inn driverklassen
        } catch (Exception e) {
            DBCleaner.writeOutput(e, "Could not load DB driver");
        }
        try {
            connect = DriverManager.getConnection(databasenavn, user, pw);
            System.out.println("Connection to Database Successfull");
        } catch (Exception e) {
            DBCleaner.writeOutput(e, "Error With Database access");
        }

    }

    /**
     * Closes down the connection when it's no longer used
     */
    public void closeConnection() {
        System.out.println("Shutting Down Database Connection");
        DBCleaner.closeConnection(connect);
    }
}
