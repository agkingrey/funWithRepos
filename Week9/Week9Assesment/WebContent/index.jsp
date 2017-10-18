<%-- Austin Kingrey 10/17
WHat I have learned over the last few weeks, in a nice format for me
to show others later.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Week9AssesmentPage</title>
</head>
<body>
 <div>
 	<%--Some basic JQUERY Week 5 --%>
	<form>
		<label id="lbl1">This is Test 1</label>
		<br>
		<label id="lbl2">This is Test 2</label>
		<br>
		<label id="lbl3">This is Test 3</label>
		<br>
	</form>
  </div>
  <%--This button will show a box of text after you click the button --%>
  <div>
  <button id="showText">Show My Text</button>
  </div>
  <div id="textGettingShown" style="background-color:blue;display:none;">
  	Hello There Friends.
  </div>
  <form>
  <%--This is where you enter your name, and ajax will process it to the server, then give it back in a printwrite --%>
  	Name <input type="text" id="name">
  	<input type="button" value="Ajax Button" id="btnAjax">
  	<br>
  	<span id="result1"></span>
  </form>

<%--Here is my ajax portion(week6) --%>
<%--I added the the jquery straight from the a cdn, that way others can use this easier --%>  
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"></script>
<script>
	$(function(){
		$("#lbl1").delay(1000).hide(300).show(300);
		
		$("#lbl2").css({color:"red"});
		
		$("#lbl3").fadeOut(1000);
		
		$("#showText").click(function() {
		$("#textGettingShown").toggle("slow")
		});
		
		$("#btnAjax").click(function(){
			var name = $("#name").val();
			$.ajax({
				type:'POST',
				data: {name: name},
				url:'Servlet',
				success: function(result){
					$("#result1").html(result);
				}
			
			});
		});
		
	});
</script>
<br>
<form>
<%--Cookies and alerts!(Week7) --%>
<%--I'll grab user input here, and then save it in a javascript cookie below --%>
	<label id="lblUserID">Please Enter in a user ID, then refresh the page. Everytime the page is refreshed, the user's cookie is displayed</label>
	<br>
	<input type="text" id="userID">
	<br>
	<input type="button" value="Cookie Button" id="btnCookie">
	<span id ="result"></span>
	</form>
<%--Here we will add the code in for the jsp to be able to read in the javascript --%>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"></script>

<%--I first will use JavaScript to store the users "userID" --%>
<script>
	$(function(){
		<%--Grab the data from the input box to store using javaScript--%>
		$("#btnCookie").click(function() {
			var userID = $("#userID").val();
			<%--setting the cookie here--%>
			document.cookie ="userID=" +userID
		});
		
	});
	<%--Here we will send an alert with the cookiewhen the user reloads the page--%>
	var idValueArray = document.cookie.split("=");
	<%--if statement to stop my program from sending the user the cookie until it is stored--%>
	if(userID != ""){
	alert(idValueArray[1]);
	}
</script>
<script>
	<%--Here we will send an alert with the cookiewhen the user reloads the page--%>
		var idValueArray = document.cookie.split("=");
		<%--if statement to stop my program from sending the user the cookie until it is stored--%>
		if(document.cookie.indexOf("userID=") >=0){
		alert(idValueArray[1]);
		}
	
</script>
</body>
</html>