package example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SignupServlet1")

public class Signupservlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Signupservlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");  
        PrintWriter pw = response.getWriter(); 
        //String connectionURL = "jdbc:mysql://127.0.0.1:3306/newData";// newData is the database  
        //Connection connection;  
        Connection conn=null;
        String url="jdbc:mysql://localhost:3306/";
        String dbName="group16?useUnicode=true&characterEncoding=utf8";
        String driver="com.mysql.jdbc.Driver";
    //String dbUserName="root";
    //String dbPassword="root";

    try{  
      String email= request.getParameter("email");  
      String pwd = request.getParameter("password1");  
      

      Class.forName(driver).newInstance();  
      conn = DriverManager.getConnection(url+dbName,"root", "hfh102938");
     PreparedStatement pst1 =(PreparedStatement) conn.prepareStatement("insert into login values(?,2,?)");//try2 is the name of the table  

      
      pst1.setString(1,email);
      pst1.setString(2,pwd);
      
      

      int i = pst1.executeUpdate();
      //pst1.executeUpdate();
      //conn.commit(); 
      String msg=" ";
      if(i!=0){  
        msg="Record has been inserted";
        pw.println("<font size='6' color=blue>" + msg + "</font>"); 
        RequestDispatcher rd=request.getRequestDispatcher("likes.jsp");  
        rd.forward(request,response);  


      }  
      else{  
        msg="failed to insert the data";
        pw.println("<font size='6' color=blue>" + msg + "</font>");
       }  
      pst1.close();
    }  
    catch (Exception e){  
      pw.println(e);  
    }  


}
}
