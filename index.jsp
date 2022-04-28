<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
	<link rel="stylesheet" href="./style.css">

</head>

<body>
	<div class="box-form">
		<div class="left">
			<div class="overlay">
				<h1>Hello World.</h1>
				<p>Facing problem while loging in? Try clicking on "forget password"</p>
				<p>
				Designed and Developed by <div><b>Harshal Singh Raushan</div> 0801IT1910<b>33</b></p> and <div><b>Saksham jain</div> 0801IT1910<b>73</>
				</p>

			</div>
		</div>


		<div class="right">
			<h5>Login</h5>
			<form action="login">
			<div class="inputs">
				<input type="text" placeholder="user name" name="u">
				<br>
				<input type="password" placeholder="password" name="p">
			</div>

			<br><br>
			<div class="remember-me--forget-password">
			</div>
			<br>
			<button name="s" value="login">Login</button>
			<button name="s" value="reg">Register</button>
			</form>
		</div>
	</div>
</body>
</html>
