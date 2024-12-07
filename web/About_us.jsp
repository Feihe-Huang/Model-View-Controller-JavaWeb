<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>About Us</title>
<link rel="stylesheet" href="css/frontpage.css">
</head>
<body>
<style>
body { 
     background: url('https://images.fineartamerica.com/images-medium-large-5/freedom-abstract-art-jaison-cianelli.jpg') no-repeat center center fixed;    
     background-size:cover;  
} 
p{
font-size: x-large;
colour: red;
}
</style>

<div class="navbar">
  <a href="#">Home</a>

  <div class="dropdown1">
    <button class="dropbtn1">Characters</button>
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
    <button class="dropbtn1">Sign up
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content1">
      <a href="index.jsp">User</a>
      <a>Admin</a>
    </div>
  </div>
  <div class="dropdown1">
    <button class="dropbtn1">Log in
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content1">
      <a href="user.jsp">User</a>
      <a href="Admin.jsp">Admin</a>
    </div>
  </div>
  <a href="About_us.jsp">About Us</a>
</div>

<h1>Online Shopping</h1>

<br>
<br>

<p style="margin-left: 10%; width: 80%; line-height: 2em"><b>
  We are software engineering students from Beijing University of Technology. We are committed to building a convenient and functional online shopping mall management system, which will include a variety of role types such as customers, staff, manufacturers, communities, etc. We can implement database functions such as adding data, modifying data, single query data, multi-table querys, as well as special features such as like and preview products.
  </b></p>
</body>
</html>