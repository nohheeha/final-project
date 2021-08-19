<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

	<h1>소통 게시판</h1>
	<form action="/QnA/register" method="post">
    	<div>
			<label>제목</label>
	    	<input type="text" name="title">
        </div>
                                 
        <div>
	    	<label>내용</label>
	    	<textarea rows="5" name="content"></textarea>
        </div>
                                 
		<div>
			<label>작성자</label>
			<input type="text" name="id">
		</div>
		<button type="submit">작성</button>
		<button type="reset">취소</button>
	</form>
	
<%@ include file="../includes/footer.jsp" %>