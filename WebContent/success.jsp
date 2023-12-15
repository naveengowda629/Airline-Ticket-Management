<%@page import="Beans.TicketBean"%>
<%@page import="Dao.Functionality"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
</head>
<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 80%;
  height: 40%;
  border:2px dotted black;
   margin:0 auto;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 16px;
  margin:0 auto;
  background-image: url("images/clouds.jpg") ;
  color:black;
  background-repeat: no-repeat;
  
  
}
th{
font-weight: normal;
text-align: left;
}
td{
font-weight: bold;
text-align: center;
}
a:link, a:visited {
  background-color: green;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  background-color: red;
}
.center{
text-align: center;
margin: auto;
}
</style>
<body >
<div id="parentHorizontalTab_agile">
<center>
<h1 class="agile_head text-center">Flight Confirmed</h1> </center>
            <center><img alt="tick" src="images/tick.png" width='100' height="100"></center>
            <div class="card">
  
  <div class="container">
     <%int tripId=(int)session.getAttribute("tripId");
   Functionality functionality=new Functionality();
   TicketBean bean=functionality.getTicketDetails(tripId);%>
   <img src='images/barcode.png' width='200' height='50'/> <h2><%=bean.getName().toUpperCase() %></h2>

   <table  width='100%'>
   <tr>
   <th >Passenger Name</th>
   <th >Date</th>
   <th >Trip #</th>
   </tr>
   <tr>
   <td><%=bean.getName().toUpperCase() %></td>
   <td><%=bean.getDate() %></td>
   <td ><%=tripId %></td>
   </tr>
   <tr>
   <th >From</th>
   <th>Depart</th>
   </tr>
   <tr>
   <td><%=bean.getFrom1().toUpperCase()%></td>
   <td><%=bean.getDepart()%></td>
   </tr>
   <tr>
   <th>To</th>
   <th>Class</th>
   </tr>
   <tr>
   <td><%=bean.getTo1().toUpperCase()%></td>
   <td><%=bean.getKlass() %></td>
   <td></td>
   </tr>
   <tr>
   <th >Seat Number</th>
   <th >Flight #</th>
   <th>Price</th>
   </tr>
   <tr>
   <td ><%=bean.getSeats() %></td>
   <td ><%=bean.getFlightId() %></td>
   <td><%=bean.getPrice() %></td>
   </tr>
   
   </table>
   
   
  </div>
</div>
            </div>
            
            <br>
            <div class="center">
            <a href="mybookings.jsp">Go back</a><br>
            <br><button onclick="print()">Print</button><br>
            <br><a href="home.jsp">Home</a>
            </div>
			</body>
			</html>