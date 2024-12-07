package DAO;


import java.sql.*;

public class JDBCTool {

	private static String driver="com.mysql.jdbc.Driver";

	private static String url="jdbc:mysql://localhost:3306/";

	private static String dbName = "group16?useUnicode=true&characterEncoding=utf8";

	private static String user="root";

	private static String pwd="";
	
	//JDBC api
	protected static Connection conn=null;
	protected static PreparedStatement ps = null;
	protected static ResultSet rs = null;


	public static Connection getConnection() {
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url + dbName,user,pwd);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return conn;
	}


	public void close(Connection conn,PreparedStatement ps,ResultSet rs){
		try {
			if(rs != null){
				rs.close();
			}
			//�ر�
			if (ps != null) {
				ps.close();
			}
			if(conn != null){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	  protected int executeUpdate(String sql, Object... params){
	        int result = 0;
	        try {
	        	//��ȡ����
	        	conn = getConnection();
	        	//Ԥ����sql���
	            ps = conn.prepareStatement(sql);
	            //���ò���
	            if(params!=null){
	            	 for (int i = 0; i < params.length; i++) {
	            		 ps.setObject(i + 1, params[i]);
	                 }
	            }
	            //ִ��sql
	            result = ps.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	        	//�ر�
	        	close(conn, ps, rs);
	        }
	        return result;
	    }

	  protected ResultSet executeQuery(String sql, Object... params){
	        try {
	        	//��ȡ���Ӷ���
	        	conn = getConnection();
	        	//Ԥ����sql���
	            ps = conn.prepareStatement(sql);
	            //���ò���
	            if(params!=null){
	            	 for (int i = 0; i < params.length; i++) {
	            		 ps.setObject(i + 1, params[i]);
	                 }
	            }
	            //ִ��sql
	            rs = ps.executeQuery();
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return rs;
	    }
}
