<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>MAIN</title>
	    
	   	<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
		<style>
		h4 {
			text-align:center;
		}
		</style>
		<script>
		$(function() {

			$(".getDiary").on("click",function() {
				self.location = "/diary/getDiary?diaryNo="+ $(this).attr('id');
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
		<div class="row">
			<div class="col-md-10">
  					<input type="text" name="searchKeyword" class="form-control"
								placeholder="검색어 입력" id="inputDefault"
								value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
			</div>
			<div class="col-md-2">
  				<button type="button" class="btn btn-primary"> S e a r c h </button>
  			</div>
  	    </div>
  	    
  	    <br>
  	    <b>많이 사용된 해시태그 뽑아온건데.. 뷰를 어떻게 하면 좋을까요? >> </b>
  	    <c:set var="i" value="0" />
		<c:forEach var="hashTag" items="${ topUseHashTagList }">
			<c:set var="i" value="${ i+1 }" />
			<span class="badge badge-info" id="listDiary"> 
				<input type="hidden" value="${ hashTag.hashTagName }"> ${ hashTag.hashTagName }
			</span>&nbsp;&nbsp;
		</c:forEach>
		
  	    <br><br>

		<h4><img src = "/resources/images/crown.png" width="20px">&nbsp; top view count diary <img src = "/resources/images/crown.png" width="20px"></h4>
  	    <div class="row">
  	    	<c:set var="i" value="0" />
  	    	<c:forEach var="diary" items="${ topViewDiaryList }">
  	    		<c:set var="i" value="${ i+1 }" />
  	    		<div class="col-md-4">
					<div class="card border-light mb-3" style="max-width: 20rem;">
  						<div class="card-header">${ diary.nickname }</div>
  						<div class="getDiary" id="${ diary.diaryNo }">
 							<div class="card-body">
 							<h5 class="card-title">
 								<img src="../resources/images/marker_blue.png" height="11px" align="middle"><small>&nbsp; ${ diary.location }</small></h5>
    						<h5 class="card-title">${ diary.title }</h5>
    						<p class="card-text"><img src = "/resources/images/example.jpg" width="270px" height="270px"></p>
 				 			</div>
 				 		</div>
					</div>
				</div> 
			</c:forEach>
  	    </div> 
  	    
  	    <br><br>
  	    <h4><img src = "/resources/images/crown.png" width="20px">&nbsp; top bookmark count diary <img src = "/resources/images/crown.png" width="20px"></h4>
  	    <div class="row">
  	    	<c:set var="i" value="0" />
  	    	<c:forEach var="diary" items="${ topBookmarkDiaryList }">
  	    		<c:set var="i" value="${ i+1 }" />
  	    		<div class="col-md-4">
					<div class="card border-light mb-3" style="max-width: 20rem;">
  						<div class="card-header">${ diary.nickname }</div>
  						<div class="getDiary" id="${ diary.diaryNo }">
 							<div class="card-body">
 							<h5 class="card-title">
 								<img src="../resources/images/marker_blue.png" height="11px" align="middle"><small>&nbsp; ${ diary.location }</small></h5>
    						<h5 class="card-title">${ diary.title }</h5>
    						<p class="card-text"><img src = "/resources/images/example2.jpg" width="270px" height="270px"></p>
 				 			</div>
 				 		</div>
					</div>
				</div> 
			</c:forEach>
  	    </div> 
  	    
	</div>

  	
	</body>
</html>