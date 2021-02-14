<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>TEULDA</title>
	    
	   	<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
		<style>
		/* button{position: absolute;top: 60%;left: 60%;margin:-100px 0 0 -100px} */
		h5{font-size: xx-large ;color :   #f5f5f5; position: absolute;top: 55%;left: 48%;margin:-100px 0 0 -100px}
		#video {
		     position: absolute;
		      top: 0;
		     left: 0;
		  /*   min-width: 0;
		     min-height: 0; */
		     width: 100%;
		     height: 100%;
		     z-index: -1;
		     overflow: hidden;
		}
		@import url('https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap');
		
		h5{
			
			 font-family: 'Nanum Brush Script', cursive;
		}
		</style>
		<script>
		$(function() {

			$("video").on("click", function() { // 검색 버튼
				self.location = "/diary/listMainRanking";
			});

		});

		</script>

	</head>

	<body>
	<div class="container">
		<div class="row">
			<h5>여행의 추억을 틀다</h5>
	<!-- 		<button type="button" class="btn btn-outline-info">Start</button> -->
		</div>
	</div>

	<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
      <source src="../resources/video/mainPage.mp4">

	</video>





	</body>
</html>