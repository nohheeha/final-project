<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/adminheader.jsp" %>
<head>
<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min2.js">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
	   <link href="/resources/css/styles3.css" rel="stylesheet">
	   <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>

	
	  <div class="form-group">
	  
	  <h1></h1>
	<form id="searchForm" action="/admin/list" method="get">
      	<select class="form-select" id="exampleSelect1" name="type">
      	
      		<option value="" ${pageMaker.cri.type == null? "selected":"" }>---</option>
      		<option value="T" ${pageMaker.cri.type eq 'T'? "selected":"" }>제목</option>
      		<option value="C" ${pageMaker.cri.type eq 'C'? "selected":"" }>내용</option>
      		<option value="W" ${pageMaker.cri.type eq 'W'? "selected":"" }>작성자</option>
      		<option value="TC" ${pageMaker.cri.type eq 'TC'? "selected":"" }>제목+내용</option>
      		<option value="TCW" ${pageMaker.cri.type eq 'TCW'? "selected":"" }>제목+내용+작성자</option>
      	</select>
  
      	<input class="form-control col-md-2" type="text"  placeholder="Search" name="keyword" value="${pageMaker.cri.keyword }">
      	<input  type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
      	<input  type="hidden" name="amount" value="${pageMaker.cri.amount }">
       	<button class="btn2 btn-primary7" type="button">검색</button>
    	  </form>
     </div>
      <br>
      <br>
	
	
<div class="limiter">
<div class="container-table100">
	<div class="wrap-table100">
		<div class="table100 ver1 m-b-110">
			<div class="table100-head">
				<table>
				<thead>
	    		<tr class="row100 head">
	    			<th class="cell100 column1">글번호</th>
	    			<th class="cell100 column1">제목</th>
	   				<th class="cell100 column1">작성자</th>
	    			<th class="cell100 column1">작성일</th>
	    			<th class="cell100 column1">조회수</th>
	   			</tr>
	        </thead>
	        </table>
	        </div>
	     
	        <div class="table100-body js-pscroll">
	        <table>
	        <tbody>
	        	<c:forEach items="${list }" var="vo">
					<tr class="row100 body">
						<td class="cell100 column1"><c:out value="${vo.qseq}"/></td>
						<td class="cell100 column1"><a class="move" href="<c:out value='${vo.qseq}'/>">${vo.title}</a></td>
						<td class="cell100 column1">${vo.id }</td>
						<td class="cell100 column1"><fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd"/></td>
						<td class="cell100 column1">${vo.count }</td>
					</tr>
	
	             </c:forEach>
	         </tbody>
		</table>
		</div>
			<div class="col-md-12">
        	 <div class="form-group">
				<button id="regBtn" name="regBtn" class="btn2 btn-primary4" type="button">글등록</button>
			</div>
        </div>
   </div>
	</div>
	</div>
	</div>
	
	
        
	
	<!-- 페이징 -->
	<div>
		<ul class="pagination">
		<li class="page-item disabled">
	   		<c:if test="${pageMaker.prev }">
	    		<li class="page-item">
	    			<a class="page-link" href="${pageMaker.startPage - 1 }" tabindex="-1">이전</a>
	    		</li>
	   		</c:if>
	   		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
	   			<li class="page-item ${num==pageMaker.cri.pageNum? 'active':'' }"><a class="page-link" href="${num }">${num }</a></li>
	   		</c:forEach>
	   		<c:if test="${pageMaker.next }">
	    		<li class="page-item">
	    			<a class="page-link" href="${pageMaker.endPage + 1 }" tabindex="-1">다음</a>
	    		</li>
	   		</c:if>
	   		</li>
	   	</ul>
   	</div>
   	<!-- 페이징 끝 -->
   	
   	<form id="actionForm" action="/admin/list" method="get">
    	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
    	<input type="hidden" name="type" value="${pageMaker.cri.type }">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
    </form>

	<!-- 모달창 -->
	<div id="myModal" class="modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>Modal body text goes here.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 모달창 끝 -->

<script type="text/javascript">
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		
		history.replaceState({}, null, null);
		//브라우저 주소창에서 보관하고있는 데이터 모두 삭제(뒤로가기 할 때 모달창 안뜨게)
		
		function checkModal(result){
			if(result==='' || history.state){	// 히스토리에 데이터가 있으면
				return;
			}
			
			if(result==='success'){
				$(".modal-body").html("정상적으로 처리되었습니다.");
			} else if(parseInt(result)>0){
				$(".modal-body").html("게시글 "+parseInt(result)+"번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
		
		$("#regBtn").click(function(){
			self.location="/admin/register";
		});
		
		var actionForm = $("#actionForm");
		
		$(".pagination a").on("click", function(e){
			e.preventDefault();
			var targetPage = $(this).attr("href");
			console.log(targetPage);
			
			actionForm.find("input[name='pageNum']").val(targetPage);
			actionForm.submit();
		});
		
		$(".move").on("click", function(e){
			e.preventDefault();
			
			var targetQseq = $(this).attr("href");
			console.log(targetQseq);
			
			actionForm.append("<input type='hidden' name='qseq' value='"+targetQseq+"'>");
			actionForm.attr("action","/admin/get");
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e){
			e.preventDefault();
			searchForm.find("input[name='pageNum']").val(1);
			searchForm.submit();
		});
		
	});
</script>
<%@ include file="../includes/footer.jsp" %>