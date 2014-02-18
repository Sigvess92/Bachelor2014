/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.database.executions;

import controller.database.connections.DBCleaner;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

/**
 *
 * @author Sigve
 */
public class DBController extends controller.database.connections.Establish {

    private Timer timer = new Timer();

    public DBController(String databasenavn, String databasedriver, String user, String pw) {
        super(databasenavn, databasedriver, user, pw);
        insertData();

    }

    public ArrayList<data.WorkHours> getWorkHours() {
        try {
            openConnection();
        } catch (Exception e) {
            DBCleaner.writeOutput(e, "Could not connect");
        }
        ArrayList<data.WorkHours> workHours = new ArrayList<data.WorkHours>();
        String query = "SELECT * FROM workhours ORDER BY id ASC";
//        System.out.println(query);
        PreparedStatement statement01 = null;
        ResultSet rs = null;
        try {
            statement01 = getConnect().prepareStatement(query);
            rs = statement01.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int hoursTotal = rs.getInt("hoursTotal");
                double percentExternal = rs.getDouble("percentExternal");
                workHours.add(new data.WorkHours(id, hoursTotal, percentExternal));
            }
        } catch (SQLException e) {
            DBCleaner.writeOutput(e, "DB getWorkHours(): SQL Exception");
        }
        DBCleaner.closeStatement(statement01);
        DBCleaner.closeResultSet(rs);
        closeConnection();
        return workHours;
    }

    private void regWorkHours() {
        try {
            openConnection();
        } catch (Exception e) {
            DBCleaner.writeOutput(e, "Could not connect");
        }
        String query = "INSERT INTO workhours (hoursTotal, percentExternal) VALUES(50,70)";
        PreparedStatement statement01 = null;
        try {
            statement01 = getConnect().prepareStatement(query);
            statement01.executeUpdate(query);
        } catch (SQLException e) {
            DBCleaner.writeOutput(e, "DB getWorkHours(): SQL Exception");
        }
        DBCleaner.closeStatement(statement01);
        closeConnection();
    }

    private void insertData() {
      
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                regWorkHours();
            }
        }, 5*1000,5*1000);

    }
    
}
