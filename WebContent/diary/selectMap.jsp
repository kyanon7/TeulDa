<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8" />
	    <title>여행지 선택</title>

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
	          center: { lat: -33.8688, lng: 151.2195 },
	          zoom: 13,
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
  				<!-- diary toolbar로 빼도 될 듯 -->
  				<div class="col-md-3">
  					<div class="list-group">
  					<button type="button" class="btn btn-info disabled">기록</button>
  					<button type="button" class="btn btn-outline-info">+ 새 기록 작성</button><br/>
  					<a href="#" class="list-group-item list-group-item-action active">여행 타임라인</a>
  					<a href="#" class="list-group-item list-group-item-action">내 기록 지도</a>
  					<a href="#" class="list-group-item list-group-item-action">내 기록 목록</a>
  					<a href="#" class="list-group-item list-group-item-action">북마크 기록 목록</a>
  					<a href="#" class="list-group-item list-group-item-action">스크랩 기록 목록</a>
  					<a href="#" class="list-group-item list-group-item-action">기록 휴지통</a>
					</div>
				</div>
				
				<div class="col-md-9">
					<input
      					id="pac-input"
      					class="form-control"
      					type="text"
      					placeholder="Google 지도 검색"
    				/>
					<div id="map"></div>
				</div>
			
			</div>
  		</div>
  		

	</body>
	
	
	
	
</html>