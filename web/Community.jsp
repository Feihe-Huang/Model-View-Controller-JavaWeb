
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/frontpage.css">
    <title>EmployeeList</title>
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
            <a href="Community.jsp">Community</a>
            <a href="Employee&Community.jsp">Employee and Community</a>
            <a href="EmployeeComparison.jsp">Other</a>
        </div>
    </div>
    <div class="dropdown1">
        <button class="dropbtn1">SignUp
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content1">
            <a href="index.jsp">Artist</a>
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
<h1>Employee Table</h1>

<br>
<br>



<%-- 查询姓名--%>
<form action="communityServlet?temp=byDetail" method="post"
      style = "margin-left: 5%;">
    <input type="text" name="name" id = "name" placeholder= "Community Detail" style = "height: 35px; border-radius: 5px;width: 300px;background: #25b8a85c; text-align: center; font-size: 17px;"/>
    <input type="submit" style="display: none"/>
</form>

<table style = "margin-left: 5%; width: 90%;">
    <tr>
        <style>
            th{
                text-align: center;
                background-color: rgb(235, 197, 134);
            }
        </style>

        <th>Community ID</th>
        <th>Community Details</th>
        <th>Risk Level</th>
    </tr>
    <c:forEach items="${list}" var="com">
        <tr>
            <td>${com.com_id}</td>
            <td>${com.details}</td>
            <td>${com.risk_level}</td>
        </tr>
    </c:forEach>

</table>

</body>
</html>
