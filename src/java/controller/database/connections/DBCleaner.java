package controller.database.connections;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * A file with static methods to be called in every java-file that utilizes
 * database connections. These methods are helpful for commonly used code in
 * database-methods so we avoid duplication of code.
 *
 * @author Sigve
 */
public class DBCleaner {

    /**
     * This method is used with database-connections to when we want to use
     * transactions, sets the connection to autocommit = true
     *
     * @param connect The connection that is used for communicatin with the
     * database
     */
    public static void setAutoCommit(Connection connect) {
        try {
            if (connect != null && !connect.getAutoCommit()) {
                connect.setAutoCommit(true);
            }
        } catch (SQLException e) {
            writeOutput(e, "DBCleaner setAutoCommit()");
        }
    }

    /**
     * This method sets used with database-connections to when we want to use
     * transactions, if the commit fails it will rollback any changes.
     *
     * @param connect The connection that is used for communicatin with the
     * database
     */
    public static void rollBack(Connection connect) {
        try {
            if (connect != null && !connect.getAutoCommit()) {
                connect.rollback();
            }
        } catch (SQLException e) {
            writeOutput(e, "DBCleaner rollBack()");
        }
    }

    /**
     * At the end of a database-method or if the method fails we use this method
     * to close an SQL-statement.
     *
     * @param statement A statement with a SQL-synax.
     */
    public static void closeStatement(Statement statement) {
        try {
            if (statement != null) {
                statement.close();
                System.out.println("Shutting Down SQL-Statement");
            }
        } catch (SQLException e) {
            writeOutput(e, "DBCleaner closeStatement()");
        }
    }

    /**
     * At the end of a database-method or if it fails we use this method to
     * close the ResultSet that is used for handling the results of the
     * SQL-statement.
     *
     * @param res The ResultSet that will be closed.
     */
    public static void closeResultSet(ResultSet res) {
        try {
            if (res != null) {
                res.close();
                System.out.println("Shutting Down ResultSet-Statement");
            }
        } catch (SQLException e) {
            writeOutput(e, "DBCleaner closeResultSet()");
        }
    }

    /**
     * At the end of a database-method or if it fails, we close the connection
     * used to communicate with the database.
     *
     * @param connect The connection the we want to close
     */
    public static void closeConnection(Connection connect) {
        try {
            if (connect != null) {
                connect.close();
            }
        } catch (SQLException e) {
            writeOutput(e, "Class: DBCleaner Method: closeConnection");
        }
    }

    /**
     * This method will be used if the database-methods fails, an error-message
     * will be written to the console-window of the host-machine.
     *
     * @param e The exception with detailed messages of what went wrong and
     * where
     * @param message A message that indicates where in the code things went
     * wrong
     */
    public static void writeOutput(Exception e, String message) {
        System.err.println("*** Error occured: " + message + ". ***");
        e.printStackTrace(System.err);
    }
}
