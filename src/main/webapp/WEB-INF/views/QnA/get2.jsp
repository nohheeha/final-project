<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>

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
					str += "<li data-rseq='"+list[i].rseq+"'/>";
					str += "<div><div><strong>"+list[i].id+"</strong>";
					str += "<small>"+replyService.displayTime(list[i].regDate)+"</small></div>";
					str += "<p>"+list[i].content+"</p></div></li>";
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
		
		$("#addReplyBtn").on("click", function(e){
			
			modal.find("input").val("");
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
			
			var reply = {rseq:modal.data("rseq"), content:modalInputContent.val()};
			
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

	<h1>소통 게시판</h1>
	
		<div>
			<label>글번호</label>
	    	<input type="text" name="qseq" readonly="readonly" value='<c:out value="${vo.qseq }"/>'>
        </div>
    	<div>
			<label>제목</label>
	    	<input type="text" name="title" readonly="readonly" value='<c:out value="${vo.title }"/>'>
        </div>
                                 
        <div>
	    	<label>내용</label>
	    	<textarea rows="5" name="content" readonly="readonly"><c:out value="${vo.content }"/></textarea>
        </div>
                                 
		<div>
			<label>작성자</label>
			<input type="text" name="id" readonly="readonly" value='<c:out value="${vo.id }"/>'>
		</div>
		
		<div>
			<label>조회수</label>
			<input type="text" readonly="readonly" value='<c:out value="${vo.count }"/>'>
		</div>
		
		<div>
			<label>작성일</label>
			<input type="text" name="regDate" readonly="readonly" value='<fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd hh:mm:ss"/>'>
		</div>
		
		<div>
			<label>수정일</label>
			<input type="text" name="updateDate" readonly="readonly" value='<fmt:formatDate value="${vo.updateDate }" pattern="yyyy-MM-dd hh:mm:ss"/>'>
		</div>
		
		 <form id="actionForm" action="/QnA/list" method="get">
        	<input type="hidden" name="pageNum" value="${cri.pageNum }">
        	<input type="hidden" name="amount" value="${cri.amount }">
        	<input type="hidden" name="qseq" value="${vo.qseq }">
       		<input type="hidden" name="type" value="${cri.type }">
	        <input type="hidden" name="keyword" value="${cri.keyword }">
       	</form>
                            	
		<button class="listBtn">목록</button>
        <button class="modBtn">수정</button>
        
        <br><br>
		<div>
			댓글
			<button id="addReplyBtn">댓글 작성</button>
		</div>
		
		<div>
			<ul class="chat">
				<li>
					<div>
						<div>	<!-- 댓글 머리(작성자+날짜) -->
							<strong>user00</strong>
							<small>2021-07-23 3:14</small>
						</div>
						<p>댓글 내용</p><!-- 댓글 몸통(내용) -->
					</div>
				</li>
			</ul>
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
	        	<input class="form-control" name="id" value="replyer">
	        </div>
	        <div class="form-group">
	        	<label>작성일</label>
	        	<input class="form-control" name="regDate" value="">
	        </div>
      </div>
      <div class="modal-footer">
        <button id="modalModBtn" type="button" class="btn btn-warning">수정완료</button>
        <button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>
        <button id="modalRegisterBtn" type="button" class="btn btn-default">등록</button>
        <button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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