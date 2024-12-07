<%--
  Created by IntelliJ IDEA.
  User: mingw
  Date: 2022/6/5
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="DAO.JDBCTool" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <link rel="stylesheet" href="css/frontpage.css">
    <title>Employee and Community JOIN</title>
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

<h1>Where the employees live in</h1>

<br>
<br>

<h2 style = "margin-left: -50%;">Community Info</h2>
<%--Community Show--%>
<table name = "community" id = "community" style = "margin-left: 5%; width: 38%; box-shadow: 1px 1px 8px;">
    <tr>
        <style>
            th{
                text-align: center;
                background-color: rgb(235, 197, 134);
            }
        </style>
        <th>Community ID</th>
        <th>Address Details</th>
        <th>Risk Level</th>
    </tr>
    <% String sql2= "SELECT * FROM community";
        try {
            Connection conn = JDBCTool.getConnection();
            PreparedStatement st = conn.prepareStatement(sql2);

            ResultSet rs = st.executeQuery(sql2);

            while(rs.next()){
    %>
    <tr>
        <style>
            td{
                text-align: center;
            }
        </style>
        <td><%= rs.getString("com_id") %></td>
        <td><%= rs.getString("details") %></td>
        <td><%= rs.getString("risk_level") %></td>
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

<script type="text/javascript">
    //记得放到最后，因为必须等表格呈现之后才可以改变样式颜色
    table = document.getElementsByName('community'); //获取集合
    for (i = 0; i < table[0].rows.length; i++) {//遍历
        td = table[0].rows[i].cells[2];//取出td
        if (td.textContent == 3) {//判断
            td.style.color = "red";
            td.style.fontWeight = "bold";
            td.style.backgroundColor = "rgba(234,105,105,0.38)"
        }
    }
</script>

<h2 style=" margin-left: 46%;
    margin-top: -24.5%;">Employees in Risk</h2>
<%--Table DESC--%>
<table name = "double2" id = "double2" style = "float: right;
    margin-left: 5%;
    width: 46%;
    box-shadow: 1px 1px 8px;
    margin-right: 5%;">
    <tr>
        <style>
            th{
                text-align: center;
                background-color: rgb(235, 197, 134);
            }
        </style>
        <th>Community ID</th>
        <th>Employee Name</th>
        <th>Telephone Number</th>
        <th>Risk Level</th>
    </tr>
    <% String sql1= "SELECT com_id,communityno,name,tel,risk_level FROM employee INNER JOIN community ON communityno = com_id ORDER BY risk_level DESC";
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
        <td><%= rs.getString("com_id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("tel") %></td>
        <td><%= rs.getString("risk_level") %></td>
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

<script type="text/javascript">
    //记得放到最后，因为必须等表格呈现之后才可以改变样式颜色
    table = document.getElementsByName('double2'); //获取集合
    for (i = 0; i < table[0].rows.length; i++) {//遍历
        td = table[0].rows[i].cells[3];//取出td
        if (td.textContent == 3) {//判断
            td.style.color = "red";
            td.style.fontWeight = "bold";
            td.style.backgroundColor = "rgba(234,105,105,0.38)"
        }
    }
</script>

<br><p style = "text-align: center; font-style: italic; color: rgba(95,94,94,0.35); margin-top: 27%;">
    SELECT com_id,communityno,name,tel,risk_level FROM employee INNER JOIN community ON communityno = com_id ORDER BY risk_level DESC</p>

<br><br>
</body>
</html>
