<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<head>

<!-- Bootstrap -->
    
    <!-- Style CSS -->
    <link href="/resources/css/styles2.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet">

</head>

<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancel").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#id").focus();
					return false;
				}
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				if($("#name").val()==""){
					alert("성명을 입력해주세요.");
					$("#name").focus();
					return false;
				}
				
				if($("#password").val()!=$("#pwdCheck").val()){
					alert("비밀번호를 확인해주세요")
					$("#pwdCheck").focus();
					return false;
				}
				
			});
			
		})
		
		function fn_idChk(){
			$.ajax({
				url : "../Member/idChk",
				type : "post",
				dataType : "json",
				data : {"id" : $("#id").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "중복체크");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>

<div class=" col-lg-8 col-md-8 col-sm-8 col-xs-12">
<div class="row4">


	<h1>회원가입</h1>
	<form action="../Member/register" method="post" id="regForm">
		
		<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">아이디</label>
	    	<input class="form-control" type="text" name="id" id="id" size="15" required="required" />
	    	<input class="btn btn-primary" type="button" id="idChk" name="idChk" onclick="fn_idChk();" value="중복체크">
        </div>
        </div>
        
    	<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">비밀번호</label>
	    	<input class="form-control" type="password" name="password" id="password" size="15" required="required" />
        </div>
        </div>
                                 
        <div class="col-md-6">
        <div class="form-group">
	    	<label class="control-label">비밀번호확인</label>
	    	<input class="form-control" type="password" name="pwdCheck" id="pwdCheck" size="15" required="required" />
        </div>
        </div>
                               
		<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">이름</label>
			<input class="form-control" type="text" name="name" id="name" size="15" required="required" />
		</div>
		</div>
		
		<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">성별</label><br>
				남<input type="radio"  name="gender"  value="1" checked="checked" />&nbsp;&nbsp;
				여<input type="radio"  name="gender"  value="2" />
		</div>
		</div>
		
		<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">이메일주소</label>
			<input class="form-control" type="email" name="email" size="27" placeholder="abcd@domain.com" required="required" />
		</div>
		</div>
		
		<div class="col-md-6">
        <div class="form-group">
			<label class="control-label">전화번호</label>
			<input class="form-control" type="phone" size="20" name="phone" placeholder="000-0000-0000" required="required">
		</div>
		</div>
		
		  <div class="col-md-12">
          <div class="form-group">
        	<input class="btn btn-primary5" type="submit" id="submit" value="회원가입">
			<input class="btn btn-primary9" onclick="history.back(-1);" type="reset" value="뒤로가기" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
       	</div>
       	</div>
       	</form>
         </div>
         </div>
                            	
		
        

	
<%@ include file="../includes/footer.jsp" %>