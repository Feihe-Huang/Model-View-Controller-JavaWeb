package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.EmployeeDAO;
import example.Employee;
import example.Team;
import DAO.TeamDAO;

@WebServlet("/teamServlet")
public class teamServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;
    public teamServlet(){
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        // 获取temp值
        String temp = request.getParameter("temp");
        TeamDAO service = new TeamDAO();
        PrintWriter out = response.getWriter();
        if (temp.equals("getAll")) {
            // 查询全部信息

            List<Team> list = service.getAllTeams();
            request.setAttribute("list", list);
            request.getRequestDispatcher("Team.jsp").forward(request, response);
            System.out.println("Get ALL");
        } else if (temp.equals("byName")) {
            String leader= request.getParameter("name");
            List<Team> list;
            if (leader == "") {
                list = service.getAllTeams();
                System.out.println("Get ALL");
            } else {
                list = service.getByName(leader);
                System.out.println("Get part");
            }
            System.out.println(list.size());
            request.setAttribute("list", list);
            request.getRequestDispatcher("Team.jsp").forward(request, response);

        }
        out.flush();
        out.close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
