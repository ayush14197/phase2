<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/flight"  
     user="root"  password="root"/>   
     
     
<sql:query dataSource="${db}" var="records">
    select * from PassengerDetails where email=? 
   <sql:param value="${sessionScope.emailid}"/>  		
</sql:query>
<c:if test="${param.FullName!=null}">

<sql:update dataSource = "${db}" var = "count1">
         update FlightDetails set BookedSeat =? where FlightNo=?;
         <sql:param value = "${sessionScope.BookedSeat + sessionScope.people}" />
         <sql:param value = "${sessionScope.FlightNo}" />
    </sql:update>
    
 
 <sql:update dataSource = "${db}" var = "count">
         INSERT INTO BookingDetails(email,FlightNo) VALUES (?, ?);
         <sql:param value = "${sessionScope.emailid}" />
         <sql:param value = "${sessionScope.FlightNo}" />
    </sql:update>
      <c:if test="${count<1}">  
     		<c:out value = "Task Failed"/>
  		</c:if>  
  	  <c:if test="${count==1}">
  	  		<c:set var="emailid" value="${param.emailid}" scope="session" />
     		<c:redirect url="Payment.jsp"/>  
  	  </c:if>   
  	  
  	  
  
   				 
           
</c:if> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Summary </title>

<body>
	<h1>Summary </h1>
			 <form method="post" action="Summary.jsp"> 
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
						<th>No of Seats</th>
						<th>Total Payment</th>
						</tr>  
							<c:forEach var="table" items="${records.rows}"> 
									<tr>  
									
										<td><input readonly="readonly" name="FullName" id="FullName" value="${table.FullName}"></td>  
										<td><input readonly="readonly"  name="Address" id="Address" value="${table.Address}"></td>  
										<td><input readonly="readonly" name="Age" id="Age" value="${table.Age}"></td>  
										<td><input readonly="readonly" name="mobile" id="mobile" value="${table.mobile}"></td>  
										<td><input readonly="readonly"  name="emailid" id="emailid" value="${table.email}"></td>
										<td><input readonly="readonly" name="idNo" id="idNo" value="${table.idtype}"></td>
										<td><input readonly="readonly" name="idNo" id="idNo" value="${table.idNo}"></td>
										<td><input readonly="readonly" name="country" id="country" value="${table.country}"></td>	
										<td><input readonly="readonly" name="seat" id="seat" value="${table.seatNo}"></td>
										<td><input readonly="readonly" name="seat" id="seat" value="${sessionScope.totalprice}"></td>									
																			
									</tr> 
									
							</c:forEach>  
							 
						</table> 
						
						<div >
											<button  type="submit" name="Payment" style="" class="btn col-xs-5 col-md-5">Payment</button>

						</div>
			</form>
</head>


</body>
</html>