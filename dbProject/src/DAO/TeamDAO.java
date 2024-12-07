package DAO;
import example.Employee;
import example.Team;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TeamDAO extends JDBCTool{

    public static List<Team> getAllTeams(){
        List<Team> teams = new ArrayList<Team>();

        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM team");

            while(rs.next()){
                int t_id = rs.getInt("t_id");
                String name = rs.getString("name");
                int sale = rs.getInt("sale");

                Team t = new Team(t_id, name, sale);
                teams.add(t);
            }
            rs.close();
            st.close();
            conn.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return teams;
    }

    public static Team getTeamById(int tid){
        Connection conn = null;

        try{
            conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM team WHERE t_id = tid");

            if (rs.next()) {
                String leader = rs.getString("leader");
                int sale = rs.getInt("sale");
                Team t = new Team(tid, leader, sale);
                return t;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            if(conn != null)
                try{
                    conn.close();
                }catch (SQLException e){
                    e.printStackTrace();
                }
        }
        return null;
    }

    public static boolean deleteTeamByID(int tid){
        Connection conn = null;
        try {
            conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM team WHERE t_id = tid");
            if (rs.next()) {
                st.executeQuery("DELETE FROM team WHERE t_id = tid");
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null)
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }
        return false;
    }

    public static boolean insertTeam(Team t){
        Connection conn = null;
        try {
            conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
//            这里到底需不需要添加empno的判断
            st.executeQuery("INSERT INTO team VALUES(t.leader, t.sale)");
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

    public List<Team> getByName(String name) {
        List<Team> teams = new ArrayList<Team>();
        String sql = "SELECT * FROM team WHERE name = ?";
        rs = executeQuery(sql, name);
        try {
            while (rs.next()) {
                Team t = new Team();
                t.setTeano(rs.getInt(1));
                t.setName(rs.getString(2));
                t.setSale(rs.getInt(3));
                teams.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, ps, rs);
        }
        return teams;
    }

}
