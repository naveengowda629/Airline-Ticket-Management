<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>JustFly Airways | Login </title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Simple Login and Signup Form web template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<link href="css1/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js1/jquery-1.9.1.min.js"></script>
<!--// js -->
<link rel="stylesheet" type="text/css" href="css1/easy-responsive-tabs.css " />
 <link href="//fonts.googleapis.com/css?family=Questrial" rel="stylesheet">
</head>
<body class="bg agileinfo">
   <h1 class="agile_head text-center"> Welcome to JustFly </h1>
   <div class="w3layouts_main wrap">
    <!--Horizontal Tab-->
        <div id="parentHorizontalTab_agile">
            <ul class="resp-tabs-list hor_1">
                <li>LogIn</li>
                <li>Register</li>
            </ul>
            <div class="resp-tabs-container hor_1"><!--  w3_agile_login-->
               <div class="agile_its_registration">
                    <form action="logincheck" method="post" class="agile_form">
					  <p>User Id</p>
					   <input type='text' name="userid" required="required" />
					  <p>Password</p>
					  <input type="password" name="password" required="required" class="password" /> 
					  <div class="check">
						<!-- 	<label class="checkbox w3l"><input type="checkbox" name="checkbox" required="required"><i> </i>I accept the terms and conditions</label> -->
					 </div>
					  <input type="submit" value="LogIn" class="agileinfo" />
					</form>
					 <div class="login_w3ls"><span style="color:red;">
				        <% if(session.getAttribute("error")!=null){
				        	String msg=(String)session.getAttribute("error");
				        	out.print(msg);
				        	session.setAttribute("error",null);				        		
				        }	
				        	%></span>
				        
					 </div>
                    
                </div>
                <div class="agile_its_registration">
                    <form action="CreateUserServlet" method="post" class="agile_form">
					  <p>Enter your name</p>
					  <input type="text" name="name" required="required" />
					  <p>Email id/Mobile No.</p>
					  <input type="email" name="userid" required="required"/>
					  <p>Password</p>
					  <input type="password" name="password" id="password1"  required="required">
					  <p>Confirm Password</p>
					  <input type="password" name="Confirm Password" id="password2"  required="required">
         	  			<div class="check w3_agileits">
							<input type="checkbox" name="checkbox" required="required" ><i> </i>I accept the terms and conditions
						</div>
					   <input type="submit" value="Signup"/>
					   <input type="reset" value="Reset" />
					</form> 
				</div>
            </div>
        </div>
		 <!-- //Horizontal Tab -->
    </div>
	<div class="agileits_w3layouts_copyright text-center">
			<p> All rights reserved </p>
	</div>
<!--tabs-->
<script src="js1/easyResponsiveTabs.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//Horizontal Tab
	$('#parentHorizontalTab_agile').easyResponsiveTabs({
		type: 'default', //Types: default, vertical, accordion
		width: 'auto', //auto or any width like 600px
		fit: true, // 100% fit in a container
		tabidentify: 'hor_1', // The tab groups identifier
		activate: function(event) { // Callback function if tab is switched
			var $tab = $(this);
			var $info = $('#nested-tabInfo');
			var $name = $('span', $info);
			$name.text($tab.text());
			$info.show();
		}
	});
});
</script>
<script type="text/javascript">
		window.onload = function () {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;
		}
		function validatePassword(){
			var pass2=document.getElementById("password2").value;
			var pass1=document.getElementById("password1").value;
			if(pass1!=pass2)
				document.getElementById("password2").setCustomValidity("Passwords Don't Match");
			else
				document.getElementById("password2").setCustomValidity('');	 
				//empty string means no validation error
		}

</script>
<!--//tabs-->
</body>
</html>