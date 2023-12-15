 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.Functionality"%>
<%@page import="Dao.CreateConnnection"%>
<%-- <%@page import="com.quinnox.mom.Beans.*"%> --%>
<%@page import="java.lang.Integer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html lang="en">
<!-- <link href="css/A4.css" rel="stylesheet" id="bootstrap-css">
<link href="css/A2.css" rel="stylesheet" id="bootstrap-css">
<link href="css/A3.css" rel="stylesheet" id="bootstrap-css"> -->
<head>	
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Dashboard</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="assets/css/paper-dashboard.css" rel="stylesheet" />


<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="assets/css/demo.css" rel="stylesheet" />


<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="assets/css/themify-icons.css" rel="stylesheet">

</head>
<style>
input[type=text], select, input[type=date] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}
.autocomplete {
  position: relative;
  display: inline-block;
}
.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
</style>
<body>
	<c:set var="admin_id" scope="session" value="${employee}" />
	<%-- <c:choose>
  <c:when test="${admin_id!=null}"> --%>

	<div class="wrapper">
		<div class="sidebar" data-background-color="white"
			data-active-color="danger">

			<!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="home.jsp" class="simple-text"> JustFly Airways </a>
				</div>

				<ul class="nav">
					<li class="active"><a href="dashboard.html"> <i
							class="ti-panel"></i>
							<p>Search Flights</p>
					</a></li>
					<li><a href="mybookings.jsp"> <i class="ti-user"></i>
							<p>Your bookings</p>
					</a></li>

					<li><a href="cancelticket.jsp"> <i class="ti-text"></i>
							<p>Cancel Tickets</p>
					</a></li>

				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
							<span class="icon-bar bar3"></span>
						</button>
						<a class="navbar-brand" href="#">Dashboard</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="Logout">LOGOUT <i class="ti-panel"></i>

							</a>
					</div>
			</nav>


			<div class="content" >
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-3 col-sm-6">
							<div class="card">
								<div class="content" style="width: 150px">
									<div class="row" >
										<div class="col-xs-5">
											<div class="icon-big icon-warning text-center">
												<i class="ti-server"></i>
											</div>
										</div>
										<div class="col-xs-7">
											<div class="numbers">
												<p>Hi</p>
												<% if(session.getAttribute("userId")!=null){
 				 String userId=(String)session.getAttribute("userId");
    				String userName=Functionality.getUserName(userId);
    				out.println(userName);}%>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>



					</div>
					<div class="row">

						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">Search your Flight:</h4>
									<form action="searchServlet" method="post" autocomplete="off">
									<div class="autocomplete" style="width:450px;">
									<br> <input type="text" name="from" placeholder="From" id="from"
										required /></div> 
										<div class="autocomplete" style="width:450px" >
										<input type="text" name="to" placeholder="To" id="to"
										required="required"></div>
										
										<br>
										 <b>Depart:</b> <input type="date"
										name='date' required="required" /> <b>Class:</b>
										 <select
										name="clas" required="required">
										<option value="Economy">Economy</option>
										<option value="Business">Business</option>
										<option value="First class">First Class</option>
									</select>
									<input type="submit" value="Search">
								</form>
								</div>
								

								<script type="text/javascript" src="js/loader.js"></script>




							</div>
							<div class="content">
								<div id="chartHours" class="ct-chart"></div>
								<div class="footer">

									<hr>

								</div>
							</div>
						</div>
					</div>
				</div>



				<footer class="footer">
					<div class="container-fluid">
						<nav class="pull-left"></nav>

					</div>
					</footer>
			</div>
			

		</div>
	</div>
	<%-- </c:when>
<c:when test="${admin_id==null}">
<%response.sendRedirect("login.jsp");%>

</c:when>

</c:choose>
 --%>
</body>
<script>
function autocomplete(inp, arr) {
	  /*the autocomplete function takes two arguments,
	  the text field element and an array of possible autocompleted values:*/
	  var currentFocus;
	  /*execute a function when someone writes in the text field:*/
	  inp.addEventListener("input", function(e) {
	      var a, b, i, val = this.value;
	      /*close any already open lists of autocompleted values*/
	      closeAllLists();
	      if (!val) { return false;}
	      currentFocus = -1;
	      /*create a DIV element that will contain the items (values):*/
	      a = document.createElement("DIV");
	      a.setAttribute("id", this.id + "autocomplete-list");
	      a.setAttribute("class", "autocomplete-items");
	      /*append the DIV element as a child of the autocomplete container:*/
	      this.parentNode.appendChild(a);
	      /*for each item in the array...*/
	      for (i = 0; i < arr.length; i++) {
	        /*check if the item starts with the same letters as the text field value:*/
	        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
	          /*create a DIV element for each matching element:*/
	          b = document.createElement("DIV");
	          /*make the matching letters bold:*/
	          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
	          b.innerHTML += arr[i].substr(val.length);
	          /*insert a input field that will hold the current array item's value:*/
	          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
	          /*execute a function when someone clicks on the item value (DIV element):*/
	          b.addEventListener("click", function(e) {
	              /*insert the value for the autocomplete text field:*/
	              inp.value = this.getElementsByTagName("input")[0].value;
	              /*close the list of autocompleted values,
	              (or any other open lists of autocompleted values:*/
	              closeAllLists();
	          });
	          a.appendChild(b);
	        }
	      }
	  });
	  /*execute a function presses a key on the keyboard:*/
	  inp.addEventListener("keydown", function(e) {
	      var x = document.getElementById(this.id + "autocomplete-list");
	      if (x) x = x.getElementsByTagName("div");
	      if (e.keyCode == 40) {
	        /*If the arrow DOWN key is pressed,
	        increase the currentFocus variable:*/
	        currentFocus++;
	        /*and and make the current item more visible:*/
	        addActive(x);
	      } else if (e.keyCode == 38) { //up
	        /*If the arrow UP key is pressed,
	        decrease the currentFocus variable:*/
	        currentFocus--;
	        /*and and make the current item more visible:*/
	        addActive(x);
	      } else if (e.keyCode == 13) {
	        /*If the ENTER key is pressed, prevent the form from being submitted,*/
	        e.preventDefault();
	        if (currentFocus > -1) {
	          /*and simulate a click on the "active" item:*/
	          if (x) x[currentFocus].click();
	        }
	      }
	  });
	  function addActive(x) {
	    /*a function to classify an item as "active":*/
	    if (!x) return false;
	    /*start by removing the "active" class on all items:*/
	    removeActive(x);
	    if (currentFocus >= x.length) currentFocus = 0;
	    if (currentFocus < 0) currentFocus = (x.length - 1);
	    /*add class "autocomplete-active":*/
	    x[currentFocus].classList.add("autocomplete-active");
	  }
	  function removeActive(x) {
	    /*a function to remove the "active" class from all autocomplete items:*/
	    for (var i = 0; i < x.length; i++) {
	      x[i].classList.remove("autocomplete-active");
	    }
	  }
	  function closeAllLists(elmnt) {
	    /*close all autocomplete lists in the document,
	    except the one passed as an argument:*/
	    var x = document.getElementsByClassName("autocomplete-items");
	    for (var i = 0; i < x.length; i++) {
	      if (elmnt != x[i] && elmnt != inp) {
	        x[i].parentNode.removeChild(x[i]);
	      }
	    }
	  }
	  /*execute a function when someone clicks in the document:*/
	  document.addEventListener("click", function (e) {
	      closeAllLists(e.target);
	  });
	}

	/*An array containing all the country names in the world:*/
	var cities = ["Ahmedabad","Allahabad","Aurangabad","Bangalore","Bellary","Bhubaneswar","Bhopal","Chandigarh","Chennai","Lucknow","Ludhiana","Mangalore","Ranchi","Mumbai","Kochi","Goa","Indore","Hubli","Hyderabad","New Delhi","Pune","Kolkata","Patna","Amritsar","Jaipur","Nagpur","Chicago","London","California","Miami","Singapore"];

	/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
	autocomplete(document.getElementById("from"), cities);
	autocomplete(document.getElementById("to"), cities);
	

</script>



</html>
