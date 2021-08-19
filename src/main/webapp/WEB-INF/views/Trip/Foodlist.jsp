<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/styles4.css" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet">
	
</head>

	<div style="padding-top:200px;text-align: center;">
	<h2>맛집 List</h2><br>

		<a href="/Trip/Tourlist">관광지 |</a>
		<a href="/Trip/Lodgelist">숙박 | </a>
		<a href="/Trip/Shoplist">쇼핑 | </a>
		<a href="/Trip/Foodlist">맛집</a>
	</div>
	<br>
	
	<div class="search">
    <select class="form-select" id="exampleSelect1" name="type">
      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    </select>

    <input class="form-control col-md-2" type="text"  placeholder="Search" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" class="btn2 btn-primary8" type="button">검색</button>

	   	
	 	<div class="row3">
	   	<c:forEach items="${foodlist}" var="vo" >
                <!-- service start -->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="service-block">
                        <div class="service-img">
                            <a href="/Trip/TourView?tseq=${vo.tseq}"><img src="${vo.image1}" width="420px" height="320px"  alt="Tour and Travel Agency - Responsive Website Template"></a>
                        </div>
                        <div class="service-content">
                            <h3><a href="/Trip/TourView?tseq=${vo.tseq}">${vo.title}</a></h3>
                            <p>${vo.address1}</p>
                           <div><img src="/resources/images/heart.png">&nbsp; <b>${vo.likecnt}</b></div>
                        </div>
                    </div>
                </div>

        	</c:forEach>
        	  </div>
	   	
	   	
<div>
	<ul class="pagination">
	 <li class="page-item disabled">
	    <c:if test="${pageMaker.prev}">
	    	<li class="page-item">
	    	<a class="page-link" href="Foodlist${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
	    	</li>
	    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li class="page-item">
    	<a class="page-link" href="Foodlist${pageMaker.makeSearch(idx)}">${idx}</a>
    	</li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
   		<li class="page-item">
    	<a class="page-link" href="Foodlist${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
    	</li>
    </c:if> 
   </li>
  </ul>  
</div>


    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "Foodlist" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>

<%@ include file="../includes/footer.jsp" %>
