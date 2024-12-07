package example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddProducer")
public class AddProducer extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public AddProducer() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        Connection conn=null;
        String url="jdbc:mysql://localhost:3306/";
        String dbName="group16?useUnicode=true&characterEncoding=utf8";
        String driver="com.mysql.jdbc.Driver";
        //String dbUserName="root";
        //String dbPassword="root";

        try{
            int pro_id = Integer.parseInt(request.getParameter("pro_id"));
            String name = request.getParameter("name");
            int pro_amount = Integer.parseInt(request.getParameter("pro_amount"));
            int pro_likes = Integer.parseInt(request.getParameter("pro_likes"));
            String pro_tel = request.getParameter("pro_tel");

            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url+dbName,"root", "hfh102938");
            PreparedStatement pst =(PreparedStatement) conn.prepareStatement("insert into producer (pro_id, name, pro_amount, pro_likes, pro_tel) values(?,?,?,?,?)");//try2 is the name of the table
            //PreparedStatement pst1 =(PreparedStatement) conn.prepareStatement("insert into products (pdt_id) values(?)");//try2 is the name of the table


            pst.setInt(1,pro_id);
            pst.setString(2,name);
            pst.setInt(3, pro_amount);
            pst.setInt(4,pro_likes);
            pst.setString(5, pro_tel);

            //pst1.setString(1, id);

            int i = pst.executeUpdate();
            //int j = pst1.executeUpdate();
            //conn.commit();
            String msg=" ";
            if(i!=0){
                msg="Record has been inserted";
                pw.println("<font size='6' color=blue>" + msg + "</font>");
                RequestDispatcher rd=request.getRequestDispatcher("producer.jsp");
                rd.forward(request,response);


            }
            else{
                msg="failed to insert the data";
                pw.println("<font size='6' color=blue>" + msg + "</font>");
            }
            pst.close();
        }
        catch (Exception e){
            pw.println(e);
        }


    }

}


