<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authorize access="hasRole('ROLE_USER')">
<%@ include file="../includes/header.jsp" %>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<%@ include file="../includes/adminheader.jsp" %>
</sec:authorize>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link href="/resources/css/styles4.css" rel="stylesheet">
	<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	
	<style>
		#sortable, #getDirections { list-style-type: none; margin: 0; padding: 0; width: 100%; }
		#sortable li { margin: 0 15px 5px 5px; padding: 0.5em; padding-left: 1.5em; font-size: 1em; height: 50px; }
		#getDirections li { margin: 0 5px 5px 15px; padding: 0.5em; padding-left: 1.5em; font-size: 1em; height: 80px; }
		#sortable li span, #getDirections li span { position: absolute; margin-left: -1.3em; }
		
		#sidebar{
			width:350px;
			height:500px;
			float:left;
		}
		
		#contents{
			width:700px;
			height:500px;
			float:left;
		}
	</style>
 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div style="position: absolute; left:50%; margin-top:190px; margin-left:-700px;">
 	<div><button id="getItinerary" class="btn btn-primary">일정 불러오기</button></div>
 	<br>
 	<div><h5 id="title" style="display:inline;"> 일정을 불러와주세요</h5></div>
 	<div style="text-align: center; margin-left: 860px; margin-top: -27px;"><h5 style="display:inline; ">< 경로 찾기 ></h5></div><br>
	<aside id="sidebar">
		<ul id="sortable"></ul>
<!-- 		<ul id="sortable"> -->
<%-- 			<c:forEach items="${list }" var="n"> --%>
<!-- 				<li class="ui-state-default"> -->
<!-- 					<span class="ui-icon ui-icon-arrowthick-2-n-s"></span> -->
<%-- 					<span class="value" style="padding-left:20px">${n.title }</span> --%>
<%-- 					<input type="hidden" name="mapx" value="${n.mapx }"> --%>
<%-- 					<input type="hidden" name="mapy" value="${n.mapy }"> --%>
<!-- 					<button style="margin-left: 200px" class="deleteElement">삭제</button> -->
<!-- 				</li> -->
<%-- 			</c:forEach> --%>
<!-- 		</ul> -->
<!-- 		<button id="save">저장</button> -->
    </aside>
    <section id="contents">
		<div id="map" style="width:100%;height:100%;"></div>
    </section>
    <aside id="sidebar">
    	<ul id="getDirections">
<%-- 			<c:forEach items="${list }" var="n"> --%>
<!-- 				<li class="ui-state-default"> -->
<!-- 					<span>얌얌</span> -->
<!-- 				</li> -->
<%-- 			</c:forEach> --%>
		</ul>
    </aside>
    </div>
	
	<!-- 모달 -->
	<div class="modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">내 일정 불러오기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>일정을 선택해주세요.</p>
	        <form action="/Itinerary/getList">
	        	<div class="radio"></div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="getList">불러오기</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 모달 끝 -->
	
	<input type="hidden" name="id" value="<sec:authentication property='principal.username'/>">
	
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=60f99238bae6b22b4189e9b363484954"></script>
	<script>
	
	$( function() {
		var radio = $(".radio");
		
		$("#getItinerary").on("click", function(){	// 일정 불러오기 버튼 눌렀을 때
			
			var id = $("input[name=id]").val();
		
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
			
			$(".modal").modal("show");
		});
		
		$("#getList").on("click",function(){	// 모달창에서 불러오기 버튼을 눌렀을 때
			var iseq = $("input[name='iseq']:checked").val();
			
			if(iseq == null){
				alert("일정을 선택해주세요.");
				return;
			}
			console.log(iseq);
			
			var request = $.ajax({
				type: "GET",
				url:"/Itinerary/getList",
				data: {iseq:iseq},
				dataType: "json",
				success : function(data){
					console.log(data);
					
					if(data==null){
						alert("추가된 여행지가 없습니다.")
						return;
					}
					
					$("#title").html("&nbsp;<"+$("label[for='"+iseq+"']").text()+" >");
					console.log(data[0]['title']);
					var str = "";
					str += "<ul id='sortable'>";
					for(var i in data){
						str += "<li class='ui-state-default'>";
						str += "<span class='ui-icon ui-icon-arrowthick-2-n-s'></span>"
						str += "<span class='value' style='padding-left:20px'>"+data[i]['title']+"</span>";
						str += "<input type='hidden' name='tseq' value='"+data[i]['tseq']+"'>";
						str += "<input type='hidden' name='mapx' value='"+data[i]['mapx']+"'>";
						str += "<input type='hidden' name='mapy' value='"+data[i]['mapy']+"'>";
						str += "<input type='hidden' name='address' value='"+data[i]['address1']+(data[i]['address2']==null? "":data[i]['address2'])+"'>";
						str += "<input type='hidden' name='image' value='"+data[i]['image1']+"'>";
						str += "<button style='margin: 0 0 0 250px' class='btn btn-sm btn-outline-secondary deleteElement'>삭제</button>";
						str += "</li>";
					}
					str += "</ul>";
					str += "<input type='hidden' name='iseq' value='"+iseq+"'>";
					str += "<button class='btn btn-warning' style='margin-left: 20px' id='save'>저장</button>";
					$("#sortable").html(str);
					$(".modal").modal("hide");
					readMap();
				}
				
			});
		})
		
		// ==================================================================================
		
		$( "#sortable" ).sortable();
    	$( "#sortable" ).disableSelection();
    	
    	$("body").on("click", ".deleteElement", function() {	// 삭제버튼 누를 때
        	$(this).parent().remove();
    		readMap();
		});

    	
    	var latLngArray = new Array();
    	
    	function readMap(){
    		latLngArray.length = 0;
    		$(".value").each(function( index, element ) {
    			latLngArray.push([$(this).siblings("input[name='mapy']").val(),
    							$(this).siblings("input[name='mapx']").val(),
    							$(this).text(),
    							$(this).siblings("input[name='address']").val(),
    							$(this).siblings("input[name='image']").val()
    							]);
    		   });
    		console.log(latLngArray);
    		makeMarker(latLngArray);
    		getDirections(latLngArray);
    	}
		
    	readMap();
    	
    	$("#sortable").on("mouseup", readMap);
    	
    	$("body").on("click", "#save", function(){		// 저장버튼 눌렀을 때
    		var tseqList = new Array();
    		 $(".value").each(function( index, element ) {
    			 tseqList.push($(this).siblings("input[name='tseq']").val());
    		   });
    		 console.log(tseqList);
    		 
    		 var iseq = $("input[name='iseq']").val();
    		 
    		 var request = $.ajax({
    				type: "POST", //요청 메소드 방식
    				url:"/Itinerary/save",
    				data: {"tseqList":tseqList.toString(), "iseq":iseq},
    				dataType: "text",
    				success : function(data){
    					console.log(data);
    					alert("저장되었습니다!");
    				}
    				
    			});
    		 
    	});
    	
    	
	});
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.3928371966049, 126.55121939899229), // 지도의 중심좌표
		        level: 10, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 
		
		function makeMarker(latLngArray){
			// 지도를 생성한다 
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			var marker = new Array();
			
			for(var i in latLngArray){
				marker[i] = new kakao.maps.Marker({
				    position: new kakao.maps.LatLng(latLngArray[i][0], latLngArray[i][1]), // 마커의 좌표
				    map: map, // 마커를 표시할 지도 객체
				});
				
				// 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: '<div class="wrap">'
			        		+'<div class="info" style="margin:5px 5px 5px 5px;">'
			        			+'<div class="title"><b>'+latLngArray[i][2]+'</b></div>'
			        			+'<div class="body">'
			        				+'<div class="img" style="float:left; margin:8px 8px 0 0;"><img src="'+latLngArray[i][4]+'" width="90px" height="80px"></div>'
			        				+'<div class="desc">'
				        				+'<div class="num">'+(i-1+2)+'번째 여행지'+'</div>'
				        				+'<div class="address">'+latLngArray[i][3]+'</div>'
			        				+'</div>'
			        			+'</div>'
			        		+'</div></div>'// 인포윈도우에 표시할 내용
			    });

			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker[i], 'mouseover', makeOverListener(map, marker[i], infowindow));
			    kakao.maps.event.addListener(marker[i], 'mouseout', makeOutListener(infowindow));
			
			}
			
	    	
			var markerPosition = new Array();
			for(var i in marker){
				markerPosition.push(marker[i].getPosition());
			}
			
			
			// 지도에 선을 표시한다 
			var polyline = new kakao.maps.Polyline({
				map: map, // 선을 표시할 지도 객체 
				path: markerPosition,
				endArrow: true, // 선의 끝을 화살표로 표시되도록 설정한다
				strokeWeight: 3, // 선의 두께
				strokeColor: '#FF0000', // 선 색
				strokeOpacity: 0.9, // 선 투명도
				strokeStyle: 'solid' // 선 스타일
			});	
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    	function makeOverListener(map, marker, infowindow) {
    	    return function() {
    	        infowindow.open(map, marker);
    	    };
    	}

    	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    	function makeOutListener(infowindow) {
    	    return function() {
    	        infowindow.close();
    	    };
    	}
    	
    	function getDirections(latLngArray){
    		var str = "";
    		str += "<ul id='getDirections'>";
			for(var i=0; i<latLngArray.length-1; i++){
				str += "<li class='ui-state-default'>";
				str += "<a href='http://map.naver.com/index.nhn?";
				str += "slng="+latLngArray[i][1];
				str += "&slat="+latLngArray[i][0];
				str += "&stext="+latLngArray[i][2];
				str += "&elng="+latLngArray[i+1][1];
				str += "&elat="+latLngArray[i+1][0];
				str += "&etext="+latLngArray[i+1][2];
				str += "&pathType=0&showMap=true&menu=route&pathType=1' target='_blank' title='길찾기 링크로 이동'>";
				str += latLngArray[i][2]+"<br>&nbsp;&nbsp;=> "+latLngArray[i+1][2];
				str += "</a>";
				str += "</li>";
			}
			str += "</ul>";
			$("#getDirections").html(str);
    	}

	</script>
	
<%@ include file="../includes/footer.jsp" %>