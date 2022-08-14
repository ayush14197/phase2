<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/flight"  
     user="root"  password="root"/>   
     
<c:if test="${param.register!=null}">
	 <sql:update dataSource = "${db}" var = "count">
         INSERT INTO User_Login VALUES (?, ?);
         <sql:param value = "${param.uid}" />
         <sql:param value = "${param.psw}" />
      </sql:update>
      <c:if test="${count<1}">  
     		<c:out value = "Registration Failed"/>
  		</c:if>  
  	  <c:if test="${count==1}">
     		<c:redirect url="userlogin.jsp"/>  
  	  </c:if>  
   			
           
</c:if>
                                             
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
  <title>Register Form</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>

<div id="login-form-wrap">
  	<h2>Register</h2>
			<form id="login-form" method="get" action="Register.jsp">
                <div class="form-control">
                    <label class="required" for="username">Email</label>
                    <input required type="email" name="uid" id="uid" placeholder="Enter Email">
                </div>
                <div class="form-control">
                    <label class="required" for="password">Password</label>
                    <input required type="password" name="psw" id="psw" placeholder="Enter Password">
                </div>
                <div class="form-btns" >
                    <button type="submit" value="Register" name="register" id="register" class="btn w-100" >Register</button>
                </div>
            </form>
            <div id="create-account-wrap">
    			
  			</div>
		</div>
</body>
</html>