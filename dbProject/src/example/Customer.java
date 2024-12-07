package example;

public class Customer {
    private String name;
    private String phoneNumber;
    private int ID;
    private float consumption;
    private String lastConsume;

    public Customer(int ID, String name,String phoneNumber,int consumption, String lastConsume){
        this.ID=ID;
        this.name=name;
        this.phoneNumber=phoneNumber;

        this.consumption=consumption;
        this.lastConsume=lastConsume;
    }

    public void setUsername(String name){

        this.name=name;
    }
    public String getUsername(){
        return name;
    }

    public void setPhoneNumber (String phoneNumber) {

        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber (){

        return phoneNumber;
    }

    public void setID(int ID){
        this.ID=ID;
    }

    public int getID (){
        return ID;
    }

    public void setConsumption(float consumption){
        this.consumption=consumption;
    }

    public float getConsumption (){
        return consumption;
    }
    public void setLastConsume(String lastConsume ){
        this.lastConsume=lastConsume;
    }

    public String getLastConsume(){
        return lastConsume;
    }
}


