package example;

public class Product {

    private int pdt_id; //自增
    private String name;
    private int price;
    private int input;
    private int output;
    private int daily_sale;
    private int sale;
    private int left;
    public Product(int pdt_id, String name, int price,  int input, int output,
                   int daily_sale, int sale){
        super();
        this.pdt_id = pdt_id;
        this.name = name;
        this.price = price;
        this.input = input;
        this.output = output;
        this.daily_sale = daily_sale;
        this.sale = sale;
        this.left = this.input - this.output;
    }
    public Product(){
        super();
    }


    public int getPdtno() {
        return pdt_id;
    }

    public void setPdtno(int pdt_id) {
        this.pdt_id = pdt_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice (int price) {
        this.price = price;
    }

    public int getInput() {
        return input;
    }

    public void setInput(int input) {
        this.input = input;
    }

    public int getOutput() {
        return output;
    }

    public void setOutput(int output) {
        this.output = output;
    }

    public int getDaily_sale() {
        return daily_sale;
    }

    public void setDaily_sale(int daily_sale) {
        this.daily_sale = daily_sale;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public int getLeft(){return left;}
    public void setLeft(){this.left = this.input - this.output;}

}

