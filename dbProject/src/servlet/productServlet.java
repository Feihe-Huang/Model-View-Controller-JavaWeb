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
import example.Product;
import DAO.ProductDAO;

@WebServlet("/productServlet")
public class productServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public productServlet(){
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        // 获取temp值
        String temp = request.getParameter("temp");
        ProductDAO service = new ProductDAO();
        PrintWriter out = response.getWriter();
        if (temp.equals("getAll")) {
            // 查询全部信息

            List<Product> list = service.getAllProducts();
            request.setAttribute("list", list);
            request.getRequestDispatcher("Product.jsp").forward(request, response);
            System.out.println("Get ALL");
        } else if (temp.equals("byName")) {
            String name = request.getParameter("name");
            List<Product> list;
            if (name == "") {
                list = service.getAllProducts();
                System.out.println("Get ALL");
            } else {
                list = service.getByName(name);
                System.out.println("Get part");
            }
            System.out.println(list.size());
            request.setAttribute("list", list);
            request.getRequestDispatcher("Product.jsp").forward(request, response);

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
