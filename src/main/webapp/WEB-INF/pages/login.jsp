<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<spring:url value="/css/login.css" var="cssUrl" /> 
<html lang="en" class="no-js">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>Login and Registration </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
         <META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">

<link rel="stylesheet" type="text/css" href="${cssUrl}">
    
    </head>
    <body>
        <div class="container">
            <!-- Codrops top bar -->
            <div class="codrops-top">
              <div class="clr"></div>
            </div><!--/ Codrops top bar -->
            <section>				
                <div id="container_demo">
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                    <img style="width:100%" src="images/header_img.jpg">
                        <div id="login" class="animate form">
                            <form id="login2" name="loginform" action="login.htm" method="post">
                                <input type="hidden" name="company" value="${company}"/>
                                <h1>Log in</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u"> Your username </label>
                                    <input id="username" name="username" required type="text" placeholder="my username">
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                                    <input id="password" name="password" required type="password" placeholder="eg. X8df!90EO"> 
                                </p>
                                <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping"> 
									<label for="loginkeeping">Keep me logged in</label>
								</p>
                                <p class="login button"> 
                                    <input type="submit" value="Login"> 
								</p>
                             
                            </form>
                        </div>

             
                    </div>
                </div>  
            </section>
        </div>
        
           <div id="subnav"></div>  
  <div class="footer">
    	<div class="footerleft">© 2014 - 2015 Resouce Navigation</div>
    	<div class="footerright" style="margin-left: 260px;"> 781-899-8999 (Information) 26 Fox Road, Waltham, MA 02451</div>
    </div> 
        
</body></html>