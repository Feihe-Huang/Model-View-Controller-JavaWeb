
<%@ page import="DAO.JDBCTool" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <link rel="stylesheet" href="css/frontpage.css">
    <title></title>
</head>
<body>

<div class="navbar">
    <a href="frontpage.jsp">Home</a>

    <div class="dropdown1">
        <button class="dropbtn1">Characters<i class="fa fa-caret-down"></i></button>
        <div class="dropdown-content1">
            <a href = "Employee.jsp">Employee</a>
            <a href = "Product.jsp">Product</a>
            <a href = "producer.jsp">Producer</a>
            <a href = "Team.jsp">Team</a>
            <a href="Employee&Community.jsp">Employee and Community</a>
            <a href="EmployeeComparison.jsp">Other</a>
        </div>
    </div>
    <div class="dropdown1">
        <button class="dropbtn1">SignUp
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content1">
            <a href="unuse.jsp">User</a>
            <a href="unuse.jsp">Admin</a>
        </div>
    </div>
    <div class="dropdown1">
        <button class="dropbtn1">Login
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content1">
            <a href="index1.jsp">Admin</a>
            <!-- <a href="index1.jsp">Customer</a> -->
            <a href="index1.jsp">Artist</a>
        </div>
    </div>
    <a href="frontpage.jsp">Logout</a>

</div>
<h1>Other Query Operations</h1>

<br>
<br>

<h2 style = "">To Check Whether the Salary is Fair
    <span style = "font-size: 12px; color: rgb(72,72,72)">(Using Nested Query and Aggregate Functions)</span>
</h2>

<%--performance--%>
<table style = "margin-left: 10%; width: 35%; box-shadow: 1px 1px 8px;">
    <tr>
        <style>
            th{
                text-align: center;
                background-color: rgb(235, 197, 134);
            }
        </style>
        <th>Employee ID</th>
        <th>Name</th>
        <th style = "font-weight: bold; color: red;">Performance</th>
        <th>Salary</th>
    </tr>
    <% String sql0= "SELECT e_id, name, performance, salary FROM employee WHERE performance > (SELECT AVG(performance) FROM employee) ORDER BY performance DESC";
        try {
            Connection conn = JDBCTool.getConnection();
            PreparedStatement st = conn.prepareStatement(sql0);

            ResultSet rs = st.executeQuery(sql0);

            while(rs.next()){
    %>
    <tr>
        <style>
            td{
                text-align: center;
            }
        </style>
        <td><%= rs.getString("e_id") %></td>
        <td><%= rs.getString("name") %></td>
        <td style = "background-color:rgba(234,105,105,0.38)">
            <%= rs.getString("performance") %></td>
        <td><%= rs.getString("salary") %></td>
    </tr>
    <%} %>
    <%rs.close();
        st.close();
        conn.close();
    }
    catch (Exception e) {
    }
    %>
</table>
<%--salary--%>
<table style = "margin-left: 52%; width: 35%; box-shadow: 1px 1px 8px;
    margin-top: -18vh;">
    <tr>
        <style>
            th{
                text-align: center;
                background-color: rgb(235, 197, 134);
            }
        </style>
        <th>Employee ID</th>
        <th>Name</th>
        <th>Performance</th>
        <th style = "font-weight: bold; color: red;">Salary</th>
    </tr>
    <% String sql1= "SELECT e_id, name, performance, salary FROM employee WHERE salary > (SELECT AVG(salary) FROM employee) ORDER BY salary DESC";
        try {
            Connection conn = JDBCTool.getConnection();
            PreparedStatement st = conn.prepareStatement(sql1);

            ResultSet rs = st.executeQuery(sql1);

            while(rs.next()){
    %>
    <tr>
        <style>
            td{
                text-align: center;
            }
        </style>
        <td><%= rs.getString("e_id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("performance") %></td>
        <td style = "background-color:rgba(234,105,105,0.38)">
            <%= rs.getString("salary") %></td>
    </tr>
    <%} %>
    <%rs.close();
        st.close();
        conn.close();
    }
    catch (Exception e) {
    }
    %>
</table>
<br><p style = "text-align: center; font-style: italic; color: rgba(95,94,94,0.35)">
    SELECT id, name, performance, salary FROM employee WHERE performance > (SELECT AVG(performance) FROM employee) ORDER BY performance DESC</p>
<p style = "text-align: center; font-style: italic; color: rgba(95,94,94,0.35)">
    SELECT id, name, performance, salary FROM employee WHERE salary > (SELECT AVG(salary) FROM employee) ORDER BY salary DESC</p>

<br>
<hr>

<h2 style = "">To Check the Performance Distribution
    <span style = "font-size: 12px; color: rgb(72,72,72)">(Using GROUP BY and Aggregate Functions)</span>
</h2>

<%--gender--%>
<table style = "margin-left: 10%; width: 35%; box-shadow: 1px 1px 8px;">
    <tr>
        <style>
            th{
                text-align: center;
                background-color: rgb(235, 197, 134);
            }
        </style>
        <th style = "font-weight: bold; color: red;">Gender</th>
        <th>Salary</th>
    </tr>
    <% String sql3= "SELECT gender, AVG(performance) AS avgPer FROM employee GROUP BY gender";
        try {
            Connection conn = JDBCTool.getConnection();
            PreparedStatement st = conn.prepareStatement(sql3);

            ResultSet rs = st.executeQuery(sql3);

            while(rs.next()){
    %>
    <tr>
        <style>
            td{
                text-align: center;
            }
        </style>
        <td><%= rs.getString("gender") %></td>
        <td><%= rs.getString("avgPer") %></td>

    </tr>
    <%} %>
    <%rs.close();
        st.close();
        conn.close();
    }
    catch (Exception e) {
    }
    %>
</table>

<%--team id--%>
<table style = "margin-left: 52%; width: 35%; box-shadow: 1px 1px 8px;
    margin-top: -11vh;">
    <tr>
        <style>
            th{
                text-align: center;
                background-color: rgb(235, 197, 134);
            }
        </style>
        <th style = "font-weight: bold; color: red;">Team Number</th>
        <th>Salary</th>
    </tr>
    <% String sql4= "SELECT teamno, AVG(performance) AS avgPer FROM employee GROUP BY teamno";
        try {
            Connection conn = JDBCTool.getConnection();
            PreparedStatement st = conn.prepareStatement(sql4);

            ResultSet rs = st.executeQuery(sql4);

            while(rs.next()){
    %>
    <tr>
        <style>
            td{
                text-align: center;
            }
        </style>
        <td><%= rs.getString("teamno") %></td>
        <td><%= rs.getString("avgPer") %></td>

    </tr>
    <%} %>
    <%rs.close();
        st.close();
        conn.close();
    }
    catch (Exception e) {
    }
    %>
</table>
<br><p style = "text-align: center; font-style: italic; color: rgba(95,94,94,0.35)">
    SELECT gender, AVG(performance) AS avgPer FROM employee GROUP BY gender</p>
<p style = "text-align: center; font-style: italic; color: rgba(95,94,94,0.35)">
    SELECT teamno, AVG(performance) AS avgPer FROM employee GROUP BY teamno</p>
<br>
<hr>

<h2 style = "">To List ALL of the Employees in Risk
    <span style = "font-size: 12px; color: rgb(72,72,72)">(Using ANY and HAVING)</span>
</h2>

<%--risk--%>
<table style = "margin-left: 15%; width: 70%; box-shadow: 1px 1px 8px;">
    <tr>
        <style>
            th{
                text-align: center;
                background-color: rgb(235, 197, 134);
            }
        </style>
        <th >Name</th>
        <th>Telephone Number</th>
        <th style = "font-weight: bold; color: red;">Community Number</th>
    </tr>
    <% String sql5= "SELECT name,tel,communityno FROM employee HAVING communityno = ANY(SELECT com_id FROM community WHERE risk_level = 3)";
        try {
            Connection conn = JDBCTool.getConnection();
            PreparedStatement st = conn.prepareStatement(sql5);

            ResultSet rs = st.executeQuery(sql5);

            while(rs.next()){
    %>
    <tr>
        <style>
            td{
                text-align: center;
            }
        </style>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("tel") %></td>
        <td><%= rs.getString("communityno") %></td>

    </tr>
    <%} %>
    <%rs.close();
        st.close();
        conn.close();
    }
    catch (Exception e) {
    }
    %>
</table>

<br><p style = "text-align: center; font-style: italic; color: rgba(95,94,94,0.35)">
    SELECT name,tel,communityno FROM employee HAVING communityno = ANY(SELECT com_id FROM community WHERE risk_level = 3)</p>

<br>
<hr>

<h2 style = "">To Rank the Likes Received and filter NO.2 - N0.6
    <span style = "font-size: 12px; color: rgb(72,72,72)">(Using LIMIT, OFFSET and ORDER BY)</span>
</h2>
<%--salary--%>
<table style = "margin-left: 15%; width: 70%; box-shadow: 1px 1px 8px;">
    <tr>
        <style>
            th{
                text-align: center;
                background-color: rgb(235, 197, 134);
            }
        </style>
        <th >Name</th>
        <th>Telephone Number</th>
        <th>Team Number</th>
        <th style = "font-weight: bold; color: red;">Likes Received</th>
    </tr>
    <% String sql6= "SELECT name,tel,teamno,likes FROM employee ORDER BY likes DESC LIMIT 1,5";
        try {
            Connection conn = JDBCTool.getConnection();
            PreparedStatement st = conn.prepareStatement(sql6);

            ResultSet rs = st.executeQuery(sql6);

            while(rs.next()){
    %>
    <tr>
        <style>
            td{
                text-align: center;
            }
        </style>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("tel") %></td>
        <td><%= rs.getString("teamno") %></td>
        <td style = "background-color:rgba(234,105,105,0.38)"><%= rs.getString("likes") %></td>

    </tr>
    <%} %>
    <%rs.close();
        st.close();
        conn.close();
    }
    catch (Exception e) {
    }
    %>
</table>
<br><p style = "text-align: center; font-style: italic; color: rgba(95,94,94,0.35)">
    SELECT name,tel,teamno,likes FROM employee ORDER BY likes DESC LIMIT 1,5</p>

<br><br>
</body>
</html>
