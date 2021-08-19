<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/adminheader.jsp" %>
<head>
<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min2.js">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/main2.css">
	   <link href="/resources/css/styles3.css" rel="stylesheet">
	   <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>


		

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
			<h3>회원관리</h3><br>
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">	
						<table>
						<thead>
						<tr class="row100 head">
							<th class="cell100 column1">아이디</th>
							<th class="cell100 column1">이름</th>
							<th class="cell100 column1">이메일</th>
							<th class="cell100 column1">전화번호</th>			
						</tr>
			</thead>
		</table>
	</div>
	
	<div class="table100-body js-pscroll">
	   <table>
	      <tbody>
				<c:forEach var="member" items="${get }">
				<tr class="row100 body">
					<td class="cell100 column1"><a href="/admin/memberUpdateView?id=${member.id }">${member.id }</a></td>
					<td class="cell100 column1">${member.name }</td>
					<td class="cell100 column1">${member.email }</td>
					<td class="cell100 column1">${member.phone }</td>
				</tr>
	</c:forEach>
	</tbody>
	</table>
	</div>
	</div>
	</div>
	</div>
	</div>


