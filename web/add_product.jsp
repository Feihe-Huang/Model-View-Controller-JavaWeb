<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/frontpage.css">
    <title>Select_paintings</title>
</head>
<body>

<div class="navbar">
    <a href="Admin.jsp">Home</a>

    <div class="dropdown1">
        <button class="dropbtn1">Characters<i class="fa fa-caret-down"></i></button>
        <div class="dropdown-content1">
            <a href = "Employee.jsp">Employee</a>
            <a href = "Product.jsp">Product</a>
            <a href = "producer.jsp">Producer</a>
            <a href = "Team.jsp">Team</a>
            <a href="Employee&Community.jsp">Employee and Community</a>
            <a href = "EmployeeComparison.jsp">Other</a>
        </div>
    </div>

    <div class="dropdown1">
        <button class="dropbtn1">Operations<i class="fa fa-caret-down"></i></button>
        <div class="dropdown-content1">
            <a href="add_employee.jsp">Add Employee</a>
            <a href="add_customer.jsp">Add Customer</a>
            <a href="add_producer.jsp">Add Producer</a>
            <a href="add_product.jsp">Add Product</a>
            <a href="add_community.jsp">Add Community</a>
        </div>
    </div>
    <a href="frontpage.jsp">Logout</a>

</div>

<h1>Add Product</h1>


<div class="user">
    <header class="user__header">
        <h2 class="user__title">Upload Product Info...</h2>
    </header>

    <form action="add_product.jsp" method="post" class="form" >
        <div class="form__group">
            <input type="text" placeholder="Id" name="id" required = "required" class="form__input" />
        </div>

        <div class="form__group">
            <input type="text" placeholder="Name" name="name" required = "required" class="form__input" />
        </div>

        <div class="form__group">
            <input type="text" placeholder="Price" name="price" required = "required" class="form__input" />
        </div>

        <div class="form__group">
            <input type="text" placeholder="Input" name="input"required = "required" class="form__input" />
        </div>

        <div class="form__group">
            <input type="text" placeholder="Output" name="output"required = "required" class="form__input" />
        </div>

        <div class="form__group">
            <input type="text" placeholder="Daily Sale" name="daily sale"required = "required" class="form__input" />
        </div>

        <div class="form__group">
            <input type="text" placeholder="Sale" name="sale"required = "required" class="form__input" />
        </div>

        <button class="btn" type="submit" name="Upload">Upload</button>

<% Connection conn=null;
    String url="jdbc:mysql://localhost:3306/";
    String dbName="group16?useUnicode=true&characterEncoding=utf8";
    String driver="com.mysql.jdbc.Driver";

    try{  Class.forName(driver).newInstance();
        conn = DriverManager.getConnection(url+dbName,"root", "hfh102938");
        if(request.getParameter("Upload")!= null){

            int pdt_id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            int input = Integer.parseInt(request.getParameter("input"));
            int output = Integer.parseInt(request.getParameter("output"));
            int daily_sale= Integer.parseInt(request.getParameter("daily sale"));
            int sale = Integer.parseInt(request.getParameter("sale"));
            int left = input - output;

            Class.forName(driver).newInstance();


            conn = DriverManager.getConnection(url+dbName,"root", "hfh102938");
            PreparedStatement pst =(PreparedStatement) conn.prepareStatement("insert into products values(?,?,?,?,?,?,?,?)");

            pst.setInt(1,pdt_id);
            pst.setString(2,name);
            pst.setInt(3, price);
            pst.setInt(4,input);
            pst.setInt(5,output);
            pst.setInt(6,daily_sale);
            pst.setInt(7,sale);
            pst.setInt(8,left);

            int i = pst.executeUpdate();
            String msg=" ";
            if(i!=0){
                msg="Record has been inserted";
                out.println("<font size='6' color=blue>" + msg + "</font>");
                RequestDispatcher rd=request.getRequestDispatcher("Product.jsp");
                rd.forward(request,response);


            }
            else{
                msg="failed to insert the data";
                out.println("<font size='6' color=blue>" + msg + "</font>");
            }
            pst.close();
            conn.commit();
        }
    }
    catch (Exception e){
        out.println(e);
    }

%>" </form>

<style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        /*font-family: font-family;*/
        /*font-size: font-size;*/
        background-size: 200% 100% !important;
        animation: move 10s ease infinite;
        transform: translate3d(0, 0, 0);
        background: linear-gradient(45deg, #49D49D 10%, #A2C7E5 90%);
        height: 100vh
    }

    .user {
        width: 90%;
        max-width: 340px;
        margin: 10vh auto;
    }

    .user__header {
        text-align: center;
        opacity: 0;
        transform: translate3d(0, 500px, 0);
        animation: arrive 500ms ease-in-out 0.7s forwards;
    }

    .user__title {
        font-size: $font-size;
        margin-bottom: -10px;
        font-weight: 500;
        color: white;
    }

    .form {
        margin-top: 40px;
        border-radius: 6px;
        overflow: hidden;
        opacity: 0;
        transform: translate3d(0, 500px, 0);
        animation: arrive 500ms ease-in-out 0.9s forwards;
    }

    .form--no {
        animation: NO 1s ease-in-out;
        opacity: 1;
        transform: translate3d(0, 0, 0);
    }

    .form__input {
        display: block;
        width: 100%;
        padding: 20px;
        font-family: font-family;
        -webkit-appearance: none;
        border: 0;
        outline: 0;
        transition: 0.3s;
    }




    .btn {
        display: block;
        width: 100%;
        padding: 20px;
        -webkit-appearance: none;
        outline: 0;
        border: 0;
        color: black;
    }
    &:hover {
         background: darken($color-primary, 5%);
     }
    }

    @keyframes NO {
        from, to {
            -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
        }

        10%, 30%, 50%, 70%, 90% {
            -webkit-transform: translate3d(-10px, 0, 0);
            transform: translate3d(-10px, 0, 0);
        }

        20%, 40%, 60%, 80% {
            -webkit-transform: translate3d(10px, 0, 0);
            transform: translate3d(10px, 0, 0);
        }
    }

    @keyframes arrive {
        0% {
            opacity: 0;
            transform: translate3d(0, 50px, 0);
        }

        100% {
            opacity: 1;
            transform: translate3d(0, 0, 0);
        }
    }

    @keyframes move {
        0% {
            background-position: 0 0
        }

        50% {
            background-position: 100% 0
        }

        100% {
            background-position: 0 0
        }
    }
</style>
<script>
    $('.btn').on('click', function () {
        $('.form').addClass('form--no');
    });
</script>


</form>
</body>
</html>