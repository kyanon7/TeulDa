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
  var geocoder = new google.maps.Geocoder();

  // 클릭한 위치 확인
  map.addListener("click", function (e) {
    alert(e.latLng.lat());
    // console.log(e);

    // 위도 & 경도 좌표를 요청할 객체를 만들어 줌
    var latlng = {
      lat: e.latLng.lat(), // 위도
      lng: e.latLng.lng(), // 경도
    };

    console.log(latlng);

    geocoder.geocode({ location: latlng }, function (results, status) {
      if (status === "OK") {
        var jData = results; // results : Json 형태
        var address = jData[3]; // Json 형태의 배열중 3번째 주소를 가져옴 (나라-시-동-(면-리) 까지)
        console.log("******************");
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

        location.href =
          "addDiary.jsp?location=" +
          address.formatted_address +
          "&latitude=" +
          latlng.lat +
          "&longitude=" +
          latlng.lng;

        //console.log(results);
        //alert(results);
        //alert(JSON.stringify(results));
      } else {
        alert("주소를 못 가지고 왔습니다. 사람 사는 곳이 아닌 것 같습니다.");
      }
    });
  });
}
