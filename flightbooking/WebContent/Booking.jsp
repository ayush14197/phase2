<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/flight"  
     user="root"  password="root"/>   
     
<c:if test="${param.submit!=null}">
 <sql:update dataSource = "${db}" var = "count">
         INSERT INTO PassengerDetails VALUES (?, ?,?,?,?,?,?,?,?);
         <sql:param value = "${param.emailid}" />
         <sql:param value = "${param.FullName}" />
         <sql:param value = "${param.Address}" />
         <sql:param value = "${param.Age}" />
         <sql:param value = "${param.mobile}" />
         <sql:param value = "${sessionScope.people}" />
         <sql:param value = "${param.id}" />
         <sql:param value = "${param.idNo}" />
         <sql:param value = "${param.country}" />
    </sql:update>
      <c:if test="${count<1}">  
     		<c:out value = "Task Failed"/>
  		</c:if>  
  	  <c:if test="${count==1}">
  	  		<c:set var="emailid" value="${param.emailid}" scope="session" />
     		<c:redirect url="Summary.jsp"/>  
  	  </c:if>   
   				 
           
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
  <title>Passenger Details</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>

<h2>Flight Details</h2>
		 <form id="login-form" method="post" action="Booking.jsp"> 
		 
		 	
					<table border="2" width="100%">  
						<tr> 
						<th>Full Name</th>  
						<th>Address</th>  
						<th>Age</th>  
						<th> mobile</th>  
						<th>email id</th>
						<th>ID Type</th>
						<th>ID No</th>
						<th>country</th>
						</tr>  
							
									<tr>  
									
										<td><input required name="FullName" id="FullName" ></td>  
										<td><input required  name="Address" id="Address"></td>  
										<td><input required name="Age" id="Age" ></td>  
										<td><input required name="mobile" id="mobile" ></td>  
										<td><input  required name="emailid" id="emailid"></td>
										<td><select required name="id" class="form-control" id="id" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;">
											<option value="Addhar card" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;"> Addhar card</option>
											<option value="Passport" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;"> Passport</option>
											<option value="Driving license" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;"> Driving license </option>											
											<option value="SSN" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;"> SSN</option>
											<option value="Voter ID" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;"> Voter ID</option>
											</select></td>
										<td><input required name="idNo" id="idNo" ></td>
										<td><input required name="country" id="country"></td>										
									</tr>  
						</table> 
					<div class="form-btns" class="btn col-xs-5 col-md-5">
											<button  type="submit" name="submit" id="submit" style="" >Submit Details</button>
					</div>
				
			</form>

</body>
</html>