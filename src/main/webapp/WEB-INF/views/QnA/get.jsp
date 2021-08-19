<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<%@ include file="../includes/header.jsp" %>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Bootstrap -->
    
    <!-- Style CSS -->
    <link href="/resources/css/styles2.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet">

</head>

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
	$(document).ready(function(){

		var qseqValue = "<c:out value='${vo.qseq}'/>";
		var replyUL = $(".chat");
		
		showList(1);
		
		function showList(page){
			
			replyService.getList({qseq:qseqValue, page:page||1}, function(list){
				var str = "";
				if(list==null || list.legnth == 0){
					replyUL.html("");
					
					return;
				}
				for(var i=0, len=list.length||0; i<len; i++){
					str += "<li class='left Clearfix' data-rseq='"+list[i].rseq+"'/>";
					str += "<div><div class='header'><strong class='primary-font'>"+list[i].id+"</strong>";
					str += "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].regDate)+"</small></div>";
					str += "<p>"+list[i].content+"</p></div></li><hr>";
				}
				
				
				replyUL.html(str);
			});
		}	// end showList
		
		var modal = $(".modal");
		var modalInputContent = modal.find("input[name='content']");
		var modalInputId = modal.find("input[name='id']");
		var modalInputRegDate = modal.find("input[name='regDate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		var id =null;
		<sec:authorize access="isAuthenticated()">
			id= '<sec:authentication property="principal.username"/>';
		</sec:authorize>
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue= "${_csrf.token}";
		
		
		$("#addReplyBtn").on("click", function(e){
			
			modal.find("input").val("");
			modal.find("input[name='id']").val(id);
			modalInputRegDate.closest("div").hide();
			modal.find("button[id!='modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});
		
		
		
		
		modalRegisterBtn.on("click", function(e){
			
			var reply = {
					content : modalInputContent.val(),
					id : modalInputId.val(),
					qseq : qseqValue
			};
			replyService.add(reply, function(result){
				
				if(result==="success"){
					alert("댓글이 작성되었습니다.");
				}
				
				modal.find("input").val("");
				modal.modal("hide");
				
				showList(1);
			});
		});
		
		$(".chat").on("click", "li", function(e){
			var rseq = $(this).data("rseq");
			
			replyService.get(rseq, function(reply){
				modalInputContent.val(reply.content);
				modalInputId.val(reply.id);
				modalInputRegDate.val(replyService.displayTime(reply.regDate)).attr("readonly", "readonly");
				modal.data("rseq", reply.rseq);
				
				modal.find("button[id!='modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$(".modal").modal("show");
			});
		});
		
		modalModBtn.on("click", function(e){
			var originalid = modalInputId.val();
			var reply = {rseq:modal.data("rseq"), content:modalInputContent.val(), id: originalid};
			
			if(id!=originalid){
				alert("자신이 작성한 댓글만 수정이 가능합니다.");
				modal.modal("hide");
				return;
			}
			
			replyService.update(reply, function(result){
				
				if(result==="success"){
					alert("댓글이 수정되었습니다.");
				}
				modal.modal("hide");
				showList(1);
				
			});
		});
		
		modalRemoveBtn.on("click", function(e){
			
			var rseq = modal.data("rseq");
			
			var originalid = modalInputId.val();
			if(id != originalid){
				alert("자신이 작성한 댓글만 삭제 가능합니다.");
				modal.modal("hide");
				return;
			}
			
			replyService.remove(rseq, function(result){
				
				if(result==="success"){
					alert("댓글이 삭제되었습니다.");
				}
				modal.modal("hide");
				showList(1);
			});
		});
		
	});
</script>

 <div class=" col-lg-8 col-md-8 col-sm-8 col-xs-12">
<div class="row4">

	<h1>소통 공간</h1>
	<p></p>
		<form>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    	<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">글번호</label>
	    	<input  type="text" name="qseq" class="form-control"  readonly="readonly" value='<c:out value="${vo.qseq }"/>'>
        </div>
        </div>
        
    	<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">제목</label>
	    	<input type="text" name="title" class="form-control"  readonly="readonly" value='<c:out value="${vo.title }"/>'>
        </div>
        </div>
                                 
    	<div class="col-md-6">
        <div class="form-group">
	    	<label class="control-label">내용</label>
	    	<textarea rows="5" name="content" class="form-control"  readonly="readonly"><c:out value="${vo.content }"/></textarea>
        </div>
        </div>
                                 
    	<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">작성자</label>
			<input type="text" name="id"  class="form-control" readonly="readonly" value='<c:out value="${vo.id }"/>' >
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
			<input type="text" name="regDate" class="form-control"  readonly="readonly" value='<fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd HH:mm:ss"/>'>
		</div>
		</div>
		
    	<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">수정일</label>
			<input type="text" name="updateDate" class="form-control"  readonly="readonly" value='<fmt:formatDate value="${vo.updateDate }" pattern="yyyy-MM-dd HH:mm:ss"/>'>
		</div>
		</div>
		
		  <div class="col-md-12">
          <div class="form-group"> 
          <sec:authentication property="principal" var="pinfo"/> 
          <sec:authorize access="isAuthenticated()">
          <c:if test="${pinfo.username eq vo.id }">                	
		 <button  class="btn btn-primary5 modBtn">수정</button>
		 </c:if>
		 </sec:authorize>
		<button  class="btn btn-primary listBtn" >목록</button> 
        </div>
        </div>
		      </form>
	   </div>
        </div>
		
		 <form id="actionForm" action="/QnA/list" method="get">
        	<input type="hidden" name="pageNum" value="${cri.pageNum }">
        	<input type="hidden" name="amount" value="${cri.amount }">
        	<input type="hidden" name="qseq" value="${vo.qseq }">
       		<input type="hidden" name="type" value="${cri.type }">
	        <input type="hidden" name="keyword" value="${cri.keyword }">
       	</form>
       	
                  
 
        <br><br>
		<div class='row5'>
		<div class="col-lg-12">
		<div class="panel panel-default">
                     <div class="panel-heading">
                        <i class="fa fa-comments fa-fw"></i> Reply
			댓글
			<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글 작성</button>
		</div>
		
		<div class="panel-body">
			<ul class="chat">
				<li class="left clearfix" data-rno="12">
					<div >
						<div class="header">	<!-- 댓글 머리(작성자+날짜) -->
							<strong class="primary-font">user00</strong> 
							<small class="pull-right text-muted">2021-07-23 3:14</small>
						</div>
						<p>댓글 내용</p><!-- 댓글 몸통(내용) -->
					</div>
				</li>
			</ul>
		</div>
		</div>
		</div>
		</div>	

		

<!-- 모달 -->		
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">댓글 작성</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	        <div class="form-group">
	        	<label>내용</label>
	        	<input class="form-control" name="content" value="New Reply!!!">
	        </div>
	        <div class="form-group">
	        	<label>작성자</label>
	        	<input class="form-control" name="id" value="replyer" readonly="readonly"  >
	        </div>
	        <div class="form-group">
	        	<label>작성일</label>
	        	<input class="form-control" name="regDate" value="">
	        </div>
      </div>
      <div class="modal-footer">
      
        <button id="modalModBtn" type="button" class="btn btn-warning">수정완료</button>
        <button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>
        
        <button id="modalRegisterBtn" type="button" class="btn btn-primary10">등록</button>
        <button id="modalCloseBtn" type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        
      </div>
    </div>
  </div>
</div>
<!-- 모달 끝 -->

<script>
	var actionForm = $("#actionForm");
	
	$(".listBtn").click(function(e){
		e.preventDefault();
		actionForm.find("input[name='qseq']").remove();
		actionForm.submit();
	});
	
	$(".modBtn").click(function(e){
		e.preventDefault();
		actionForm.attr("action", "/QnA/modify");
		actionForm.submit();
	});

		
</script>
	
<%@ include file="../includes/footer.jsp" %>
