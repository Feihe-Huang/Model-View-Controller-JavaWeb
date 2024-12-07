package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.Producer;
import DAO.ProducerDAO;

@WebServlet("/producerServlet")
public class producerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public producerServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        // 获取temp值
        String temp = request.getParameter("temp");
        ProducerDAO service = new ProducerDAO();
        PrintWriter out = response.getWriter();
        if (temp.equals("getAll")) {
            // 查询全部信息

            List<Producer> list = service.getAllProducers();
            request.setAttribute("list", list);
            request.getRequestDispatcher("producer.jsp").forward(request, response);
            System.out.println("Get ALL");
        } else if (temp.equals("byName")) {
            String name = request.getParameter("name");
            List<Producer> list;
            if (name == "") {
                list = service.getAllProducers();
                System.out.println("Get ALL");
            } else {
                list = service.getByName(name);
                System.out.println("Get part");
            }
            System.out.println(list.size());
            request.setAttribute("list", list);
            request.getRequestDispatcher("producer.jsp").forward(request, response);

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