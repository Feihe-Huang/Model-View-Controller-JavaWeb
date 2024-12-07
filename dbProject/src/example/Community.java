package example;

public class Community {
    private int com_id;

    private String details;

    private int risk_level;

    public Community(int com_id, String details, int risk_level){
        super();
        this.com_id = com_id;
        this.details = details;
        this.risk_level = risk_level;
    }
    public Community(){
        super();
    }

    public int getCom_id(){return com_id;}

    public void setCom_id(int com_id){this.com_id = com_id;}

    public String getDetails(){
        return details;
    }

    public void setDetails(String details){this.details = details;}

    public int getRisk_level(){return risk_level;}

    public void setRisk_level(int risk_level){
        this.risk_level = risk_level;
    }

}
