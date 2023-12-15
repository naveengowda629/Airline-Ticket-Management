<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>Seats</title>
    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Movie Seat Selection a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta-Tags -->
    <!-- Index-Page-CSS -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <!-- //Custom-Stylesheet-Links -->
    <!--fonts -->
    <link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
    <!-- //fonts -->
</head>
<style>
input[type=submit] {
  width: 100%;
  background-color: #cb3904;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight:bold;
}
</style>
<body onload="onLoaderFunc()">
    <h1>Select your seats</h1>
    <div class="container">

        <div class="w3ls-reg">
            <!-- input fields -->
            <div class="inputForm">
                <h2 style="color:red;">Fill the required details below and select your seats</h2>
                <div class="mr_agilemain">
                    <div class="agileits-left">
                        <label> Name
                            <span>*</span>
                        </label>
                        <input type="text" name='name' id="Username" required>
                    </div>
                    <div class="agileits-right">
                        <label> Number of Seats
                            <span>*</span>
                        </label>
                        <input type="number" id="Numseats" name='nos' required min="1">
                    </div>
                </div>
                <button onclick="takeData()">Start Selecting</button>
            </div>
            <!-- //input fields -->
            <!-- seat availabilty list -->
            <ul class="seat_w3ls">
                <li class="smallBox greenBox">Selected Seat</li>

                <li class="smallBox redBox">Reserved Seat</li>

                <li class="smallBox emptyBox">Empty Seat</li>
            </ul>
            <!-- seat availabilty list -->
            <!-- seat layout -->
            <div class="seatStructure txt-center" style="overflow-x:auto;">
                <table id="seatsBlock">
                    <p id="notification"></p>
                    <tr>
                        <td></td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td></td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                        <td>9</td>
                        <td>10</td>
                       
                    </tr>
                    <tr>
                        <td>A</td>
                        <td>
                            <input type="checkbox" class="seats" value="A1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A5">
                        </td>
                        <td class="seatGap"></td>
                        <td>
                            <input type="checkbox" class="seats" value="A6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A10">
                        </td>
                        
                    </tr>

                    <tr>
                        <td>B</td>
                        <td>
                            <input type="checkbox" class="seats" value="B1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B5">
                        </td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="B6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B10">
                        </td>
                       
                    </tr>

                    <tr>
                        <td>C</td>
                        <td>
                            <input type="checkbox" class="seats" value="C1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C5">
                        </td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="C6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C10">
                        </td>
                        
                    </tr>

                    <tr>
                        <td>D</td>
                        <td>
                            <input type="checkbox" class="seats" value="D1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D5">
                        </td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="D6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D10">
                        </td>
                        
                    </tr>

                    <tr>
                        <td>E</td>
                        <td>
                            <input type="checkbox" class="seats" value="E1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E5">
                        </td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="E6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E10">
                        </td>
                        
                    </tr>

                    <tr class="seatVGap"></tr>
                </table>

                <div class="screen">
                    <h2 class="wthree">Exit this way</h2>
                </div>
                <button onclick="updateTextArea()">Confirm Selection</button>
            </div>
            <!-- //seat layout -->
            <!-- details after booking displayed here -->
            <div class="displayerBoxes txt-center" style="overflow-x:auto;">
			<form action='bookingServlet' method='post'>
                <table class="Displaytable w3ls-table" width="100%">
                    <tr>
                        <th>Name</th>
                        <th>Number of Seats</th>
                        <th>Seats</th>
                    </tr>
                    <tr>
                        <td>
                            <textarea id="nameDisplay"></textarea>
							<input type='hidden' id="nameDisplay1" name="name" class="hidden" value=""/>
                        </td>
                        <td>
                            <textarea id="NumberDisplay"></textarea>
							<input type='hidden' id="NumberDisplay1" name="nofseats" class="hidden" value=""/>
                        </td>
                        <td>
                            <textarea id="seatsDisplay"></textarea>
							<input type='hidden' id="seatsDisplay1" name="seats" class="hidden" value=""/>
							
                        </td>
                    </tr>
                </table>
				<input type='submit' value='Book Now' id='book' disabled/>
				</form>
            </div>
            <!-- //details after booking displayed here -->
        </div>
    </div>
    <div class="copy-wthree">
        <p>© JustFly Airways | All Rights Reserved 
            
        </p>
    </div>
    <!-- js -->
    <script src="js/jquery-2.2.3.min.js"></script>
    <!-- //js -->
    <!-- script for seat selection -->
    <script>
        function onLoaderFunc() {
            $(".seatStructure *").prop("disabled", true);
            $(".displayerBoxes *").prop("disabled", true);
        }

        function takeData() {
            if (($("#Username").val().length == 0) || ($("#Numseats").val().length == 0)) {
                alert("Please Enter your Name and Number of Seats");
            } else {
                $(".inputForm *").prop("disabled", true);
                $(".seatStructure *").prop("disabled", false);
                document.getElementById("notification").innerHTML =
                    "<b style='margin-bottom:0px;background:#ff9800;letter-spacing:1px;'>Please Select your Seats NOW!</b>";
            }
        }


        function updateTextArea() {

            if ($("input:checked").length == ($("#Numseats").val())) {
                $(".seatStructure *").prop("disabled", true);

                var allNameVals = [];
                var allNumberVals = [];
                var allSeatsVals = [];

                //Storing in Array
                allNameVals.push($("#Username").val());
                allNumberVals.push($("#Numseats").val());
                $('#seatsBlock :checked').each(function () {
                    allSeatsVals.push($(this).val());
                });

                //Displaying 
                $(".hidden").prop("disabled", false);
                
                $('#nameDisplay').val(allNameVals);
                $('#nameDisplay1').val(allNameVals);
               
                $('#NumberDisplay').val(allNumberVals);
                $('#NumberDisplay1').val(allNumberVals);
                $('#seatsDisplay').val(allSeatsVals);
                $('#seatsDisplay1').val(allSeatsVals);
				$("#book").prop("disabled", false);
				
				
            } else {
                alert("Please select " + ($("#Numseats").val()) + " seats")
            }
        }


        function myFunction() {
            alert($("input:checked").length);
        }

        /*
        function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for(var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }
        */


        $(":checkbox").click(function () {
            if ($("input:checked").length == ($("#Numseats").val())) {
                $(":checkbox").prop('disabled', true);
                $(':checked').prop('disabled', false);
            } else {
                $(":checkbox").prop('disabled', false);
            }
        });
    </script>
    <!-- //script for seat selection -->
	

</body>

</html>