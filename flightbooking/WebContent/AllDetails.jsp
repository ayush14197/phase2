<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/flight"  
     user="root"  password="root"/>   
<c:if test="${sessionScope.session!=null}">

<sql:query dataSource="${db}" var="records">
     
 select fl.FlightNo,fl.FlightName, pd.email , pd.FullName, pd.seatNo ,pd.mobile,
  (pd.seatNo*fl.price) as totalprice from FlightDetails fl,PassengerDetails pd ,
  BookingDetails bd where bd.email=pd.email and bd.FlightNo=fl.FlightNo 

</sql:query>
   		
</c:if> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
  <title>All Details</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<h2>Flight Details</h2>
			<form id="login-form"  method="post" action="FlightDetail.jsp">
               <table border="2" width="100%">  
						<tr>  
						<th>Flight No</th>  
						<th>Flight Name</th>  
						<th>Email</th>  
						<th>Full Name</th>  
						<th>Passenger</th>
						<th>mobile</th>
						<th>Total price</th>
						</tr>  
							<c:forEach var="table" items="${records.rows}"> 
									<tr>  
										<td><input readonly="readonly" name="FlightNo" id="FlightNo" value="${table.FlightNo}"></td>  
										<td><input readonly="readonly" name="FlightName" id="FlightName" value="${table.FlightName}"></td>  
										<td><input readonly="readonly" name="email" id="email" value="${table.email}"></td>  
										<td><input readonly="readonly" name="FullName" id="FullName" value="${table.FullName}"></td>  
										<td><input readonly="readonly" name="Passenger" id="Passenger" value="${table.seatNo}"></td>
										<td><input readonly="readonly" name="mobile" id="mobile" value="${table.mobile}"></td>
										<td><input readonly="readonly" name="totalprice" id="totalprice" value="${table.totalprice}"></td>
										
									</tr>  
							</c:forEach>  
					</table>  
            </form>
</body>
</html>