<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp" %>

<head>

<!-- Bootstrap -->
    
    <!-- Style CSS -->
    <link href="/resources/css/styles2.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet">

</head>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="../Member/logout";
		})
		$("#registerBtn").on("click", function(){
			location.href="../Member/register";
		})
		
		
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="../Member/memberUpdateView";
		})
		
		$("#deleteBtn").on("click", function(){
			location.href="../Member/memberDeleteView";
		})
		
		
	})
</script>
		
		<div class=" col-lg-8 col-md-8 col-sm-8 col-xs-12">
		<div class="row6">
			<form name='homeForm' method="post" action="/Member/login-processing">
			
		<c:if test="${member == null}">
		
		
		<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">아이디</label>
			<input class="form-control2" type="text" name="username">
		</div>
		</div>
		
		<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">비밀번호</label>
			<input class="form-control2" type="password" name="password">
		</div>
		</div>
	
			
		 <div class="col-md-12">
          <div class="form-group">
				<button class="btn btn-primary8" type="submit">로그인</button>
				<button class="btn btn-primary7" id="registerBtn" type="button">회원가입</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
			</div>
			</div>
		</c:if>
	
		
		<div>
		<h2>${error}</h2> 
		<h2>${logout}</h2> 
		</div>
		
	</form>
</div>
</div>

<script>

	var check = '${check}';
	var message = '${message}';
	
	if(check===1){
	alert(message);
	}


</script>
<%@ include file="../includes/footer.jsp" %>