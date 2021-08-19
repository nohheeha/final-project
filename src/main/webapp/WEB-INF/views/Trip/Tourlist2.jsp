<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp" %>

<head>
<meta charset="UTF-8">

<style type="text/css">
	ul li{
	    display: inline-block;
	    margin: 0;
	}
</style>

</head>
<body>

	<h1>관광지 리스트</h1>
	<ul>
		<li><a href="/Trip/Tourlist">관광지</a></li>
		<li><a href="/Trip/Lodgelist">숙박</a></li>
		<li><a href="/Trip/Shoplist">쇼핑</a></li>
		<li><a href="/Trip/Foodlist">맛집</a></li>
	</ul>
	<form role="form" method="get">
	<table border="1">
		<tr>
	    			<th>이름</th>
	    			<th>주소</th>
	     			<th>이미지</th>
	    			
	    			
	   	</tr>
	   	
	   	<c:forEach items="${tourlist}" var="vo" >
	   		<tr>
	 
	   		
	   		<td><a href="/Trip/TourView?tseq=${vo.tseq}">${vo.title}</a> </td>
	   		<td>${vo.address1} </td>
	    	<td><img src="${vo.image1}" width="300" height="150" /> </td>
	   		
	   		
	   	</tr>
	   	
	   	</c:forEach>
	   	</table>
	   	
	   	<div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="Tourlist${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="Tourlist${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="Tourlist${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>

<div class="search">
    <select name="searchType">
      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="button">검색</button>
    <script>
      $(function(){
        $("#searchBtn").click(function() {
          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>

</form>

<%@ include file="../includes/footer.jsp" %>