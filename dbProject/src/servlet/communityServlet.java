package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.Community;
import DAO.CommunityDAO;

@WebServlet("/communityServlet")
public class communityServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public communityServlet(){
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        // 获取temp值
        String temp = request.getParameter("temp");
        CommunityDAO service = new CommunityDAO();
        PrintWriter out = response.getWriter();
        if (temp.equals("getAll")) {
            // 查询全部信息

            List<Community> list = service.getAllCommunities();
            request.setAttribute("list", list);
            request.getRequestDispatcher("Community.jsp").forward(request, response);
            System.out.println("Get ALL");
        } else if (temp.equals("byDetails")) {
            String details = request.getParameter("details");
            List<Community> list;
            if (details == "") {
                list = service.getAllCommunities();
                System.out.println("Get ALL");
            } else {
                list = service.getByDetails(details);
                System.out.println("Get part");
            }
            System.out.println(list.size());
            request.setAttribute("list", list);
            request.getRequestDispatcher("Community.jsp").forward(request, response);

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
