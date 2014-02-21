/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.database.executions;

import controller.database.connections.DBCleaner;
import data.Calculations;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

/**
 *
 * @author Sigve
 */
public class DBController extends controller.database.connections.Establish {

//    private final Timer timer = new Timer();

    public DBController() {
//        super(databasenavn, databasedriver, user, pw);

//        insertData();
    }

    public int getListNumber() {
        try {
            System.out.println("Connecting to db");
            openConnection();
        } catch (Exception e) {
            DBCleaner.writeOutput(e, "Could not connect");
        }
        int number = 0;
        String query = "SELECT COUNT(*) FROM workhours";
        PreparedStatement statement01 = null;
        ResultSet rs = null;
        try {
            statement01 = getConnect().prepareStatement(query);
            rs = statement01.executeQuery();
            if (rs.next()) {
                number = rs.getInt(1);
            }

        } catch (SQLException e) {
            DBCleaner.writeOutput(e, "DB getListNumber(): SQL Exception");
        }
        DBCleaner.closeStatement(statement01);
        DBCleaner.closeResultSet(rs);
        closeConnection();
        return number;
    }

    public ArrayList<data.WorkHours> getWorkHours() {
        try {
            System.out.println("Connecting to db");
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

    public void regWorkHours() {
        try {
            System.out.println("Connecting to db");
            openConnection();
        } catch (Exception e) {
            DBCleaner.writeOutput(e, "Could not connect");
        }
        Random generator = new Random();
        String query = "INSERT INTO workhours (hoursTotal, percentExternal) VALUES(?,?)";
        PreparedStatement statement01 = null;
        try {            
            statement01 = getConnect().prepareStatement(query);
            statement01.setInt(1, generator.nextInt(40));
            statement01.setDouble(2, Calculations.round(generator.nextInt(99)+generator.nextDouble(),1));
            statement01.executeUpdate();
        } catch (SQLException e) {
            DBCleaner.writeOutput(e, "DB regWorkHours(): SQL Exception");
        }
        DBCleaner.closeStatement(statement01);
        closeConnection();

    }

//    private void insertData() {
//        timer.scheduleAtFixedRate(new TimerTask() {
//            @Override
//            public void run() {
//                regWorkHours();
//            }
//        }, 5 * 1000, 5 * 1000);
//    }
}
