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
    String databasenavn = "jdbc:mysql://localhost:3306/bach";
    String databasedriver = "com.mysql.jdbc.Driver";
    String user = "root";
    String pw = "admin";

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
