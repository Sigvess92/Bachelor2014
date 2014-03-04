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

    public Issues() {
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
    
    public boolean equals(Object other) {
        if (other == null) {
            return false;
        }
        if (other == this) {
            return true;
        }
        if (other instanceof Issues) {
            Issues issue = (Issues) other;
            return issue.id == this.id;
        }
            return false;
        
    }
    @Override
    public String toString() {
        return "Issues{" + "ID= " + id + ",issuetype=" + issuetype + ", status=" + status + '}';
    }

}
