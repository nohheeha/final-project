<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/adminheader.jsp" %>
<head>
<meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
<title>MainPage</title>

   <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
            <!-- Style CSS -->
    <link href="/resources/css/style.css" rel="stylesheet">

    <!-- FontAwesome CSS -->
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
   
</head>

        <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 h-100">
                <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-end">
                        <h1 class="text-white font-weight-bold"></h1>
                    
                    </div>
                    <div class="col-lg-8 align-self-baseline">
                        <p class="text-white-75 mb-5"></p>
                    
                    </div>
                </div>
            </div>
        </header>
        <!-- About-->
        <section class="page-section bg-primary" id="about">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2 class="text-white mt-0">제주도 여행 계획</h2>
                        <hr class="divider divider-light" />
                        <p class="text-white-75 mb-4"></p>
                        <a class="btn btn-light btn-xl" href="/Trip/Tourlist">일정계획 GO!</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services-->
   <!-- service-section start -->
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="section-title text-center">
                        <h1>인기순 여행 List</h1>
                    </div>
                </div>
            </div>
            <div class="row3">
	   	<c:forEach items="${trip}" var="vo" >
                <!-- service start -->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="service-block2">
                        <div class="service-img">
                            <a href="/Trip/TourView?tseq=${vo.tseq}"><img src="${vo.image1}" width="420px" height="320px"></a>
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
        </div>
    </div>
    <!-- service-section close -->
    
   <!-- about-section start -->
    <div class="bg-default space-medium">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="section-title text-center">
                        <h1>ITINERARY VILLAGE를 선택해야 하는 이유</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- feature start -->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="feature-block">
                        <div class="feature-icon"><i class="fa fa-building"></i></div>
                        <div class="feature-content">
                            <h3 class="feature-title">다양한 관광 정보</h3>
                            <p>여러가지 관광정보를 제공</p>
                        </div>
                    </div>
                </div>
                <!-- feature close -->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="feature-block">
                        <div class="feature-icon"><i class="fa fa-plane"></i></div>
                        <div class="feature-content">
                            <h3 class="feature-title">최적의 경로</h3>
                            <p>경로계산을 편히 볼수있는 서비스 제공</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="feature-block">
                        <div class="feature-icon"><i class="fa fa-star"></i></div>
                        <div class="feature-content">
                            <h3 class="feature-title">쉬운 여행 계획</h3>
                            <p>계획을 한눈에 </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- about-section close -->
        <!-- Portfolio-->
        <div id="portfolio">
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/resources/assets/img/portfolio/fullsize/1.jpg" title="협재해수욕장">
                            <img class="img-fluid" src="/resources/assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">관광지</div>
                                <div class="project-name">협재해수욕장</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/resources/assets/img/portfolio/fullsize/2.jpg" title="성산일출봉">
                            <img class="img-fluid" src="/resources/assets/img/portfolio/thumbnails/2.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">관광지</div>
                                <div class="project-name">성산일출봉</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/resources/assets/img/portfolio/fullsize/3.jpg" title="제주 동문시장">
                            <img class="img-fluid" src="/resources/assets/img/portfolio/thumbnails/3.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">쇼핑</div>
                                <div class="project-name">제주 동문시장</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/resources/assets/img/portfolio/fullsize/55.jpg" title="올래국수">
                            <img class="img-fluid" src="/resources/assets/img/portfolio/thumbnails/5.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">음식점</div>
                                <div class="project-name">올래국수</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/resources/assets/img/portfolio/fullsize/4.jpg" title="몽상애월드">
                            <img class="img-fluid" src="/resources/assets/img/portfolio/thumbnails/4.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">음식점</div>
                                <div class="project-name">몽상애월드</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/resources/assets/img/portfolio/fullsize/6.jpg" title="제주 레포츠랜드">
                            <img class="img-fluid" src="/resources/assets/img/portfolio/thumbnails/6.jpg" alt="..." />
                            <div class="portfolio-box-caption p-3">
                                <div class="project-category text-white-50">체험</div>
                                <div class="project-name">제주 레포츠랜드</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
   

<%@ include file="../includes/footer.jsp" %>
