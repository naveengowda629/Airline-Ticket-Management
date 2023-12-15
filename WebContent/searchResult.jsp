<%-- <%@page import="com.quinnox.mom.Dao.Functionality"%>
<%@page import="com.quinnox.mom.Beans.ActionBean"%> --%>
<%@page import="Beans.FlightsBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
  background-color: #cb3904;
  color: white;
  
  margin: ;
  border: solid 1px #b93404;
  border-radius: 2px;
  
  cursor: pointer;
}
</style>
<body
	style="background-image: url('images/flight.jpg'); background-repeat: no-repeat; background-size: cover;">

	<div class="Action Table" style="color: black;">
		<h2>Search Results:</h2>
		<a href="home.jsp" >Back</a>
		<br> <br>
		<center><h6>Departure: </h6><h3><%=session.getAttribute("date") %></h3></center>
		<%
		ArrayList<FlightsBean> flightData = new ArrayList<FlightsBean>();
		flightData =(ArrayList<FlightsBean>)session.getAttribute("flightData");
		if(!flightData.isEmpty()){ 
		%>
		<div class="table-responsive">
			
				<table class="table" id="customers" border="0px"
					style="color:black;empty-cells: hide;">

					<tr>
						<th>ID</th>
						<th>Flight</th>
						<th>From</th>
						<th>To</th>
						<th>Departure</th>
						<th>Duration</th>
						<th>Price</th>
						<th>Class</th>
						<th></th>
						
					</tr>
			
					<!-- <tr style=" font-weight:bold;height: 75px;"  >
					
					<td>Imb297</td>
					<td>IndiGo</td>
					<td>adfd</td>
					<td>aflkjg</td>
					<td>15:16</td>
					<td>1.5</td>
										</tr>
										<tr style=" font-weight:bold;height:75px;"  >
					
					<td>Imb297</td>
					<td>IndiGo</td>
					<td>adfd</td>
					<td>aflkjg</td>
					<td>15:16</td>
					<td>1.5</td>
										</tr> -->
					

					<%
						
						for (FlightsBean fb : flightData) {
							//int actionId = ab.getActionId();
							String fid=fb.getFid();
					%>
					 <tr style=" font-weight:bold;height: 75px;"  >
					<td><%=fb.getFid()%></td>
						<td><%=fb.getName()%></td>
						<td><%=fb.getSource().toUpperCase()%></td>
						<td><%=fb.getDest().toUpperCase()%></td>
						<td><%=fb.getDepart()%></td>
						<td><%=fb.getDuration()%></td>
						<td>Rs.<%=fb.getPrice()%></td>
						<td><%=fb.getClas()%></td>
						<td><form action="flightSelectServlet"><input type='hidden' name='fid' value=<%=fid%> />
						<input type="submit" value="Book"/></form></td> 
									
					</tr> 
					
					<%
						}
		}
		else{
					%> 
		<center> <h2>No Results Found</h2></center>
<%} %>






				</table>
				

		</div>
	</div>
	<script>
		$("select").change(function() {

			var selId=$(this).attr("id");
			$('#checkout').attr('disabled', false);
			$('#checkout').css('color', 'black');
			
			$('#hiddenDrop').attr('value',selId);
		
		});
		$("#radio").click(function(){
		var thisClass=$(this).attr("class");
		
			
			
		});
		
	</script>
</body>
</html>