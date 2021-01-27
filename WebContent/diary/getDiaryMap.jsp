<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>내 기록 지도</title>
	    
	   	<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
		<style>
		/* 너비와 높이가 지정되어 있지 않으면 지도가 읽어지지 않음(에러는 안남, 안보임) */
		#map {
			width: 100%;
			height: 550px;
		}
		div.wrap {
            width: 200px;
        }
        div.text-box {
            text-align: center;
        }
        h6 {
            margin: 10px auto 0;
        }
	    </style>
	    
	  	<!-- Google 지도 API 사용 스크립트 추가 -->
  		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABfHCGnA7XGz4lch9JFD8ECEu2BuuKHOI&callback=initMap"async defer></script>
  		
	    
		<script>
		
		var diaryContent = [];
		
		function initMap() {
			
		      var map = new google.maps.Map (
		        document.getElementById('map'), { zoom: 2, center: { lat: 35.85501664867628, lng: 126.96168749999998 }, })
		      
	          var flagIcon = new google.maps.MarkerImage("../resources/images/flag.png"); // 마커 아이콘
		      
		      // DB에 있는 장소 마커 표시
		      $.ajax({
		        type: 'GET',
		        url: '/diary/rest/getDiaryList',
		        success: function (data) {
		        	
		        	// 인포윈도우
		            var infowindow = new google.maps.InfoWindow();
		        	
		            for (var i = 0; i < data.totalCount; i++) {
		              var latLng = { lat: data.diaryList[i].latitude, lng: data.diaryList[i].longitude }
		               
					  // 마커 생성
		              var marker = new google.maps.Marker({ 
		            	  position: latLng, 
		            	  map: map, 
		            	  title: data.diaryList[i].title,
		            	  icon: flagIcon
		              });
		              
					  // 마커에 이벤트 생성 (info window 창 띄워줌) 
		              google.maps.event.addListener(marker, 'click', (function(marker, i) {
		                    return function() {
		                        infowindow.setContent('<div class="wrap"><div class="text-box"><a href="/diary/getDiary?diaryNo='+data.diaryList[i].diaryNo+'&status=own"><h6>'+data.diaryList[i].title+'</h6><a><p><img src="../resources/images/marker_blue.png" height="10px" align="middle">&nbsp;'+data.diaryList[i].location+'</p><p>'+data.diaryList[i].startDate+'-'+data.diaryList[i].endDate+'</p><p></div></div>');
		                        infowindow.open(map, marker);
		                    }
		              })(marker, i));

		              console.log(data.diaryList[i].title);
		            }
		        }
		      });
		      
		}
		</script>
	
	</head>

	<body>
	  	<!-- ======= Header ======= -->
		<header>
			<jsp:include page="../layout/toolbar.jsp"/>
		</header><br/><br/>
		<!-- End Header -->

	<div class="container">
		<div class="row">
			<!-- ======= Diary Left ToolBar ======= -->
			<div class="col-md-3">
  				<jsp:include page="../diary/leftbar.jsp" />
			</div>
			<!-- End ToolBar -->

			<div class="col-md-9">

				<div id="map"></div>

			</div>
		</div>
	</div>

  	
	</body>
</html>