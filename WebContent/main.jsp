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
		h4 {
			text-align:center;
		}
		.card-body {
			overflow: auto;
		}
		
	#location {
		overflow: hidden;
		text-overflow: ellopsis;
		display: -webkit-box;
		-webkit-line-clamp: 2; /* 라인수 */
		-webkit-box-orient: vertical;
		word-wrap: break-word;
		line-height: 1.2em;
	}	
	
	#title {
		overflow: hidden;
		text-overflow: ellopsis;
		display: -webkit-box;
		-webkit-line-clamp: 1; /* 라인수 */
		-webkit-box-orient: vertical;
		word-wrap: break-word;
		line-height: 1.2em;
	}
		</style>
		<script>
		$(function() {

			$(".getDiary").on("click",function() {
				self.location = "/diary/getDiary?diaryNo="+ $(this).attr('id');
			});
			
			$("button:contains('S e a r c h')").on("click",function() {
				self.location = "/diary/listTotalDiary?searchKeyword="+ $('input[name=searchKeyword]').val();
			});
			
			$("#hashTag1 li").on("click",function() {
				self.location = "/diary/listTotalHashTag?hashTagName="+$(this).children('input').val().replace('#', '');
			});
			
			$("#hashTag2 li").on("click",function() {
				self.location = "/diary/listTotalHashTag?hashTagName="+$(this).children('input').val().replace('#', '');
			});

		});
		
		</script>
	
	</head>

	<body>
	  	<!-- ======= Header ======= -->
		<header>
			<jsp:include page="/layout/toolbar.jsp"/>
		</header><br/><br/>
		<!-- End Header -->

	<div class="container">
  	    
  	    <br>
		
		<h4><img src = "/resources/images/crown.png" width="20px">&nbsp; Now trending hashtags <img src = "/resources/images/crown.png" width="20px"></h4>
				
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-3">
			<ul class="list-group" id="hashTag1">
				<c:set var="i" value="0"/>
				<c:forEach var="hashTag" items="${ topUseHashTagList }" end="4">
					<c:set var="i" value="${ i+1 }" />
				<li class="list-group-item d-flex justify-content-between align-items-center">
					<span class="badge badge-primary badge-pill">${ i }
					</span> ${ hashTag.hashTagName }
					<input type="hidden" value="${ hashTag.hashTagName }">
				</li>
				</c:forEach>
			</ul>
			</div>
			
			<div class="col-md-3">
			<ul class="list-group" id="hashTag2">
				<c:set var="i" value="5"/>
				<c:forEach var="hashTag" items="${ topUseHashTagList }" begin="5" end="9">
					<c:set var="i" value="${ i+1 }" />
				<li class="list-group-item d-flex justify-content-between align-items-center">
					<span class="badge badge-primary badge-pill">${ i }
					</span> ${ hashTag.hashTagName }
					<input type="hidden" value="${ hashTag.hashTagName }">
				</li>
				</c:forEach>
			</ul>
			</div>	
			<div class="col-md-3"></div>	
		</div> 
		
	    <br> <br>
		<div class="row">
			<div class="col-md-10">
  					<input type="text" name="searchKeyword" class="form-control"
								placeholder="검색어를 입력하세요" id="inputDefault">
			</div>
			<div class="col-md-2">
  				<button type="button" class="btn btn-primary">S e a r c h</button>
  			</div>
  	    </div>

		<br><br>

		<h4><img src = "/resources/images/crown.png" width="20px">&nbsp; Most viewed diary <img src = "/resources/images/crown.png" width="20px"></h4>
  	    <div class="row">
  	    	<c:set var="i" value="0" />
  	    	<c:forEach var="diary" items="${ topViewDiaryList }">
  	    		<c:set var="i" value="${ i+1 }" />
  	    		<div class="col-md-4">
					<div class="card bg-light mb-3" style="max-width: 20rem; height: 30rem;">
  						<div class="card-header">${ diary.nickname }</div>
  						<div class="getDiary" id="${ diary.diaryNo }">
 						<div class="card-body">
 						<div class="text-card" id="location">
 							<h5 class="card-title">
 								<img src="../resources/images/marker_blue.png" height="11px" align="middle"><small>&nbsp; ${ diary.location }</small></h5>
    					</div><br/>
    					<p class="card-text"><img src="${ diary.thumbnail }" width="270px" height="270px"></p>
    					<div class="text-card" id="title">
    						<h5 class="card-title">${ diary.title }</h5>
    					</div>
 				 			<small>조회수 ${ diary.viewCount }회</small>
 				 			</div>
 				 		</div>
					</div>
				</div> 
			</c:forEach>
  	    </div> 
  	    
  	    <br><br>
  	    <h4><img src = "/resources/images/crown.png" width="20px">&nbsp; Most bookmarked diary <img src = "/resources/images/crown.png" width="20px"></h4>
  	    <div class="row">
  	    	<c:set var="i" value="0" />
  	    	<c:forEach var="diary" items="${ topBookmarkDiaryList }">
  	    		<c:set var="i" value="${ i+1 }" />
  	    		<div class="col-md-4">
					<div class="card bg-light mb-3" style="max-width: 20rem; height: 30rem;">
  						<div class="card-header">${ diary.nickname }</div>
  						<div class="getDiary" id="${ diary.diaryNo }">
 							<div class="card-body">
 						<div class="text-card" id="location">
 							<h5 class="card-title">
 								<img src="../resources/images/marker_blue.png" height="11px" align="middle"><small>&nbsp; ${ diary.location }</small></h5>
    						</div><br/>
    						<p class="card-text"><img src="${ diary.thumbnail }" width="276px" height="276px"></p>
    					<div class="text-card" id="title">
    						<h5 class="card-title">${ diary.title }</h5>
    					</div>
 				 			<small>북마크 ${ diary.bookmarkCount }회</small>
 				 			</div>
 				 		</div>
					</div>
				</div> 
			</c:forEach>
  	    </div> 
  	    
	</div>

  	
	</body>
</html>