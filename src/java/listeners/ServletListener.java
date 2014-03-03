/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package listeners;

/**NOT YET IMPLEMENTED
 *
 * @author Sigve
 */
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
 
public class ServletListener implements ServletContextListener{
 
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("ServletContextListener destroyed");
	}
 
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("ServletContextListener started");	
	}
}
