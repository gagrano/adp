<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADP - Feed Data</title>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
<spring:url value="/css/styles.css" var="cssUrl" /> 
<link rel="stylesheet" type="text/css" href="${cssUrl}">
<style>
table {
  table-layout: fixed; 
  width: 100%;
  *margin-left: -50px;/*ie7*/
}
td, th {
  vertical-align: center;
  border-top: 1px solid #ccc;
  padding:5px;
  word-wrap:break-word;
  /*width:50px;*/
}
/*
th {
  position:absolute;
  *position: relative; /*ie7*/
/*  left:0; 
   width:50px;
}
*/
.outer {position:relative}
.inner {
 /* overflow-x:scroll;
  overflow-y:visible; */
  width:900px; 
  margin-left:10px;
}

.LastName { width: 120px}
.Email { width: 220px}
</style>
<script>
$(document).ready( function () {
    $('#list').DataTable({
        "scrollY": 500,
        "scrollX": true
    });
} );
</script>
</head>
<body>
<center>  
        <h2>Resource Navigation | ADP</h2> 
        <P>
        <h4>${message}</h4> 
        <input type="button" onclick="javascript:window.history.back()" value="Go Back"/>
        <div class="outer">
	  		<div class="inner">
	        <table cellpadding="1" id="list" cellspacing="5">
			    <c:forEach items="${feedList}" var="line" varStatus="loop">
			    <c:choose>
			        <c:when test="${loop.index == 0}">
			        	<thead>
				        	<tr class="even">
				        	    <c:forEach items="${line}" var="item" varStatus="loopA">
				        	        <c:choose>
			        				<c:when test="${(item == 'Last Name')}">
					            		<th width="100" class="LastName">
					            	</c:when>
					            	<c:when test="${(item == 'Work E-mail')}">
					            		<th width="220" class="Email">
					            	</c:when>
			        				<c:otherwise>
			        					<th width="50">
			        				</c:otherwise>
			                        </c:choose>
					            	${item}</th>
					            </c:forEach>
					        </tr>
				        </thead>
			        </c:when>
			        <c:otherwise>
				        <tr class="${loop.index % 2 == 0 ? 'even' : 'odd'}">
				             <c:forEach items="${line}" var="item" varStatus="loopA">
					            	<td>${item}</td>
					         </c:forEach>
				        </tr>
			        </c:otherwise>
			    </c:choose>
			    </c:forEach>
			</table>
			</div>
		</div>
		<input type="button" onclick="javascript:window.history.back()" value="Go Back"/>
</center>
</body>
</html>