<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<spring:url value="/css/styles-login.css" var="cssUrl" /> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resource Navigation | ADP</title>  
<link rel="stylesheet" type="text/css" href="${cssUrl}">
</head>
<body>
		<form id="Form1" method="post">
			<div style="Z-INDEX: 101; LEFT: 27%; POSITION: absolute" align="left">
				<div id="imgLogo"> </div>
			</div>
			<div style="Z-INDEX: 102; LEFT: 18%; POSITION: absolute; TOP: 27%">
			    <IMG src="images/welcomeScreen.jpg"/>
				<input type="text" id="txtUsername" style="Z-INDEX: 100; LEFT: 205px; POSITION: absolute; TOP: 162px"
					  MaxLength="50" Columns="30"/>
				<input type="password" id="txtPassword" style="Z-INDEX: 101; LEFT: 205px; POSITION: absolute; TOP: 195px"
					 MaxLength="50" Columns="30" TextMode="Password"/>
				<input type="submit" id="btnSubmit" style="Z-INDEX: 102; LEFT: 380px; POSITION: absolute; TOP: 240px"
					  value="Submit"/>
				<br>
				<p align="center">
					© 2014 Resource Navigation Inc.</p>
			</div>
		</form>
</body>
</html>