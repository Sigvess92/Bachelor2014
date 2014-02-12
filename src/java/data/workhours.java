

package data;

public class workhours {
    private int id;
    private double hoursTotal;
    private double percentExternal;

    public workhours() {
    }

    public workhours(int id, double hoursTotal, double percentExternal) {
        this.id = id;
        this.hoursTotal = hoursTotal;
        this.percentExternal = percentExternal;
    }

    public double getHoursTotal() {
        return hoursTotal;
    }

    public int getId() {
        return id;
    }

    public double getPercentExternal() {
        return percentExternal;
    }
    
    
    
    
}
