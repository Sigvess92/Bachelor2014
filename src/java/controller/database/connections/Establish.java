package controller.database.connections;

import data.Constants;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 * This class is used for anything with connections to avoid duplication in the
 * code
 *
 * 
 */
public class Establish {

    private Connection connect ;
    private final String databasename = Constants.DatabaseURL;
    private final String databasedriver = Constants.DatabaseDriver;
    private final String user = Constants.DatabaseUser;
    private final String pw = Constants.DatabasePassword;    

    public Establish() {
    }    

    public Connection getConnect() {
        return connect;
    }

    public void openConnection() {

        try {
            Class.forName(databasedriver);
        } catch (Exception e) {
            DBCleaner.writeOutput(e, "Could not load DB driver");
        }
        try {
            connect = DriverManager.getConnection(databasename, user, pw);
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
