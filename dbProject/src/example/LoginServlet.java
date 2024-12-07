package example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
        
        String n=request.getParameter("email");  
        String p=request.getParameter("password"); 
        
        HttpSession session = request.getSession(false);
        if(session!=null)
        session.setAttribute("l_id", n);
        
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;

        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "group16?useUnicode=true&characterEncoding=utf8";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "hfh102938";
        String query= "select * from login";
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, userName, password);
             st = conn.createStatement();
            rs = st.executeQuery(query);
            rs.next();
            String user = rs.getString(2);
            System.out.println("hellllloooooo"+user);
        //String user;
            if(LoginDao.validate(n,"0",p)){
            	System.out.println("admin");
            	out.print("You are on admin page");
            	 RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");  
                 rd.forward(request,response);  
            }else if(LoginDao.validate(n, "1", p)){
            	System.out.println("artist");

            	out.print("You are on artist page");
            	 RequestDispatcher rd=request.getRequestDispatcher("user.jsp");
                 rd.forward(request,response);  
            }else if(LoginDao.validate(n,"2", p)){
            	System.out.println("customer");

            	out.print("You are on customer page");
            	RequestDispatcher rd=request.getRequestDispatcher("likes.jsp");  
                rd.forward(request,response); 
            }
		/*if(user == "0"){  
            RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");  
            rd.forward(request,response);  
        }  
		if( user == "1"){  
            RequestDispatcher rd=request.getRequestDispatcher("user.jsp");
            rd.forward(request,response);  
        }  
		if( user == "2"){  
            RequestDispatcher rd=request.getRequestDispatcher("customer.jsp");  
            rd.forward(request,response);  
        }  */
        else{  
            out.print("<p style=\"color:red\">Sorry username or password error</p>");  
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
            rd.include(request,response);  
        }  
            

        out.close();  
    } 
        catch (Exception e) {
            System.out.println(e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
	}
}


