<%--
  Created by IntelliJ IDEA.
  User: mingw
  Date: 2022/6/4
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>Update Employee Information</title>
    <link rel="stylesheet" href="css/frontpage.css">
</head>
<body>
<div class = "user">
    <header class = "user__header">
        <h2>Edit Employee Information</h2>
    </header>
    <form action = "employeeServlet?temp=updating" method = "post" class = "form">
        <input type="hidden" id="id" name="id" value="${e.getID()}"}/>
        <div class="form__group">
            <p>Employee Name:
                <input type="text" name="name"  id="name" value="${e.name}"/>
            </p>
        </div>
        <div class="form__group">
            <p>Gender:
                <select name = "gender" id = "gender">
                    <option value="Male" <c:if test='${e.gender == "Male"}'>selected</c:if>>Male</option>
                    <option value="Female" <c:if test='${e.gender == "Female"}'>selected</c:if>>Female</option>
                </select>
            </p>
        </div>
        <div class="form__group">
            <p>Telephone Number:
                <input type="text" name="tel"  id="tel" value="${e.tel}"/>
            </p>
        </div>
        <div class="form__group">
            <p>Community Number:
                <input type="text" name="communityno"  id="communityno"
                       value="${e.communityno}"/>
            </p>
        </div>
        <div class="form__group">
            <p>Team Number:
                <select name = "teamno" id = "teamno">
                    <option value= "1" <c:if test='${e.teamno == "1"}'>selected</c:if>>1</option>
                    <option value= "2" <c:if test='${e.teamno == "2"}'>selected</c:if>>2</option>
                    <option value= "3" <c:if test='${e.teamno == "3"}'>selected</c:if>>3</option>
                    <option value= "4" <c:if test='${e.teamno == "4"}'>selected</c:if>>4</option>
                    <option value= "5" <c:if test='${e.teamno == "5"}'>selected</c:if>>5</option>
                    <option value= "6" <c:if test='${e.teamno == "6"}'>selected</c:if>>6</option>
                    <option value= "7" <c:if test='${e.teamno == "7"}'>selected</c:if>>7</option>
                </select>
            </p>
        </div>
        <div class="form__group">
            <p>Performance:
                <input type="text" name="performance" id = "performance"
                       value = "${e.performance}"/>
            </p>
        </div>
        <div class="form__group">
            <p>Salary:
                <input type="text" name="salary" id = "salary"
                       value = "${e.performance}"/>
            </p>
        </div>
        <div class="form__group">
            <p>Can Comment:
                <select name = "commenting" id = "commenting">
                    <option value="true" <c:if test='${e.commenting == "true"}'>selected</c:if>>Yes</option>
                    <option value="false" <c:if test='${e.commenting == "false"}'>selected</c:if>>No</option>
                </select>
            </p>
        </div>
        <div class="form__group">
            <p>Is Leader or Not:
                <select name = "leader" id = "leader">
                    <option value="true" <c:if test='${e.leader == "true"}'>selected</c:if>>Yes</option>
                    <option value="false" <c:if test='${e.leader == "false"}'>selected</c:if>>No</option>
                </select>
            </p>
        </div>
        <div class="form__group">
            <p>Can Edit:
                <select name = "editing" id = "editing">
                    <option value="true" <c:if test='${e.editing == "true"}'>selected</c:if>>Yes</option>
                    <option value="false" <c:if test='${e.editing == "false"}'>selected</c:if>>No</option>
                </select>
            </p>
        </div>
        <input type="hidden" id="likes" name="likes" value="${e.likes}"}/>
        <a href = "employee.jsp">
            <input class = "btn" type="submit" id="btn" value="Save"/>
        </a>


    </form>

</div>



<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(function(){
        //表单验证
        $("form").submit(function(){
            if (checkname()){
                return true;
            }else{
                return false;
            }
        })

        function checkname(){
            var name=$("#name").val();
            if (name=="") {
                alert("Employee must have name");
                return false;
            }
            return true;
        }
    })
</script>
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

    :focus {
        background: darken(#fff, 3%);
    }
    }



    .btn {
        display: block;
        width: 100%;
        padding: 20px;
        font-family: $font-family;
        -webkit-appearance: none;
        outline: 0;
        border: 0;
        color: black;
        background: $color-primary;
        transition: 0.3s;

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


</body>
</html>

