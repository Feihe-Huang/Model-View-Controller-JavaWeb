package DAO;

import DAO.JDBCTool;
import example.Employee;
import example.Producer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class ProducerDAO extends JDBCTool {
    public static List<Producer> getAllProducers() {
        List<Producer> producers = new ArrayList<>();

        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM producer");

            while(rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString("name");
                int amount = rs.getInt("pro_amount");
                int likes = rs.getInt("pro_likes");
                String tel = rs.getString("pro_tel");

                Producer p = new Producer( id, name, amount, likes, tel);
                producers.add(p);
            }
            rs.close();
            st.close();
            conn.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return producers;
    }

    public static Producer getProducerById(int pid) {
        Connection conn = null;

        try {
            conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM producer WHERE pro_id = pid");

            if(rs.next()) {
                String name = rs.getString("pro_name");
                int amount = rs.getInt("pro_amount");
                int likes = rs.getInt("pro_likes");
                String tel = rs.getString("pro_tel");
                return new Producer(pid, name, amount, likes, tel);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if(conn!=null)
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }
        return null;
    }

    public static boolean insertProducer(Producer p) {
        Connection conn = null;
        try {
            conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();

            st.executeQuery("INSERT INTO producer VALUES(p.pro_id, p.pro_name, p.pro_amount, p.pro_likes, p.pro_tel )");
        } catch (SQLException ee) {
            ee.printStackTrace();
        } finally {
            if(conn!=null)
                try {
                    conn.close();
                } catch (SQLException ee) {
                    ee.printStackTrace();
                }
        }
        return false;
    }

    public List<Producer> getByName(String name) {
        List<Producer> producers = new ArrayList<Producer>();
        String sql = "SELECT * FROM producer WHERE name = ?";
        rs = executeQuery(sql, name);
        try {
            while (rs.next()) {
                Producer p = new Producer();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setAmount(rs.getInt(3));
                p.setLikes(rs.getInt(4));
                p.setTel(rs.getString(5));
                producers.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, ps, rs);
        }
        return producers;
    }

}
