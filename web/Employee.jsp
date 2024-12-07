
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

    </a>
</div>

<h1>Employee Table</h1>
<br>
<br>


<%-- 查询姓名--%>
<form action="employeeServlet?temp=byName" method="post" style = "margin-left: 5%;">

    <input type="text" name="name" id = "name" placeholder= "Search Employee Name" style = "height: 35px; border-radius: 5px;width: 300px;background: #25b8a85c; text-align: center; font-size: 17px;"
           ng-keypress="getkeys($event)" ng-model="newMessageContent"/>
    <input type="submit" style = "display:none"/>
</form>
<script>
    $scope.getkeys = function (event) {
        if(event.keyCode == 13){
            $scope.sendMessage( $scope.newMessageContent );
        }
    }
</script>


<table style = "margin-left: 5%; width: 90%; box-shadow: 1px 1px 8px;">
    <tr>
        <style>
            th{
                text-align: center;
                background-color: rgb(235, 197, 134);
            }
        </style>
        <th>Employee ID</th>
        <th>Employee Name</th>
        <th>Gender</th>
        <th>Telephone Number</th>
        <th>Community Number</th>
        <th>Team Number</th>
        <th>Performance</th>
        <th>Salary</th>
        <th>Can Comment</th>
        <th>Is Leader</th>
        <th>Can Edit</th>
        <th>Likes Received</th>
        <th>Operations</th>
    </tr>
    <c:forEach items="${list}" var="e">
        <tr>
            <style>
                td{
                    text-align: center;
                }
            </style>
            <%--  这里必须要写成getID（） --%>
            <td>${e.getID()}</td>
            <td>${e.name}</td>
            <td>${e.gender}</td>
            <td>${e.tel}</td>
            <td>${e.communityno}</td>
            <td>${e.teamno}</td>
            <td>${e.performance}</td>
            <td>${e.salary}</td>
            <td>${e.commenting}</td>
            <td>${e.leader}</td>
            <td>${e.editing}</td>
            <td>${e.likes}
                <a href ="employeeServlet?temp=toLike&id=${e.getID()}">
                    <span style = "color:red; float: right;">❤</span>
                </a>
            </td>
            <td>
                <a href="employeeServlet?temp=toUpdate&id=${e.getID()}">✐</a>
                <a href="employeeServlet?temp=delete&id=${e.getID()}" style="color:red">✘</a>
            </td>
        </tr>
    </c:forEach>

</table>

<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(function(){
        window.location.href="employeeServlet?temp=getAll";
    })
</script>

</body>
</html>
