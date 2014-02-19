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
import org.springframework.stereotype.Controller;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; 
import controller.database.executions.DBController;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TestController{ 

    protected final Log logger = LogFactory.getLog(getClass());
    private DBController db = new DBController("jdbc:mysql://localhost:3306/bachelor","com.mysql.jdbc.Driver","root","admin");
    
    @RequestMapping(value="/test.htm")
    public String showWorkHours(ModelMap model){
        model.addAttribute("WorkHours",db.getWorkHours());
        return "test";
    }
    /*
    public String showListNumber(ModelMap model){
        model.addAttribute("ListNumber", db.getListNumber());
        return "test";
    }
    */
    
}
/**
 * public class TestController implements Controller { 
    
    protected final Log logger = LogFactory.getLog(getClass());
    private DBController db = new DBController();
    
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        String now = (new Date()).toString();
        logger.info("Returning hello view with " + now); 
        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("now", now);
        myModel.put("hours", this.db.getWorkHours()); 
        return new ModelAndView("test", "model", myModel);
    }
    public void setDBController(DBController db) {
        this.db = db;
    } 
}
 * 
 */
