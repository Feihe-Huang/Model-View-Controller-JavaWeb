package example;

public class Employee {

    private int e_id; //自增
    private String name;
    private String gender;
    private String tel;
    private int communityno; //社区一 社区二 社区三
    private int teamno; //第几天工作
    private int performance; //业绩 --> 总销售额
    private float salary;
    private boolean commenting;
    private boolean leader;
    private boolean editing;
    private int likes;


    public Employee(int e_id, String name, String gender, String tel, int communityno,
                    int teamno, int performance, float salary, boolean commenting, boolean leader, boolean editing, int likes){
        super();
        this.e_id = e_id;
        this.name = name;
        this.gender = gender;
        this.communityno = communityno;
        this.tel = tel;
        this.teamno = teamno;
        this.performance = performance;
        this.salary = salary;
        this.commenting = commenting;
        this.leader = leader;
        this.editing = editing;
        this.likes = likes;
    }
    //不明白但
    public Employee(){
        super();
    }

    public void setID(int e_id) {this.e_id = e_id;}

    public int getID() {
        return e_id;
    }

    public void setEmpno(int e_id) {
        this.e_id = e_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    // 2022.6.4 改为String
    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getCommunityno() {
        return communityno;
    }

    public void setCommunityno(int communityno) {
        this.communityno = communityno;
    }

    public int getTeamno() {
        return teamno;
    }

    public void setTeamno(int teamno) {
        this.teamno = teamno;
    }

    public int getPerformance() {
        return performance;
    }

    public void setPerformance(int performance) {
        this.performance = performance;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public boolean isCommenting() {
        return commenting;
    }

    public void setCommenting(boolean commenting) {
        this.commenting = commenting;
    }

    public boolean isLeader() {
        return leader;
    }

    public void setLeader(boolean leader) {
        this.leader = leader;
    }

    public boolean isEditing() {
        return editing;
    }

    public void setEditing(boolean editing) {
        this.editing = editing;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

}
