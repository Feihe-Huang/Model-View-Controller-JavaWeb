package example;

public class Team {

    private int t_id;

    private String name;

    private int sale;

    public Team(int t_id, String name, int sale){
        super();
        this.t_id = t_id;
        this.name = name;
        this.sale = sale;
    }

    public Team(){super();}

    public int getTeano() {
        return t_id;
    }

    public void setTeano(int t_id) {
        this.t_id = t_id;
    }

    public String getName(){return name;}

    public void setName(String leader){this.name = name;}

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }
}
