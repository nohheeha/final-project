<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/adminheader.jsp" %>
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

	<h1>소통 게시판</h1>
	<form>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="pageNum" value="${cri.pageNum }">
	    <input type="hidden" name="amount" value="${cri.amount }">
	    <input type="hidden" name="type" value="${cri.type }">
	    <input type="hidden" name="keyword" value="${cri.keyword }">
		
		<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">글번호</label>
	    	<input type="text" name="qseq"  class="form-control" readonly="readonly" value='<c:out value="${vo.qseq }"/>'>
        </div>
        </div>
        
		<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">제목</label>
	    	<input type="text" name="title"  class="form-control" value='<c:out value="${vo.title }"/>'>
        </div>
         </div>                        
        
        <div class="col-md-6">
        <div class="form-group">
	    	<label class="control-label">내용</label>
	    	<textarea rows="5" name="content" class="form-control" ><c:out value="${vo.content }"/></textarea>
        </div>
        </div>
                                 
		<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">작성자</label>
			<input type="text" name="id"  class="form-control" readonly="readonly" value='<c:out value="${vo.id }"/>'>
		</div>
		</div>
		
		<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">조회수</label>
			<input type="text"  class="form-control" readonly="readonly" value='<c:out value="${vo.count }"/>'>
		</div>
		</div>
		
		<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">작성일</label>
			<input type="text"  class="form-control" readonly="readonly" value='<fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd hh:mm:ss"/>'>
		</div>
		</div>
		
		<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">수정일</label>
			<input type="text"  class="form-control" readonly="readonly" value='<fmt:formatDate value="${vo.updateDate }" pattern="yyyy-MM-dd hh:mm:ss"/>'>
		</div>
		</div>
		
		<button id="singlebutton" name="singlebutton" class="btn btn-primary2 " data-oper='modify'>수정</button>
	    <button  id="singlebutton" name="singlebutton" class="btn btn-primary3" data-oper='remove'>삭제</button>
	    
	    
	    <button id="singlebutton" name="singlebutton" class="btn btn-primary" data-oper='list'>목록</button>
	</form>
	</div>
	</div>
	

<script>
	$(document).ready(function(){
		
		var formObj = $("form");
		
		$(":button").click(function(e){
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation==='list'){
				formObj.attr("action","/admin/list").submit();
			} else if(operation==='remove'){
				formObj.attr("action","/admin/remove").attr("method","post").submit();
			} else if(operation==='modify'){
				formObj.attr("action","/admin/modify").attr("method","post").submit();
			}
		});
	});
</script>

<%@ include file="../includes/footer.jsp" %>

