<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <c:if test="${param.from!=null}">
 		<c:out value="${param.from}" />
   		<c:set var="from" value="${param.from}" scope="session" />
   	   	<c:set var="to" value="${param.to}" scope="session" />
   	   	<c:set var="depart" value="${param.depart}" scope="session" />
   	   	<c:set var="people" value="${param.people}" scope="session" />
   		<c:redirect url="FlightDetail.jsp"></c:redirect>
   		
</c:if> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
  <title>Flight Search</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body >  

<div id="login-form-wrap">
  	<h2>Flight Search</h2>
			<form id="login-form"  method="post" action="search.jsp">
                <div class="row">                                                            
				                    	<div class="form-group col-lg-4 ui-widget">
				                    		<label for="from">From</label>
				                        	<input required type="text" name="from" placeholder="Departure City..." class="form-control" id="from" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;">                                                                
				                        </div>
				                        <div class="form-group col-lg-4 ui-widget">
				                        	<label for="to">To</label>
				                        	<input required type="text" name="to" placeholder="Destination City..." class="form-control" id="to" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;">
				                        </div>
				                    		<label for="depart">Departure Date</label>
				                        	<input required type="date" name="depart" class="form-control" id="depart" >											
				                        </div>
									
									<div class="row">
				                   
				                        <div class="form-group col-lg-4">
				                        	<label for="people">No. of People</label>
				                        	<input required type="number" min="1" max="4" placeholder="Number of People.." name="people" class="form-control" id="people" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;">
				                        </div>

                 </div>
                 <div class="form-btns">
											<button  type="submit" style="" class="btn col-xs-5 col-md-5">Search Flights</button>
				</div>
            </form>
</div>
  </body>
</html>