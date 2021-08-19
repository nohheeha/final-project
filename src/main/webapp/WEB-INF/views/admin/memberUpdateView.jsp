<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/adminheader.jsp" %>

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


		
			<div class=" col-lg-8 col-md-8 col-sm-8 col-xs-12">
			<div class="row4">
				<h3>사용자 정보 수정</h3><br><br>
				<form action = "/admin/adminUpdate" method="post" id="updateForm">
	
				<div class="col-md-6">
        		<div class="form-group">
					<label class="control-label">아이디</label>
					<input  class="form-control"  type="text"  name="id" value="${member.id}" readonly="readonly"/>
				</div>
				</div>
							    			
				<div class="col-md-6">
			    <div class="form-group">
					<label class="control-label">이름</label>
					<input class="form-control"  type="text" name="name" id="name" size="15" value="${member.name }"  />
				</div>
				</div>
				
				<div class="col-md-6">
        		<div class="form-group">
					<label class="control-label">성별</label><br>
					남<input type="radio"  name="gender"  value="1" ${member.gender==1? 'checked':'' } onclick="return(false);" />&nbsp;&nbsp;
					여<input type="radio"  name="gender"  value="2" ${member.gender==2? 'checked':'' } onclick="return(false);"/>
				</div>
				</div>
				
				<div class="col-md-6">
		        <div class="form-group">
					<label class="control-label">이메일주소</label>
					<input class="form-control" type="email" name="email" size="27" placeholder="abcd@domain.com" value="${member.email }" readonly="readonly"  />
				</div>
				</div>
			
				<div class="col-md-6">
		        <div class="form-group">
					<label class="control-label">전화번호</label>
					<input class="form-control" type="phone" size="20" name="phone" placeholder="000-0000-0000" value="${member.phone }" readonly="readonly" >
				</div>
				</div>
				
				<div class="col-md-6">
        		<div class="form-group">
				<label class="control-label">권한</label>
				<select name="auth">
					<option value="ROLE_USER">회원</option>
					<option value="ROLE_ADMIN">관리자</option>
				</select>
				</div>
				</div>
				
				<div class="col-md-12">
		          <div class="form-group">
					<button class="btn btn-primary5"  type="submit" id="submit">수정완료</button>
					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				</div>
				</div>		
			</form>	
				  
			
		</div>
	</div>
	
<%@ include file="../includes/footer.jsp" %>	
