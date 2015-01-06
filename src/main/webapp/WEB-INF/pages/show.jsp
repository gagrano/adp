<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<spring:url value="/js/jquery-1.8.3.js" var="jqueryUrl" /> 
<spring:url value="/css/show.css" var="cssUrl" /> 
<script src="${jqueryUrl}"></script>   
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
 <META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
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
		$('a.delete').click(function(e) {
			if (confirm("Are you sure?")) {
				e.preventDefault();
				var table = document.getElementById('list');
				var i = $(this).attr('id');
				var currentRow = -1;
				for (var z=0; z < table.rows.length; z++) {
					if (table.rows[z].id == i)	{
						currentRow = z;
						break;
					}
				}
				$.ajax({
					type: 'get',
					url: '/delete',
					data: $(this).attr('name'),
					beforeSend: function() {
						$("#list").animate({'backgroundColor':'#fb6c6c'},300);
					},
					success: function(e) {
						//$("tr #"+i).slideUp(300,function() {	
							table.deleteRow(currentRow);
						//});
					}
				});
			} else { alert("Be careful!");}
		});
	});
</script>
<title>Resource Navigation | ADP</title>  
<link rel="stylesheet" type="text/css" href="${cssUrl}">
<style type="text/css">
.delete_pos { 
	float: right;
	padding-right: 10px;
}
</style>
</head>  
<body> 
<div id="container">
<div class="mainwrapper">
	<div id="header-main"><img src="images/header_img.jpg" width="1200" height="101"></div> 

 <div style="float: left;width: 260px;padding-right: 10px;">
	<img style="padding-left: 10px;float: left;padding-top: 25px;padding-right: 20px;" src="http://www.resourcenavigation.com/images/logo-resnav.png" alt="Resnav-logo">
	<h1><strong>Resource Navigation Inc.</strong></h1>

    <div style="clear:both; height:10px;"></div>

	<div id="left_nav">
	  <ul>
		<li><a href="#">Home</a></li>
		<li><a href="#">Payroll</a></li>
		<li><a href="#">Finance Administration</a></li>
		<li><a href="#">Reports</a></li>
		<li><a href="#">Support</a></li>
		<li><a href="#">GoToAssist</a></li>
		<li><a href="#">Email Support</a></li>
	  </ul>
	</div>
 </div>
 
 
 
 
  <div style="float:left;width: 850px;">
  
    <center> 
      
      <div class="center_menu">  
       <ul class="menuTemplate1 decor1_1" license="2c8m1">
        <li><a href="#CSS-Menu">Home</a></li>
        <li class="separator"></li>
        <li><a href="#CSS-Menu">Payroll</a></li>
        <li class="separator"></li>       
         <li><a href="#CSS-Menu">Finance Administration</a></li>
        <li class="separator"></li> 
          <li><a href="#CSS-Menu">Reports</a></li>
        <li class="separator"></li> 
          <li><a href="#CSS-Menu">Support</a></li>
        <li class="separator"></li>         
          <li><a href="logout">Logout</a></li>
        <li class="separator"></li>     </ul>
    </div>
        <div style="clear:both; height:35px"></div>
        
        
          <table cellpadding="1" id="list" cellspacing="5" width="600">
		    <thead>
		    	<tr>
			        <th>File</th>
			        <th>Date Modified</th>
		    	</tr>
		    </thead>
		    <c:forEach items="${fileMap}" var="hMap" varStatus="loop">
		        <tr id="${loop.index}" class="${loop.index % 2 == 0 ? 'even' : 'odd'}">
		            <td><a href="feed?company=${company}&name=${hMap.key}">${hMap.key}</a>
		                <span class="delete_pos">
		                <a id="${loop.index}" class="delete" name="company=${company}&name=${hMap.key}" href="#"><img alt="" src="images/delete.gif" width="16" height="16"></a>
		                </span>
		            </td>
		            <td>${hMap.value}&nbsp;&nbsp;
		            	<a id="dl${loop.index}" class="download" href="/download?company=${company}&name=${hMap.key}">Download</a>
		            </td>
		        </tr>
		    </c:forEach>
		</table>
		
		<c:if test="${uploadMsg != null}">
			<P>${uploadMsg}
		    <c:if test="${inputFileMap != null}">
		        <table>
			    	<c:forEach items="${inputFileMap}" var="inputMap" varStatus="loop">
			        <tr class="${loop.index % 2 == 0 ? 'even' : 'odd'}">
			            <td>${inputMap.key}</td>
			            <td>${inputMap.value}</td>
			        </tr>
			    	</c:forEach>
		    	</table>
		    </c:if>
		</c:if>
		<div id="button_form">
			<form action="upload.htm" enctype="multipart/form-data" method="post">
			    <input type="hidden" name="company" value="${company}">
                
                <div style="height:25px; clear:both"></div>
				File to upload: <input id="upload" type="file" name="file">
                                <div style="height:25px; clear:both"></div>

                
				Name: <input id="filename" type="text" name="name"><br> <br> 
				<div id="buttons">
					<input type="submit" value="Upload"> Press here to upload the file!
					&nbsp;
					<input type="button" onclick="javascript:window.location='logout'" value="Go Back">
				</div>
			</form>
		</div>  
</center> 
</div>
    <div id="subnav"></div>  
    </div>
  <div class="footer">
    	<div class="footerleft">© 2014 - 2015 Resource Navigation</div>
    	<div class="footerright" style="margin-left: 260px;"> 781-899-8999 (Information) 26 Fox Road, Waltham, MA 02451</div>
    </div>
</div>
</body></html>