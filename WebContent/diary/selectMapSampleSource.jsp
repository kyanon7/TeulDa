<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>Select Your Place!</title>
	    
	    <style>
	    	/* 너비와 높이가 지정되어 있지 않으면 지도가 읽어지지 않음(에러는 안남, 안보임) */
	    	#map{
	    		width: 50%;
	    		height: 400px;
	    	}
	    </style>
	    
	    <!-- Google 지도 API 사용 스크립트 추가 -->
  		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABfHCGnA7XGz4lch9JFD8ECEu2BuuKHOI&callback=initMap"async defer></script>
  		
  		<script>
        function showMap(){
            //지도가 보여질 요소 찾아오기
            var e= document.getElementById('map');
 
            // Goolgle지도 객체 생성 및 e요소 보여주기!!
            new google.maps.Map(e, {center:{lat:37.562161, lng:127.035199}, zoom:14});
        }
        function showMarker(){
            
            // 지도가 보여질 요소
            var e= document.getElementById('map');
 
            // 원하는 좌표 객체
            var mrhi= new google.maps.LatLng(37.562161, 127.035199);
 
            // 표시되는 지도의 옵션 객체
            var opts= {
                center: mrhi,
                zoom: 14
            };
 
            // 지도 보이기
            var map=new google.maps.Map( e , opts );
 
            // 지도에 붙일 마커객체 생성
            var marker= new google.maps.Marker( {
                position: mrhi,
                title:"미래능력개발교육원" // 마커에 마우스를 놓고 있으면 보이는 tootip(말풍선)
            } );
 
            // 지도 객체에 마커 추가하기
            marker.setMap(map);
 
            // 마커 클릭 이벤트 반응하기
            marker.addListener('click', function(){
                open('http://www.mrhi.or.kr', '_blank');
            });
            
            // 두번째 마커 추가.. 및 마커 이미지 변경
            var station= new google.maps.LatLng(37.561196, 127.038498); //왕십리역 좌표
            
            //마커 이미지의 경로
            var img= 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
           
            var marker2= new google.maps.Marker( {
                position: station,
                title:"왕십리역",
                icon: img,
                map: map //이렇게 마커를 만들면서 map객체에 추가시킬 수 있음. setMap()
            } );
 
            // 마커2 클릭시에 애니메이션 적용
            marker2.addListener('click', function(){
                // 마커가 바운스..(무한 반복)
                // marker2.setAnimation(google.maps.Animation.BOUNCE);
 
                if(marker2.getAnimation()==null){
                    marker2.setAnimation(google.maps.Animation.BOUNCE);
                }else{
                    marker2.setAnimation(null);
                }
            });
 
            // 마커가 보여질 때 애니메이션 처리도 가능함..(여러개 마커들에 동시에)
 
             //왕십리역 약국들...구글지도에서 좌표값들 얻어왔음.
             var pharmacys=[
                    ['희망약국', 37.562516, 127.035679],
                    ['이수프라자약국', 37.561155, 127.034560],
                    ['연세우리약국', 37.560710, 127.035978],
                    ['왕십리약국', 37.562162, 127.032171]
                ];
 
                for(var i=0; i<pharmacys.length; i++){
                    var title= pharmacys[i][0];
                    var pos= new google.maps.LatLng(pharmacys[i][1], pharmacys[i][2]);
 
                    var m= new google.maps.Marker({
                        position: pos,
                        title: title,
                        icon: "../resources/images/marker_icon.png",
                        map: map,
                        animation: google.maps.Animation.DROP,
                    });
 
                    m.addListener('click', function(){
                        alert(this.getTitle());
                    })
 
            }//for..
 
        }
    </script>
	</head>
	
	
	<body>
  	
  		<button onclick="showMap()">show map</button>
  		<button onclick="showMarker()">show marker</button>
  		
  		<!-- 지도 타일 이미지들을 보여줄 영역 div 요소 -->
  		<div id="map"></div>
  		
	</body>
</html>