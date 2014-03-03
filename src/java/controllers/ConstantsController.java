package controllers;

import data.Constants;
import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**NOT YET IMPLEMENTED
 *
 * @author Sigve
 */
@Controller
public class ConstantsController {
    
    private final ArrayList<String> DBCredentials = new ArrayList<String>();
    private final ArrayList<Integer> Stats = new ArrayList<Integer>();
    private final Constants con = new Constants();
    
    @RequestMapping(value="/test.htm")
    public String showConstants(ModelMap model){
        model.addAttribute("Constants",con);
        return "test";
    }
}
