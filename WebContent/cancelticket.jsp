<%@page import="Dao.Functionality"%>
<%@page import="Beans.BookingBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.awt.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src='js/jquery.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 0px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: ;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
input[type=submit],a {
    width: 80%;  
  background-color:red;
  color: white;
  
  margin: ;
  border: solid 1px #b93404;
  border-radius: 2px;
  
  cursor: pointer;
}
h2{
text-align: center;}
</style>
<body
	style="background-image: url('images/flight.jpg'); background-repeat: no-repeat; background-size: cover;">

	<div class="Action Table" style="color: black;">
		<h2>Your Bookings:</h2>
		<a href="home.jsp" >Back</a>
		<br> <br>
		<center><h6></h6><h3>Cancel your bookings</h3></center>
		<% ArrayList<BookingBean> bookingList= new ArrayList<BookingBean>();
		String userId=(String)session.getAttribute("userId");
		Functionality functionality=new Functionality();
		
		bookingList=functionality.getBookingList(userId);
		
		if(!bookingList.isEmpty()){ %>
		<div class="table-responsive">
			
				<table class="table" id="customers" border="0px"
					style="color:black;empty-cells: hide;">

					<tr>
					
						<th>Trip#</th>
						<th>Flight Name</th>
						<th>From</th>
						<th>To</th>
						<th>Date</th>
						<th>Departure</th>
						
						<th></th>
						
					</tr>
					
					
					<%
						
						for (BookingBean bean : bookingList) {
							//int actionId = ab.getActionId();
							int tripId=bean.getTripId();
					%>
					 <tr style=" font-weight:bold;height: 75px;"  >
						
						<td><%=tripId%></td>
						<td><%=bean.getFlightName()%></td>
						<td><%=bean.getFrom1().toUpperCase()%></td>
						<td><%=bean.getTo1().toUpperCase()%></td>
						<td><%=bean.getDate()%></td>
						<td><%=bean.getDeparture()%></td>
						
						<td><form action="CancelTicketServlet" onsubmit="return confirm('Do you really want to Cancel this trip?');" >
						<input type='hidden' name='tripId' value=<%=tripId%> />
						<input type="submit" value="Cancel" /></form></td> 
						
					
					</tr> 
					
					<%
						}
		}
		else{
					%> 
 <h2>No Bookings to Cancel</h2>
<%} %>

				</table>
				

		</div>
	</div>
	<script>
	
		
		
			
			
			
			
			
			
		
		
	</script>
</body>
</html>