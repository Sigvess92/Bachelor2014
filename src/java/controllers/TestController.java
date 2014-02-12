/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

/**
 *
 * @author Sigve
 */
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.ModelAndView; 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; 
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.HashMap;
import controller.database.executions.DBController;
 
public class TestController implements Controller { 
    
    protected final Log logger = LogFactory.getLog(getClass());
    private DBController db = new DBController();
    
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        String now = (new Date()).toString();
        logger.info("Returning hello view with " + now); 
        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("now", now);
        myModel.put("products", this.db.getWorkHours()); 
        return new ModelAndView("hello", "model", myModel);
    }
    public void setDBController(DBController db) {
        this.db = db;
    } 
}
