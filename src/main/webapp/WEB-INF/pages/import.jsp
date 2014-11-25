<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
 <spring:url value="/js/jquery-1.8.3.js" var="jqueryUrl" /> 
 <spring:url value="/css/styles.css" var="cssUrl" /> 
 <script src="${jqueryUrl}"></script>  
<title>Resource Navigation | ADP</title>  
<link rel="stylesheet" type="text/css" href="${cssUrl}">
</head>  
<body>  
    <center>  
        <h2>Resource Navigation | ADP</h2>  
        <h4>${message}</h4> 
         
		<div id="button_form">
			<form action="import.htm" method="post">
			    <input type="hidden" name="company" value="${company}"/> 
			    <input type="hidden" name="name" value="${feed}"/> 
			    <c:choose>
			        <c:when test="${empty fileName}">
			            Feed name: <b>${feed}</b>	
			            <p>
						<div id="buttons">
							<input type="submit" value="Import"> 
							&nbsp;
							<input type="button" onclick="javascript:window.location='/adp/show?company=${company}'" value="Go Back"/>
						</div>			
					</c:when>
			        <c:otherwise>
						New Output File: <a href="feed?company=${company}&name=${fileName}"><b>${feed}</b></a>
						<p>
						<div id="buttons">
							<input type="button" onclick="javascript:window.location='/adp/show?company=${company}'" value="Go Back"/>
						</div>
					</c:otherwise>
				</c:choose>
				
			</form>
		</div>  
    </center>  
</body>  
</html>