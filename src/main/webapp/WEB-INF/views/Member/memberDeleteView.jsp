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


		


		
			<div class=" col-lg-8 col-md-8 col-sm-8 col-xs-12">
			<div class="row4">
		
				<h2>회원탈퇴</h2>
				<form action="../Member/memberDelete" method="post" id="delForm">	
					
					<div class="col-md-6">
        			<div class="form-group">
						<label class="control-label">아이디</label>
						<input  class="form-control"  type="text"  name="id" value="${delete.id}" readonly="readonly"/>
					</div>
					</div>
				
			    	<div class="col-md-6">
			        <div class="form-group">				
						<label class="control-label">비밀번호</label>
						<input class="form-control" type="password" id="password" name="password" />
					</div>
					</div>
			
					
			    	<div class="col-md-6">
			        <div class="form-group">
						<label class="control-label">이름</label>
						<input class="form-control"  type="text" id="userName" name="userName" value="${delete.name}" readonly="readonly"/>
					</div>
					</div>
					<div class="col-md-6">
			        <div class="form-group">
						<button class="btn btn-primary5" type="submit" id="submit">회원탈퇴</button>
						<button class="btn btn-primary7"  type="button" onclick="history.back(-1);">취소</button>
					</div>
					</div>
			    								
			</form>
				
			</div>
			</div>
			
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
		
<%@ include file="../includes/footer.jsp" %>