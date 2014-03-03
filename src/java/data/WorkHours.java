package data;

public class WorkHours {
    private int id;
    private int hoursTotal;
    private double percentExternal;

    public WorkHours() {
    }

    public WorkHours(int id, int hoursTotal, double percentExternal) {
        this.id = id;
        this.hoursTotal = hoursTotal;
        this.percentExternal = percentExternal;
    }

    public int getHoursTotal() {
        return hoursTotal;
    }

    public int getId() {
        return id;
    }

    public double getPercentExternal() {
        return percentExternal;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setHoursTotal(int hoursTotal) {
        this.hoursTotal = hoursTotal;
    }

    public void setPercentExternal(double percentExternal) {
        this.percentExternal = percentExternal;
    }
    
    @Override
    public String toString(){
        return "Hours total: " + hoursTotal + "Percent external hours: " + percentExternal;
    }    
}
