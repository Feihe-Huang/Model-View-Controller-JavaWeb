package DAO;
import example.Community;
import example.Employee;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CommunityDAO extends JDBCTool{

    public static  List<Community> getAllCommunities() {
        List<Community> communities = new ArrayList<Community>();

        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM community");

            while (rs.next()) {

                int com_id = rs.getInt("com_id");
                String details = rs.getString("details");
                int risk_level = rs.getInt("risk_level");

                Community e = new Community(com_id, details, risk_level);
                communities.add(e);
            }
            rs.close();
            st.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return communities;
    }

    public static Community getCommunityById(int comid) {
        Connection conn = null;

        try {
            conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM community WHERE com_id = comid");

            if (rs.next()) {
                String details = rs.getString("details");
                int risk_level = rs.getInt("risk_level");

                Community com = new Community(comid, details, risk_level);
                return com;
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
        return null;
    }

    public static boolean deleteCommunityByID(int comid) {
        Connection conn = null;
        try {
            conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM community WHERE com_id = comid");
            if (rs.next()) {
                st.executeQuery("DELETE FROM community WHERE com_id = comid");
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

    public static boolean updateCommunity(Community com) {
        return false;
    }

    public List<Community> getByDetails(String details) {
        List<Community> communities = new ArrayList<Community>();
        String sql = "SELECT * FROM community WHERE name = ?";
        rs = executeQuery(sql, details);
        try {
            while (rs.next()) {
                Community com = new Community();
                com.setCom_id(rs.getInt(1));
                com.setDetails(rs.getString(2));
                com.setRisk_level(rs.getInt(3));
                communities.add(com);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, ps, rs);
        }
        return communities;
    }
}
