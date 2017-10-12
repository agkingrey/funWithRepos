<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>JavaScript Example</title>
</head>
<body>
	<form>
		<%--I'll grab user input here, and then save it in a javascript cookie below --%>
		<label id="lblUserID">Please Enter in a user ID, then refresh the page. The alert will prove your cookie saved</label>
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
</script>
<script>
	<%--Here we will send an alert, another useful javascript feature, to inform users there cookie was saved--%>
		var idValueArray = document.cookie.split("=");
		alert(idValueArray[1]);
	
</script>
</body>
</html>