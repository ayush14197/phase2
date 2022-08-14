<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/flight"  
     user="root"  password="root"/>   
     
<c:if test="${param.uid!=null}">
<sql:query dataSource="${db}" var="records">
    select count(*)from Admin_Login where user_id=? and password=?
   <sql:param value="${param.uid}"/>
   <sql:param value="${param.psw}"/>
</sql:query>
   <c:if test="${records.rowsByIndex[0][0]==1}">
   	<c:set var="session" value="${param.uid}" scope="session" />
       <c:redirect url="AllDetails.jsp"></c:redirect>
   </c:if>
   <c:if test="${records.rowsByIndex[0][0]==0}">
   		<fieldset>
   			<caption>Error: </caption>
   			<font color="red">Invalid Credentials</font>
   		</fieldset>
   </c:if>
   </c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
  <title>Login Form</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>

	   
  <div id="login-form-wrap">
  	<h2>Admin Login</h2>
			<form id="login-form" method="get" action="adminlogin.jsp">
                <div class="form-control">
                    <label class="required" for="username">Email</label>
                    <input required type="email" name="uid" id="uid" placeholder="Enter Email">
                </div>
                <div class="form-control">
                    <label class="required" for="password">Password</label>
                    <input required type="password" name="psw" id="psw" placeholder="Enter Password">
                </div>
                <div class="form-btns">
                    <button type="submit" name="login" class="btn w-100" >Login</button>
                </div>
            </form>
        	<div id="create-account-wrap">

  			</div>
</div>
</body>
</html>