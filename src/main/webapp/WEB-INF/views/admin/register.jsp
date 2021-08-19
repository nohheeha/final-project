<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/adminheader.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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

	<h1>소통 공간</h1><br><br>
	<form action="/admin/register" method="post">
    	
    	<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">제목</label>
	    	<input type="text" name="title" class="form-control">
        </div>
        </div>
                                 
        <div class="col-md-6">
        <div class="form-group">
	    	<label class="control-label">내용</label>
	    	<textarea rows="5" name="content" class="form-control"></textarea>
        </div>
        </div>
                                 
		<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">작성자</label>
			<input type="text" name="id" class="form-control" readonly="readonly" value='<sec:authentication property="principal.username" />'>
		</div>
		</div>
		<button id="singlebutton" name="singlebutton" class="btn btn-primary6" type="reset">취소</button>
		<button id="singlebutton" name="singlebutton" class="btn btn-primary" type="submit">작성</button>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	</div>
	</div>
	
<%@ include file="../includes/footer.jsp" %>