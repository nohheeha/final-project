<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles2.css" rel="stylesheet" />
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">    
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   <!-- font -->
     <link href="/resources/css/font-awesome.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
   
   
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5"><a href="/admin/main"><img src="/resources/assets/img/logo.png" /></a>
                <a class="navbar-brand" href="#page-top"></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                    	<li class="nav-item"><a class="nav-link" href="/admin/getMember">회원관리</a></li>
                        <li class="nav-item"><a class="nav-link" href="/Trip/Tourlist">여행지LIST</a></li>
                        <li class="nav-item"><a class="nav-link" href="/Itinerary/map">일정계획</a></li>
                        <li class="nav-item"><a class="nav-link" href="/admin/list">소통공간</a></li>
                    </ul>
                </div>
                
                    <div>
                    	
	             		 <ul class="navbar-nav ms-auto my-2 my-lg-0">
	             		<sec:authorize access="isAnonymous()"> 	
	              			<li class="badge bg-info"><a href="/Member/Login">Login</a></li>&nbsp;&nbsp; 
	                		<li class="badge bg-info"><a href="/Member/register">JoinUs</a></li>&nbsp;&nbsp; 
	                		</sec:authorize>
	                		
	                		<sec:authorize access="isAuthenticated()">
	                		<p><sec:authentication property="principal.username"/>님 환영합니다.</p>&nbsp;
	                		<li class="badge bg-info"><a href="/Member/logout">Logout</a></li> &nbsp;&nbsp;
	                		<li class="badge bg-info"><a href="/Member/memberUpdateView">MyPage</a></li> &nbsp;&nbsp;      
	                		</sec:authorize>       
	             		 </ul>                		
                </div>
            </div>
        </nav>
   <script src="/resources/js/scripts.js"></script>
   </body>
   </html>