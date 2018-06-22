<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="/static/img/title-bar-logo.png" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="static/js/countdown.js" type="text/javascript"
	charset="utf-8"></script>
<link href="http://fonts.googleapis.com/css?family=Raleway:400,700"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="static/css/bootstrap.min.css">


<title>Market Phobia</title>
</head>
<body onload="disableBackButton();">
	<h3>Please Wait...</h3>
	<div id="container">
		<div id="countdown"></div>

		


		<input type="hidden" id="playername" value='${playername}' /> <input
			type="hidden" id="SecondsTogo" value='${SecondsTogo}' />

		<script type="text/javascript" charset="utf-8">
			var playername = $('#playername').val();
			var SecondsTogo = $('#SecondsTogo').val();

			var SecondsTotal = 15;
			if (SecondsTogo != '') {
				SecondsTotal = SecondsTogo;
			}


			var countdown = $("#countdown").countdown360({
				radius : 60,
				seconds : SecondsTotal,
				fontColor : '#FFFFFF',
				autostart : false,
				onComplete : function() {
					window.location.href = ("/gameScreen?name=" + playername);
				}
			});
			countdown.start();
			console.log('countdown360 ', countdown);
			$(document).on("click", "button", function(e) {
				e.preventDefault();
				var type = $(this).attr("data-type");
				if (type === "time-remaining") {
					var timeRemaining = countdown.getTimeRemaining();
					alert(timeRemaining);
				} else {
					var timeElapsed = countdown.getElapsedTime();
					alert(timeElapsed);
				}
			});
		</script>
	</div>
</body>
<script type="text/javascript">
function disableBackButton(){
history.pushState(null, null, location.href);
window.onpopstate = function () {
    history.go(1);
}
}
</script>
</html>