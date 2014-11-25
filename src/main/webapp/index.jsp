<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>  
<title>Resource Navigation | ADP feeds</title>  
<spring:url value="/css/styles.css" var="cssUrl" /> 
<link rel="stylesheet" type="text/css" href="${cssUrl}">
</head>  
<body>    
    <center>  
        <h2>ADP Feeds</h2>  
    </center> 
        <%
		   String site = new String("login");
		   response.setStatus(response.SC_MOVED_TEMPORARILY);
		   response.setHeader("Location", site); 
		%>
     
</body>  
</html>
