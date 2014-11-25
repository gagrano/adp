<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
<spring:url value="/js/jquery-1.8.3.js" var="jqueryUrl" /> 
<spring:url value="/css/styles.css" var="cssUrl" /> 
<script src="${jqueryUrl}"></script>   
<script type="text/javascript">
	$(document).ready(function () {	
		$('#upload').change(function() {
		    var filename = $(this).val();
		    var lastIndex = filename.lastIndexOf("\\");
		    if (lastIndex >= 0) {
		        filename = filename.substring(lastIndex + 1);
		    }
		    $('#filename').val(filename);
		});	
	});
</script>
<title>Resource Navigation | ADP</title>  
<link rel="stylesheet" type="text/css" href="${cssUrl}">
</head>  
<body>  
    <center>  
        <h2>Resource Navigation | ADP</h2>  
        <h4>${message}</h4> 
         <table cellpadding="1" id="list" cellspacing="5" width="400">
		    <thead>
		    	<tr>
			        <th>File</th>
			        <th>Date Modified</th>
		    	</tr>
		    </thead>
		    <c:forEach items="${fileMap}" var="hMap" varStatus="loop">
		        <tr class="${loop.index % 2 == 0 ? 'even' : 'odd'}">
		            <td><a href="feed?company=${company}&name=${hMap.key}">${hMap.key}</a></td>
		            <td>${hMap.value}</td>
		        </tr>
		    </c:forEach>
		</table>
		<c:if test="${uploadMsg != null}">
			<P>${uploadMsg}
		    <c:if test="${inputFileMap != null}">
		    	<c:forEach items="${inputFileMap}" var="inputMap" varStatus="loop">
		        <tr class="${loop.index % 2 == 0 ? 'even' : 'odd'}">
		            <td>${inputMap.key}</td>
		            <td>${inputMap.value}</td>
		        </tr>
		    	</c:forEach>
		    </c:if>
		</c:if>
		<div id="button_form">
			<form action="upload.htm" enctype="multipart/form-data" method="post">
			    <input type="hidden" name="company" value="${company}"/>
				File to upload: <input id="upload" type="file" name="file"><br /> 
				Name: <input id="filename" type="text" name="name"><br /> <br /> 
				<div id="buttons">
					<input type="submit" value="Upload"> Press here to upload the file!
					&nbsp;
					<input type="button" onclick="javascript:window.location='/adp'" value="Go Back"/>
				</div>
			</form>
		</div>  
    </center>  
</body>  
</html>