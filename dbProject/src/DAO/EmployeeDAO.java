package DAO;
import example.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO extends JDBCTool {


    public static List<Employee> getAllEmployees() {
        List<Employee> employees = new ArrayList<Employee>();

        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM employee");

            while (rs.next()) {

                int id = rs.getInt(1);
                String name = rs.getString("name");
                String gender = rs.getString("gender");
                int communityno = rs.getInt("communityno");
                String tel = rs.getString("tel");
                int teamno = rs.getInt("teamno");
                int performance = rs.getInt("performance");
                float salary = rs.getFloat("salary");
                boolean commenting = rs.getBoolean("commenting");
                boolean leader = rs.getBoolean("leader");
                boolean editing = rs.getBoolean("editing");
                int likes = rs.getInt("likes");

                Employee e = new Employee(id, name, gender, tel,communityno,
                        teamno, performance, salary, commenting, leader, editing, likes);
                employees.add(e);
            }
            rs.close();
            st.close();
            conn.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    //TODO Question 2
    public Employee getEmployeeByID(int id) {
        Employee employee = new Employee();
        String sql = "SELECT * FROM employee WHERE e_id = ?";
        rs = executeQuery(sql, id);
        System.out.println("the selected id is" + id);
        try {
            if (rs.next()) {
                Employee e = new Employee();
                e.setID(rs.getInt(1));
                e.setName(rs.getString(2));
                e.setGender(rs.getString(3));
                e.setTel(rs.getString(4));
                e.setCommunityno(rs.getInt(5));
                e.setTeamno(rs.getInt(6));
                e.setPerformance(rs.getInt(7));
                e.setSalary(rs.getFloat(8));
                e.setCommenting(rs.getBoolean(9));
                e.setLeader(rs.getBoolean(10));
                e.setEditing(rs.getBoolean(11));
                e.setLikes(rs.getInt(12));
                return e;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, ps, rs);
        }
        return null;
    }

    //TODO Delete Employee
    public boolean delete(int id) {
        String sql = "delete from employee where e_id=?";
        int n =super.executeUpdate(sql, id);
        return n > 0 ? true : false;
    }


    // 只能是非 static 方法
    //TODO Question 4
    public boolean likeByID(Employee e) {
        int n = 0;
        int t = e.getID();
        String sql = "UPDATE employee SET likes = likes + 1 WHERE e_id = ?";
        conn = getConnection();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1,t);
            st.execute();
            n++;
            st.close();
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n > 0 ? true : false;
    }

//    TODO: update the employee info
    public boolean update(Employee e){
        String sql = "UPDATE employee SET name=?, gender=?, tel=?, communityno=?, teamno=?, performance=?, salary=?, commenting=?, leader=?, editing=? WHERE e_id = ?";
        int n = super.executeUpdate(sql, e.getName(), e.getGender(), e.getTel(), e.getCommunityno(),
                e.getTeamno(), e.getPerformance(), e.getSalary(),
                e.isCommenting(), e.isLeader(), e.isEditing(), e.getID());
        return n > 0 ? true : false;
    }

    //TODO Question 5
    public static boolean insertEmployee(Employee e) {
        Connection conn = null;
        try {
            conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
//            这里到底需不需要添加empno的判断
            st.executeQuery("INSERT INTO employee VALUES(e.name, e.gender, e.communityno, e.tel, e.teamno, e.performance, e.salary, e.commenting, e.leader, e.editing, e.likes)");
        } catch (SQLException ee) {
            ee.printStackTrace();
        } finally {
            if (conn != null)
                try {
                    conn.close();
                } catch (SQLException ee) {
                    ee.printStackTrace();
                }
        }
        return false;
    }

    public List<Employee> getByName(String name) {
        List<Employee> employees = new ArrayList<Employee>();
        String sql = "SELECT * FROM employee WHERE name = ?";
        rs = executeQuery(sql, name);
        try {
            while (rs.next()) {
                Employee e = new Employee();
                e.setID(rs.getInt(1));
                System.out.println("ID = " + rs.getInt(1));
                e.setName(rs.getString(2));
                e.setGender(rs.getString(3));
                e.setTel(rs.getString(4));
                e.setCommunityno(rs.getInt(5));
                e.setTeamno(rs.getInt(6));
                e.setPerformance(rs.getInt(7));
                e.setSalary(rs.getFloat(8));
                e.setCommenting(rs.getBoolean(9));
                e.setLeader(rs.getBoolean(10));
                e.setEditing(rs.getBoolean(11));
                e.setLikes(rs.getInt(12));
                employees.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, ps, rs);
        }
        return employees;
    }
}

