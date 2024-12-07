
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
      <a href="index1.jsp">User</a>
      <a href="index1.jsp">Admin</a>
    </div>
  </div>
  <a href="frontpage.jsp">Logout</a>

</div>
<h1>Product Table</h1>

<br>
<br>

<%-- 查询姓名--%>
<form action="productServlet?temp=byName" method="post"
      style = "margin-left: 5%;">
  <input type="text" name="name" id = "name" placeholder= "Product Name" style = "height: 35px; border-radius: 5px;width: 300px;background: #25b8a85c; text-align: center; font-size: 17px;"/>
  <input type="submit" style="display: none" />
</form>

<table style = "margin-left: 5%; width: 90%;">
  <tr>
    <style>
      th{
        text-align: center;
        background-color: rgb(235, 197, 134);
      }
    </style>
    <th>Product ID</th>
    <th>Product Name</th>
    <th>Price</th>
    <th>Input Number</th>
    <th>Output Number</th>
    <th>Daily Sale</th>
    <th>Sale</th>
    <th>Left Number</th>
  </tr>
  <c:forEach items="${list}" var="p">
    <tr>
      <td>${p.getPdtno()}</td>
      <td>${p.name}</td>
      <td>${p.price}</td>
      <td>${p.input}</td>
      <td>${p.output}</td>
      <td>${p.daily_sale}</td>
      <td>${p.sale}</td>
      <td>${p.left}</td>

    </tr>
  </c:forEach>

</table>

</body>
</html>
