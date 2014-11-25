<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<spring:url value="/css/styles-login.css" var="cssUrl" /> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resource Navigation | ADP</title>  
<link rel="stylesheet" type="text/css" href="${cssUrl}">
</head>
<body>
		<form id="login" name="loginform" action="login.htm" method="post">
		    <input type="hidden" name="company" value="${company}"/>
			<div style="Z-INDEX: 101; LEFT: 27%; POSITION: absolute" align="left">
				<div id="imgLogo"> </div>
			</div>
			<c:choose>
				<c:when test="${not empty valid}">
					<div id="error">Invalid username or password</div>
				</c:when>
			</c:choose>
			<div style="Z-INDEX: 102; LEFT: 18%; POSITION: absolute; TOP: 27%">
			    <IMG src="images/welcomeScreen.jpg"/>
				<input type="text" id="txtUsername" name="username" style="Z-INDEX: 100; LEFT: 205px; POSITION: absolute; TOP: 162px"
					  MaxLength="50" Columns="30"/>
				<input type="password" id="txtPassword" style="Z-INDEX: 101; LEFT: 205px; POSITION: absolute; TOP: 195px"
					 MaxLength="50" Columns="30" name="password"/>
				<input type="submit" id="btnSubmit" style="Z-INDEX: 102; LEFT: 380px; POSITION: absolute; TOP: 240px"
					  value="Submit"/>
				<br>
				<p align="center">
					© 2014 Resource Navigation Inc.</p>
			</div>
		</form>
</body>
</html>