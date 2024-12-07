package DAO;

import example.Customer;
import example.Employee;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO extends JDBCTool{
    public static List<Customer> getAllCustomers() {
        List<Customer> customers = new ArrayList<Customer>();

        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM customers");

            while (rs.next()) {

                int userid = rs.getInt("ID");
                String name = rs.getString("name");
                String phoneNumber = rs.getString("phoneNumber");
                int consumption=rs.getInt("consumption");
                String lastConsume=rs.getString("lastConsume");

                Customer cus = new Customer(userid, name, phoneNumber, consumption, lastConsume);
                customers.add(cus);
            }
            rs.close();
            st.close();
            conn.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    public static Customer getCustomerByPhone(String phoneNumber) {
        Connection conn = null;

        try {
            conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM employee WHERE phoneNumber = phoneNumber");

            if (rs.next()) {
                int userid=rs.getInt("ID");
                String name = rs.getString("name");
                int consumption = rs.getInt("consumption");
                String lastConsume = rs.getString("lastConsume");

                Customer cus = new Customer(userid, name, phoneNumber, consumption, lastConsume);
                return cus;
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

}

