package DAO;
import example.Product;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends JDBCTool{

    public static List<Product> getAllProducts(){
        List<Product> products = new ArrayList<Product>();

        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM products");

            while(rs.next()){
                int pdt_id = rs.getInt("pdt_id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int input = rs.getInt("input");
                int output = rs.getInt("output");
                int daily_sale = rs.getInt("daily_sale");
                int sale = rs.getInt("sale");

                Product pdt = new Product(pdt_id, name, price, input, output, daily_sale, sale);
                products.add(pdt);
            }
            rs.close();
            st.close();
            conn.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return products;
    }

    public static Product getProductById(int pdt_id){
        Connection conn = null;

        try{
            conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();;
            ResultSet rs = st.executeQuery("SELECT * FROM products WHERE pdt_id = pdt_id");

            if(rs.next()){
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int input = rs.getInt("input");
                int output = rs.getInt("output");
                int daily_sale = rs.getInt("daily_sale");
                int sale = rs.getInt("sale");

                Product pdt = new Product(pdt_id, name, price, input, output, daily_sale, sale);
                return pdt;
            }
        }catch (SQLException e){
            e.printStackTrace();
        } finally {
            if(conn != null)
                try{
                    conn.close();
                }catch (SQLException e){
                    e.printStackTrace();
                }
        }
        return null;
    }

    public static  boolean deleteProductByID(int pdt_id) {
        Connection conn = null;
        try {
            conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM products WHERE pdt_id = pdt_id");
            if (rs.next()) {
                st.executeQuery("DELETE FROM products WHERE pdt_id = pdt_id");
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

    public static boolean insertProduct(Product p){
        Connection conn = null;
        try{
            conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            st.executeQuery("INSERT INTO products VALUES (p.name, p.price, p.input, p.output, p.daily_sale, p.sale, (p.input - p.output))");
        }catch (SQLException ee){
            ee.printStackTrace();
        }finally {
            if(conn != null)
                try{
                    conn.close();
                }catch (SQLException ee){
                    ee.printStackTrace();
                }
        }
        return false;
    }

    public List<Product> getByName(String name){
        List<Product> products = new ArrayList<Product>();
        String sql = "SELECT * FROM products WHERE name = ?";
        rs = executeQuery(sql, name);
        try{
            while(rs.next()){
                Product p = new Product();
                p.setPdtno(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setPrice(rs.getInt(3));
                p.setInput(rs.getInt(4));
                p.setOutput(rs.getInt(5));
                p.setDaily_sale(rs.getInt(6));
                p.setSale(rs.getInt(7));
                p.setLeft();
                products.add(p);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(conn, ps, rs);
        }
        return products;
    }
}
