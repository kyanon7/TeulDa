<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8" />
	    <title>여행지 사진</title>

<style>
/* 너비와 높이가 지정되어 있지 않으면 지도가 읽어지지 않음(에러는 안남, 안보임) */
#map {
	width: 100%;
	height: 550px;
}

#description {
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
}

#infowindow-content .title {
	font-weight: bold;
}

#infowindow-content {
	display: none;
}

#map #infowindow-content {
	display: inline;
}

.pac-card {
	margin: 10px 10px 0 0;
	border-radius: 2px 0 0 2px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	outline: none;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	background-color: #fff;
	font-family: Roboto;
}

#pac-container {
	padding-bottom: 12px;
	margin-right: 12px;
}

#pac-input {
	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	margin-left: 12px;
	margin-top: 10px;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 400px;
}

#pac-input:focus {
	border-color: #4d90fe;
}

#title {
	color: #fff;
	background-color: #4d90fe;
	font-size: 25px;
	font-weight: 500;
	padding: 6px 12px;
}

#target {
	width: 345px;
}
</style>

		<!-- For Plases Search Box cdn -->
		<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
		
		<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
		<script>
		function initAutocomplete() {
	        const map = new google.maps.Map(document.getElementById("map"), {
	          center: { lat: 35.85501664867628, lng: 126.96168749999998 },
	          zoom: 2,
	          mapTypeId: "roadmap",
	        });
	        // Create the search box and link it to the UI element.
	        const input = document.getElementById("pac-input");
	        const searchBox = new google.maps.places.SearchBox(input);
	        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
	        // Bias the SearchBox results towards current map's viewport.
	        map.addListener("bounds_changed", () => {
	          searchBox.setBounds(map.getBounds());
	        });
	        let markers = [];
	        // Listen for the event fired when the user selects a prediction and retrieve
	        // more details for that place.
	        searchBox.addListener("places_changed", () => {
	          const places = searchBox.getPlaces();

	          if (places.length == 0) {
	            return;
	          }
	          // Clear out the old markers.
	          markers.forEach((marker) => {
	            marker.setMap(null);
	          });
	          markers = [];
	          // For each place, get the icon, name and location.
	          const bounds = new google.maps.LatLngBounds();
	          places.forEach((place) => {
	            if (!place.geometry) {
	              console.log("Returned place contains no geometry");
	              return;
	            }
	            const icon = {
	              url: place.icon,
	              size: new google.maps.Size(71, 71),
	              origin: new google.maps.Point(0, 0),
	              anchor: new google.maps.Point(17, 34),
	              scaledSize: new google.maps.Size(25, 25),
	            };
	            // Create a marker for each place.
	            markers.push(
	              new google.maps.Marker({
	                map,
	                icon,
	                title: place.name,
	                position: place.geometry.location,
	              })
	            );

	            if (place.geometry.viewport) {
	              // Only geocodes have viewport.
	              bounds.union(place.geometry.viewport);
	            } else {
	              bounds.extend(place.geometry.location);
	            }
	          });
	          map.fitBounds(bounds);
	        });
	        
	        //////// 위도 & 경도 좌표 받아오기 ////////
	        
	        // 각 값들을 가지고 옴 
	        var geocoder = new google.maps.Geocoder;
	        
	        // 클릭한 위치 확인
	        map.addListener('click', function(e) {
	        	
	        	alert(e.latLng.lat());
	        	// console.log(e);
	        	
	        	// 위도 & 경도 좌표를 요청할 객체를 만들어 줌
	        	var latlng = {
	        		lat: e.latLng.lat(), // 위도
	        		lng: e.latLng.lng()  // 경도 
	        	};
	        	
	        	console.log(latlng);
	        	
	        	geocoder.geocode({'location' : latlng}, function(results, status) {
	        		
	        		if (status === "OK")
	        		{
	        			var jData = results; // results : Json 형태
	        			var address = jData[3]; // Json 형태의 배열중 3번째 주소를 가져옴 (나라-시-동-(면-리) 까지) 
	        			console.log('******************');
	        			console.log(address.formatted_address);
	        			console.log(latlng);
	        			
// 	        			//ajax 이용하여 서버에 위치, 위도, 경도 값 전달 
// 	        			$.ajax({
// 	        				url: "/diary/showAddDiaryView",
// 	        				method : "POST" ,
// 	        				dataType : "json" ,
// 	        				headers : {
// 	    						"Accept" : "application/json",
// 	    						"Content-Type" : "application/json"
// 	    					},
// 	        				data: JSON.stringify ({
// 	        					location : address.formatted_address,
// 	        					latitude : latlng.lat,
// 	        					longitude : latlng.lng
// 	        				}),
// 	        				success:function(status) {
// 	        					if(status.resultCode==200) {
// 		        					alert("성공!");
// 	        					}
// 	        				}
// 	        			});

					location.href="addDiary.jsp?location="+address.formatted_address+"&latitude="+latlng.lat+"&longitude="+latlng.lng;
	        				
	        			//console.log(results);
	        			//alert(results);
	        			//alert(JSON.stringify(results));
	        		} else {
	        			alert("주소를 못 가지고 왔습니다. 사람 사는 곳이 아닌 것 같습니다.");
	        		}
	        	}); 
	        	
	        });
	        
	      }
		</script>
		
		<!-- Google 지도 API 사용 스크립트 추가 -->
		<script
      	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABfHCGnA7XGz4lch9JFD8ECEu2BuuKHOI&callback=initAutocomplete&libraries=places&v=weekly" defer></script>
  		
	</head>

	<body>
  		<!-- ======= Header ======= -->
		<header>
			<jsp:include page="../layout/toolbar.jsp"/>
		</header><br/><br/>
		<!-- End Header -->

  		<div class="container">
  		
  			<div class="row">
  				<div class="col-md-3">
						<div class="list-group">
							<button type="button" class="btn btn-link disabled">~ 사진, 사진을 보자 ~</button>
							<button type="button" id="addPhoto" class="btn btn-outline-info"> + 사진등록</button><br/>
							  	<form name="fileForm" action="/photo/addPhoto" method="post" enctype="multipart/form-data" style="display:none;">
							        <input multiple="multiple" type="file" name="file"/>
							        <input type="hidden" name="groupNo" value="${groupNo}"/>
							        <!-- <input type="text" name="photoAddr" /> -->
							        <input type="text" id="photoAddr" name="photoAddr" style="height: 38pt;" placeholder="주소를 입력해주세요" value=""/>
							        <input type="submit" class="btn btn-outline-info" value="사진등록" />
							    </form><br/>
							<a href="/photo/getPhotoMap" class="list-group-item list-group-item-action active"><center>내 사진 지도</center></a>
							<a href="/photo/listPhoto" class="list-group-item list-group-item-action"><center>내 사진 목록&nbsp&nbsp${totalCount}</center></a>
							<a href="/photo/photoBin" class="list-group-item list-group-item-action"><center>사진 휴지통</center></a>
						</div>
					</div>
				
				<div class="col-md-9">
					<small id="fileHelp" class="form-text text-muted">
					<img src="../resources/images/marker_icon.png" height="12px">
					검색하여 여행지를 찾거나, 자유롭게 지도를 움직여 추억을 되짚어 가며 기록하고 싶은 여행지를 선택해 보세요.</small><br>
					<input
      					id="pac-input"
      					class="form-control"
      					type="text"
      					placeholder="Google 지도에서 원하는 여행지 검색"
    				/>
					<div id="map"></div>
				</div>
			
			</div>
  		</div>
  			
	</body>

</html>