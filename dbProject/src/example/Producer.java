package example;

import DAO.ProducerDAO;

public class Producer{

    private int pro_id;
    private String name;
    private int pro_amount;
    private int pro_likes;
    private String pro_tel;


    public Producer(int pro_id, String pro_name, int pro_amount, int pro_likes, String pro_tel){
        super();
        this.pro_id = pro_id;
        this.name = pro_name;
        this.pro_amount = pro_amount;
        this.pro_likes = pro_likes;
        this.pro_tel = pro_tel;
    }

    public Producer(){
        super();
    }

    public int getId(){
        return pro_id;
    }

    public void setId(int pro_id){
        this.pro_id = pro_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String pro_name) {
        this.name = pro_name;
    }

    public double getAmount() {
        return pro_amount;
    }

    public void setAmount(int pro_amount) {
        this.pro_amount = pro_amount;
    }

    public int getLikes() {
        return pro_likes;
    }

    public void setLikes(int pro_likes) {
        this.pro_likes = pro_likes;
    }

    public String getTel() {
        return pro_tel;
    }

    public void setTel(String pro_tel) {
        this.pro_tel = pro_tel;
    }
}
