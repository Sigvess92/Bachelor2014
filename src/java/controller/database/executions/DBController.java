/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.database.executions;

import controller.database.connections.DBCleaner;
import data.Achievement;
import data.Calculations;
import data.Issues;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import org.springframework.stereotype.Controller;

/**
 *
 * @author Sigve
 */
@Controller
public class DBController extends controller.database.connections.Establish {

    public DBController() {
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

    public ArrayList<Issues> getIssues() {
        try {
            System.out.println("Connecting to db");
            openConnection();
        } catch (Exception e) {
            DBCleaner.writeOutput(e, "Could not connect");
        }
        ArrayList<data.Issues> issues = new ArrayList<data.Issues>();
        String query = "SELECT * FROM issues ORDER BY id ASC";
        PreparedStatement statement01 = null;
        ResultSet rs = null;
        try {
            statement01 = getConnect().prepareStatement(query);
            rs = statement01.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String issueType = rs.getString("issuetype");
                String status = rs.getString("status");
                issues.add(new data.Issues(id, issueType, status));
            }
        } catch (SQLException e) {
            DBCleaner.writeOutput(e, "DB getWorkHours(): SQL Exception");
        }
        DBCleaner.closeStatement(statement01);
        DBCleaner.closeResultSet(rs);
        closeConnection();
        return issues;
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
            statement01.setDouble(2, Calculations.round(generator.nextInt(99) + generator.nextDouble(), 1));
            statement01.executeUpdate();
        } catch (SQLException e) {
            DBCleaner.writeOutput(e, "DB regWorkHours(): SQL Exception");
        }
        DBCleaner.closeStatement(statement01);
        closeConnection();

    }

    public void regIssues(Issues issue) {
        try {
            System.out.println("Connecting to db");
            openConnection();
        } catch (Exception e) {
            DBCleaner.writeOutput(e, "Could not connect");
        }
        String query = "INSERT INTO issues (id,issuetype, status) VALUES(?,?,?)";
        PreparedStatement statement01 = null;
        try {
            statement01 = getConnect().prepareStatement(query);
            statement01.setInt(1, issue.id);
            statement01.setString(2, issue.issuetype);
            statement01.setString(3, issue.status);
            statement01.executeUpdate();
        } catch (SQLException e) {
            DBCleaner.writeOutput(e, "DB regIssues(): SQL Exception");
        }
        DBCleaner.closeStatement(statement01);
        closeConnection();
    }

    
     public void regIssues() {
     try {
     System.out.println("Connecting to db");
     openConnection();
     } catch (Exception e) {
     DBCleaner.writeOutput(e, "Could not connect");
     }
        
     Random generator = new Random();
     String issuetype = "";
     String status = "";
     int x = generator.nextInt(3);
     if (x == 0) {
     issuetype = "Bug";
     if (generator.nextInt(2) == 0) {
     status = "Passed";
     } else {
     status = "Open";
     }
     } else if (x == 1) {
     issuetype = "Test case";
     if (generator.nextInt(2) == 0) {
     status = "Passed";
     } else {
     status = "In-progress";
     }
     } else {
     issuetype = "Feature";
     if (generator.nextInt(2) == 0) {
     status = "Passed";
     } else {
     status = "In-progress";
     }
     }
     String query = "INSERT INTO issues (issuetype, status) VALUES(?,?)";
     PreparedStatement statement01 = null;
     try {
     statement01 = getConnect().prepareStatement(query);
     statement01.setString(1, issuetype);
     statement01.setString(2, status);
     statement01.executeUpdate();
     } catch (SQLException e) {
     DBCleaner.writeOutput(e, "DB regIssues(): SQL Exception");
     }
     DBCleaner.closeStatement(statement01);
     closeConnection();

     }
     
     public boolean checkIfCompleted(int value){
        try {
            System.out.println("Connecting to db");
            openConnection();
        } catch (Exception e) {
            DBCleaner.writeOutput(e, "Could not connect");
        }
        boolean result = false;
        String query = "SELECT * FROM achievementsavailable WHERE "+value+">=treshold";
        PreparedStatement statement01 = null;
        ResultSet rs = null;
        try {
            statement01 = getConnect().prepareStatement(query);
            rs = statement01.executeQuery();
            while (rs.next()) {                
                grantAchievement(rs.getString("title"), rs.getString("description"), rs.getInt("treshold"), rs.getInt("reward"));
                removeGrantedAchievement(rs.getInt("id"));
                result = true;
            }
        } catch (SQLException e) {
            DBCleaner.writeOutput(e, "DB CheckIfCompleted(): SQL Exception");
        }
        DBCleaner.closeStatement(statement01);
        DBCleaner.closeResultSet(rs);
        closeConnection();
        return result;        
    }
    
    public void grantAchievement(String title, String description, int treshold, int value){
        try {
            System.out.println("Connecting to db");
            openConnection();
        } catch (Exception e) {
            DBCleaner.writeOutput(e, "Could not connect");
        }
        String query = "INSERT INTO achievementsgranted (title, description, treshold, reward) VALUES(?,?,?,?)";
        PreparedStatement statement01 = null;
        try {
            statement01 = getConnect().prepareStatement(query);
            statement01.setString(1, title);
            statement01.setString(2, description);
            statement01.setInt(3, treshold);
            statement01.setInt(4, value);
            statement01.executeUpdate();
            
        } catch (SQLException e) {
            DBCleaner.writeOutput(e, "DB GrantAchievement: SQL Exception");
        }
        DBCleaner.closeStatement(statement01);
        closeConnection();        
    }
    
    public void removeGrantedAchievement(int id){
        try {
            System.out.println("Connecting to db");
            openConnection();
        } catch (Exception e) {
            DBCleaner.writeOutput(e, "Could not connect");
        }
        String query = "DELETE FROM achievementsavailable WHERE id="+id;
        PreparedStatement statement01 = null;
        try {
            statement01 = getConnect().prepareStatement(query);
            statement01.executeUpdate();
            
        } catch (SQLException e) {
            DBCleaner.writeOutput(e, "DB removeGrantedAchievement: SQL Exception");
        }
        DBCleaner.closeStatement(statement01);
        closeConnection();
    }
    
    public ArrayList<Achievement> getGrantedAchievements(){
        try {
            System.out.println("Connecting to db");
            openConnection();
        } catch (Exception e) {
            DBCleaner.writeOutput(e, "Could not connect");
        }
        ArrayList<Achievement> myAchievements = new ArrayList<Achievement>();
        String query = "SELECT * FROM achievementsgranted";
        PreparedStatement statement01 = null;
        ResultSet rs = null;
        try {
            statement01 = getConnect().prepareStatement(query);
            rs = statement01.executeQuery();
            while (rs.next()) {                
                myAchievements.add(new Achievement(rs.getString("title"), rs.getString("description"), rs.getInt("treshold"), rs.getInt("reward")));
            }
        } catch (SQLException e) {
            DBCleaner.writeOutput(e, "DB getGrantedAchievements(): SQL Exception");
        }
        DBCleaner.closeStatement(statement01);
        DBCleaner.closeResultSet(rs);
        closeConnection();
        return myAchievements;
    }
//    public static void main(String[]args){
//        String title = "lol";
//        String description = "so wow";
//        int treshold = 18;
//        int value = 5;
//        System.out.println("INSERT INTO achievementsgranted (title, description, treshold, value) VALUES("+title+","+description+","+treshold+","+value+")");
//    }
}
