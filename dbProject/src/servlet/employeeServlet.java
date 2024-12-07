package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.Employee;
import DAO.EmployeeDAO;

@WebServlet("/employeeServlet")
public class employeeServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public employeeServlet(){
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        // 获取temp值
        String temp = request.getParameter("temp");
        EmployeeDAO service = new EmployeeDAO();
        PrintWriter out = response.getWriter();
        if (temp.equals("getAll")) {
            // 查询全部信息

            List<Employee> list = service.getAllEmployees();
            request.setAttribute("list", list);
            request.getRequestDispatcher("Employee.jsp").forward(request, response);

        } else if (temp.equals("byName")) {
            String name = request.getParameter("name");
            List<Employee> list;
            if (name == "") {
                list = service.getAllEmployees();

            } else {
                list = service.getByName(name);

            }
            System.out.println(list.size());
            request.setAttribute("list", list);
            request.getRequestDispatcher("Employee.jsp").forward(request, response);
        } else if (temp.equals("toLike")){
            int id = Integer.parseInt(request.getParameter("id"));
            Employee e = service.getEmployeeByID(id);

            if (service.likeByID(e)){
                System.out.println("Like sent");
            } else{
                System.out.println("Failed");
            }
            request.getRequestDispatcher("Employee.jsp").forward(request, response);

        } else if (temp.equals("toUpdate")){
            int id = Integer.parseInt(request.getParameter("id"));
            Employee e = service.getEmployeeByID(id);
            request.setAttribute("e", e);
            request.getRequestDispatcher("/updateEmployee.jsp").forward(request, response);
        }
        else if (temp.equals("updating")){
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String tel = request.getParameter("tel");
            int communityno = Integer.parseInt(request.getParameter("communityno"));
            int teamno = Integer.parseInt(request.getParameter("teamno"));
            int performance = Integer.parseInt(request.getParameter("performance"));

            float salary = (float) Integer.parseInt(request.getParameter("salary"));
            Boolean commenting = Boolean.parseBoolean(request.getParameter("commenting"));
            Boolean leader = Boolean.parseBoolean(request.getParameter("leader"));
            Boolean editing = Boolean.parseBoolean(request.getParameter("editing"));
            int likes = Integer.parseInt(request.getParameter("likes"));

            Employee e = new Employee(id, name, gender, tel,communityno,  teamno, performance, salary, commenting, leader, editing, likes);
            if(service.update(e)){
                System.out.println("Update Employee Successfully");
            } else{
                System.out.println("Update failed");
            }
            request.getRequestDispatcher("employeeServlet?temp=getAll").forward(request, response);
        }
        else if(temp.equals("delete")){
            int id = Integer.parseInt(request.getParameter("id"));
            if (service.delete(id)) {
                System.out.println("Delete Employee Successfully");
            } else {
                System.out.println("Delete failed");
            }
            request.getRequestDispatcher("employeeServlet?temp=getAll").forward(request, response);
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
