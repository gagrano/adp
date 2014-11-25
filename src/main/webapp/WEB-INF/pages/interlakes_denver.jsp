<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
 <META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">

<script src="interlakes_files/jquery-1.8.3.js"></script>   
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
<style type="text/css">

body {
	font-family: 'HelveticaNeue', Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 21px;
	color: #666;
	background-image: url(interlakes_files/bg-2.jpg);
	background-repeat: repeat;
}
input#filename {
padding: 10px;
border: solid 1px #0494d3;
transition: box-shadow 0.3s, border 0.3s;
width: 300px;
}
h1 {
padding-left: 0px;
padding-top: 0px;
font-family: 'Times New Roman', Times, sans-serif;
line-height: 1em;
color: blue;
font-weight: bold;
font-size: 20pt;
/*
text-shadow: 0px 0px 0 rgb(223,223,223),-1px -1px 0 rgb(200,200,200),-1px -1px 0 rgb(178,178,178),-2px -2px 0 rgb(156,156,156),-3px -3px 0 rgb(133,133,133),-4px -4px 0 rgb(111,111,111), -5px -5px 0 rgb(89,89,89),-6px -6px 5px rgba(0,0,0,0.4),-6px -6px 1px rgba(0,0,0,0.5),0px 0px 5px rgba(0,0,0,.2);*/
}
h2 {
text-transform: uppercase;
font-family: Montserrat,"Helvetica Neue",Helvetica,Arial,sans-serif;
font-weight: 700;
letter-spacing: 1px;
color: #fff;
font-size: 3em;
padding-top: 35px;
margin: 0px;
text-align: center;
text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
}
tr.odd {background-color: #b9d0de}
tr.even {background-color: #EEEEDD}
#buttons {
	display:inline;
}
td, th {
  width: 5rem;
  height: 3rem;
  border: 1px solid #ccc;
  text-align: center;
}
th {
	background: #1b3651;
	border-color: white;
	color: #fff;
	font-size: 25px;
}
input[type="submit"] {
	display: inline-block;
	padding: 10px 40px;
	background: #1b3651;
	color: #fff;
	text-transform: uppercase;
	font-size: 16px;
	margin: 20px 0;
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
}
input[type="button"] {
	display: inline-block;
	padding: 10px 40px;
	background: #1b3651;
	color: #fff;
	text-transform: uppercase;
	font-size: 16px;
	margin: 20px 0;
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
}
#upload {
	background-color: #1b3651;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-border-radius: 5px;
	border: none;
	padding: 10px 25px 10px 25px;
	color: #FFF;
	text-shadow: 1px 1px 1px #949494;
}
h4 {
	text-transform: uppercase;
	font-family: Montserrat,"Helvetica Neue",Helvetica,Arial,sans-serif;
	font-weight: 700;
	letter-spacing: 1px;
	margin-top: 2%;
	margin-right: 0;
	margin-bottom: 35px;
	margin-left: 0;
	color: #355267;
	font-size: 1.9em;
	padding-top: 20px;
}
.mainwrapper {
width: 1200px;
margin: auto;
position: relative;
overflow: hidden;
-moz-box-shadow: 0 0 5px rgba(0,0,0,0.1);
-webkit-box-shadow: 0 0 5px rgba(0,0,0,0.1);
box-shadow: 0 0 5px rgba(0,0,0,0.1);
background-color: #f7f7f7;
background-image: url(interlakes_files/mainbg.png);
background-repeat: no-repeat;
background-position: 0 0;
box-shadow: 0 0 7px #666;
margin-top: 25px;
background-position-y: 210px;
}
#subnav {
	height: 8px;
	background-color: #ffffff;
	background-image: url(interlakes_files/submenu-bg.gif);
	background-repeat: repeat-x;
	background-position: left bottom;
}
#header-main {
	background-color: #005195;
	background-image: url(interlakes_files/header-bg.jpg);
	background-repeat: repeat-x;
	background-position: left top;
	height: 100px;
}
form {
width: 600px;
margin: 0px auto;
font-size: 14px;
}
/***** FOOTER STYLES *****/
/*************************/


.footer {
	position: absolute;
	bottom: 0;
	left: 0;
	font-size: 11px;
	color: #999;
	width: 100%;
	background-color: #1b3651;
}
.footer a { color: #bbb; }
.footer .footerleft { padding: 10px 15px; width: 230px; float: left; background: #3b6998; min-height: 20px; border-right: 1px solid #3c3c3c; color: #fff;}
.footer .footerright { padding: 10px 15px; margin-left: 260px; text-align: right; color: #ffffff;}

/***** USING ROBOTO FONT *****/
/****************************/
#left_nav {
	width: 100%;
	border-right: 1px solid #000;
	padding: 0 0 1em 0;
	margin-bottom: 1em;
	background-color: #90bade;
	color: #333;
	font-size:14px;
}

#left_nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
	border: none;
}
	
#left_nav li {
	border-bottom: 1px solid #90bade;
	margin: 0;
	list-style: none;
	list-style-image: none;
}
	
#left_nav li a {
	display: block;
	padding: 5px 5px 5px 0.5em;
	border-left: 10px solid #1958b7;
	border-right: 10px solid #508fc4;
	background-color: #2175bc;
	color: #fff;
	text-decoration: none;
	width: 100%;
}

html>body #left_nav li a {
	width: auto;
}

#left_nav li a:hover {
	border-left: 10px solid #1c64d1;
	border-right: 10px solid #5ba3e0;
	background-color: #2586d7;
	color: #fff;
}
/* top level
--------------------------------------------*/
.menuTemplate1 {
margin: 0 auto;
float: left;
Note: htc file path(if using relative path) inside the CSS file should be relative to the page, not to the CSS file (this is unlike image path inside the CSS that is relative to the CSS file location only). So we recommend using the absolute path for the behavior file. behavior: url("/horizontal/menuh/cssmenu.htc");
position: relative;
z-index: 4;
height: 36px;
background: #D4D4D4 url(interlakes_files/bg.gif);
border: 1px solid #BBB;
font-family: Arial, Helvetica, sans-serif;
list-style: none;
padding: 0;
border-radius: 5px;
}

.menuTemplate1 div {
    box-sizing:content-box;
}  
   
.menuTemplate1 li
{
    padding: 0;
    float: left;
    height: 36px;
    position: relative;/*delete it if you want submenu to be positioned relative to the whole menu instead of this li element*/
    color: black;
    z-index:5;
}

.menuTemplate1 a
{
    padding: 0 28px;
    line-height: 36px; /*Note: keep this value the same as the height of .menuTemplate1 li */
    font-size: 12px;
    font-weight: bold;
    display: inline-block;
    outline: 0;
    text-decoration: none;
    color: black;
    position: relative;
}
.menuTemplate1 li:hover a, .menuTemplate1 li.onhover a
{
	color: #000;
	z-index: 9;
	background-color: white;
	background-image: url(interlakes_files/bg.gif);
	background-repeat: repeat-x;
	background-position: 0 -48px;
}
.menuTemplate1 a.arrow
{
    background: url(arrow.gif) no-repeat right center;
}
 
        
/*Used to align a top-level item to the right*/        
.menuTemplate1 li.menuRight
{
    float: right;
    margin-right: 0px;
}
        
/*for the top-level separators*/
.menuTemplate1 li.separator
{
    font-size:0;
    overflow:hidden;
    border-left:1px solid #F7F7F7;
    border-right:1px solid #BBBBBB;
    z-index:4;
}
.center_menu {
margin: 0px auto;
width: 700px;
height: 75px;
padding-top: 15px;
}
</style>
</head>  
<body> 
<div class="mainwrapper">
<div id="header-main"><img src="interlakes_files/header_img.jpg" width="1200" height="101"></div> 

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
        <li><a href="#CSS-Menu">Paroll</a></li>
        <li class="separator"></li>       
         <li><a href="#CSS-Menu">Finance Administration</a></li>
        <li class="separator"></li> 
          <li><a href="#CSS-Menu">Reports</a></li>
        <li class="separator"></li> 
          <li><a href="#CSS-Menu">Support</a></li>
        <li class="separator"></li>         
          <li><a href="#CSS-Menu">Logout</a></li>
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
		    
		        <tbody><tr class="even">
		            <td><a href="http://resnavweb.com:8080/adp/feed?company=interlakes&name=PRRN2EPI.CSV">PRRN2EPI.CSV</a></td>
		            <td>11/06/2014 13:01:21</td>
		        </tr>
		    
		        <tr class="odd">
		            <td><a href="http://resnavweb.com:8080/adp/feed?company=interlakes&name=20141027_PRRN2EPI.CSV">20141027_PRRN2EPI.CSV</a></td>
		            <td>10/27/2014 20:06:37</td>
		        </tr>
		    
		        <tr class="even">
		            <td><a href="http://resnavweb.com:8080/adp/feed?company=interlakes&name=20141025_PRRN2EPI.CSV">20141025_PRRN2EPI.CSV</a></td>
		            <td>10/25/2014 22:17:31</td>
		        </tr>
		    
		</tbody></table>
		
		<div id="button_form">
			<form action="http://resnavweb.com:8080/adp/upload.htm" enctype="multipart/form-data" method="post">
			    <input type="hidden" name="company" value="interlakes">
                
                <div style="height:25px; clear:both"></div>
				File to upload: <input id="upload" type="file" name="file">
                                <div style="height:25px; clear:both"></div>

                
				Name: <input id="filename" type="text" name="name"><br> <br> 
				<div id="buttons">
					<input type="submit" value="Upload"> Press here to upload the file!
					&nbsp;
					<input type="button" onclick="javascript:window.location=&#39;/adp&#39;" value="Go Back">
				</div>
			</form>
		</div>  
</center> 
</div>
    <div id="subnav"></div>  
    </div>
  <div class="footer">
    	<div class="footerleft">© 2014 - 2015 Resouce Navigation</div>
    	<div class="footerright" style="margin-left: 260px;"> 781-899-8999 (Information) 26 Fox Road. Waltham-MA-0245</div>
    </div>
</body></html>