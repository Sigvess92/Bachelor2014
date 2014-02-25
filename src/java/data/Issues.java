/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package data;

/**
 *
 * @author Sigve
 */
public class Issues {
    
    public int id;
    public String issuetype;
    public String status;

    public Issues(int id, String issuetype, String status) {
        this.id = id;
        this.issuetype = issuetype;
        this.status = status;
    }   
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }    
    
    public String getIssuetype() {
        return issuetype;
    }

    public void setIssuetype(String issuetype) {
        this.issuetype = issuetype;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Issues{" + "issuetype=" + issuetype + ", status=" + status + '}';
    }    
}
