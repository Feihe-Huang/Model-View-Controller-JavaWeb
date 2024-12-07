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

@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public AddProduct() {
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
            int pdt_id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            int input = Integer.parseInt(request.getParameter("input"));
            int output = Integer.parseInt(request.getParameter("output"));
            int daily_sale= Integer.parseInt(request.getParameter("daily sale"));
            int sale = Integer.parseInt(request.getParameter("sale"));
            int left = input - output;

            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url+dbName,"root", "hfh102938");
            PreparedStatement pst =(PreparedStatement) conn.prepareStatement("insert into products (pdt_id, name, price, input, output, daily_sale, sale, left) values(?,?,?,?,?,?,?,?)");//try2 is the name of the table
            //PreparedStatement pst1 =(PreparedStatement) conn.prepareStatement("insert into products (pdt_id) values(?)");//try2 is the name of the table


            pst.setInt(1,pdt_id);
            pst.setString(2,name);
            pst.setInt(3, price);
            pst.setInt(4,input);
            pst.setInt(5,output);
            pst.setInt(6,daily_sale);
            pst.setInt(7,sale);
            pst.setInt(8,left);
            //pst1.setString(1, id);

            int i = pst.executeUpdate();
            //int j = pst1.executeUpdate();
            //conn.commit();
            String msg=" ";
            if(i!=0){
                msg="Record has been inserted";
                pw.println("<font size='6' color=blue>" + msg + "</font>");
                RequestDispatcher rd=request.getRequestDispatcher("Product.jsp");
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


