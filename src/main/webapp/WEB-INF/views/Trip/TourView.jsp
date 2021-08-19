<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authorize access="hasRole('ROLE_USER')">
<%@ include file="../includes/header.jsp" %>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<%@ include file="../includes/adminheader.jsp" %>
</sec:authorize>

<head>
<meta charset="UTF-8">

<!-- Style CSS -->
    <link href="/resources/css/style2.css" rel="stylesheet">
    <link href="/resources/css/styles4.css" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">



<style>
.btn {cursor:pointer;}
</style>
<script>
$(document).ready(function(){
	$('#listbtn').on("click", function(){
		location.href="/Trip/Tourlist";
	})
})


</script>

</head>


		
			<section id="container">
						<div class="row3">
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
						
		                    	<div class="service-block">
		                        <div class="service-img">	
		                        
									<h3>${read.title}</h3>
																				
											
										<label for="address1"></label><div>${read.address1}</div><br>	<br>		
										
										
									<button  class="btn2 btn-primary9" type="button" id="getItinerary">일정추가</button>
										<label for="image1"></label><img src="${read.image1}" width="700" height="468" /><br>	
										
									
										<div><img src="/resources/images/heart.png" class="btn" onclick="fn_like();"><b id="like" class="likecnt">${read.likecnt}</b></div>
											
										<label for="content">${read.content}</label><div></div>
										
									
										
										<label for="tel"></label><div>${read.tel}</div>
										 <button id="listbtn"  type="button" class="btn btn-primary15">목록</button>
															
								</div>
							</div>
						</div>
					</div>	
			</section>
			
			<input type="hidden" name="tseq" value="${read.tseq }">
			<input type="hidden" name="id" value="<sec:authentication property='principal.username'/>">
			
			
	<!-- 모달 -->
	<div class="modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">일정 목록</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>여행지를 추가할 일정을 선택해주세요.</p>
	        <form action="/Itinerary/getList">
	        	<div class="radio"></div>
	        </form>
	        <div id="add"></div>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary13" id="addNewItinerary">새일정추가</button>
	        <button type="button" class="btn btn-primary11" id="addList">여행지추가</button>
	        <button type="button" class="btn btn-primary14" id="removeItinerary">일정삭제</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 모달 끝 -->
			
			<script>	
		
		function fn_like(){
			$.ajax({
				url : "/Trip/likeup",
				type : "post",
				dataType : "text",
				data : {"tseq" : ${read.tseq}},
				success : function(data){
					console.log(data);
					 $('#like').html(data);
				}
			});
		}
		
		$( function() {
			var radio = $(".radio");
			var id = $("input[name=id]").val();
			
			function getList(){
				var request = $.ajax({
					type: "GET",
					url:"/Itinerary/get",
					data: {id:id},
					dataType: "json",
					success : function(data){
						console.log(data);
						
						var str = "";
						for(var i in data){
							console.log(data[i]['title']);
							console.log(data[i]['iseq']);
							str += "<label for='"+data[i]['iseq']+"'><input type='radio' name='iseq' value='"+data[i]['iseq']+"'>&nbsp"+data[i]['title']+"</label><br>";
						}
						radio.html(str);
					}
					
				});
			}
			
			$("#getItinerary").on("click", function(){
				
				getList();
				
				$(".modal").modal("show");
			});
			
			$("#addNewItinerary").on("click", function(){
				var str = "";
				str += "<input type='text' name='newTitle' placeholder='새일정'> ";
				str += "<button id='addCalendar' class='btn-primary16'>확인</button>"
				$("#add").html(str);
			});
			
			$("body").on("click", "#addCalendar", function() {
				
				var title = $("input[name='newTitle']").val();
				
				if(title==null || title.trim()==""){
					alert("이름을 입력해주세요.");
					return;
				}
				
				var request = $.ajax({
					type: "GET",
					url:"/Itinerary/addCalendar",
					data: {id:id, title:title },
					dataType: "text",
					success : function(data){

						getList();
						$("#add").html("");
						
					}
					
				});
			});
			
			$("#removeItinerary").on("click", function(){
				var iseq = $("input[name='iseq']:checked").val();
				
				console.log(iseq);
				if(iseq == null){
					alert("일정을 선택해주세요.");
					return;
				}
				
				var request = $.ajax({
					type: "GET",
					url:"/Itinerary/removeItinerary",
					data: {iseq:iseq},
					dataType: "text",
					success : function(data){
						console.log(data);
						getList();
					}
				});
			});
			
			$("#addList").on("click", function(){
				var iseq = $("input[name='iseq']:checked").val();
				
				console.log(iseq);
				if(iseq == null){
					alert("일정을 선택해주세요.");
					return;
				}
				
				var request = $.ajax({
					type: "GET",
					url:"/Itinerary/addList",
					data: {iseq:iseq, tseq:$("input[name='tseq']").val()},
					dataType: "text",
					success : function(data){
						alert("추가되었습니다!");
						$(".modal").modal("hide");
					}
				});
			});
						
			
		});
		
		$(document).ready(function(){
			$('#listbtn').on("click", function(){
				location.href="/Trip/Tourlist";
			});
		});
		</script>
<%@ include file="../includes/footer.jsp" %>