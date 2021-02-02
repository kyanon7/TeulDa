<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8" />
	    <title>${group.groupName}</title>

		<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
		
		<script>
		
		function removeCheck() {

 			if (confirm("정말 삭제하시겠습니까??") == true){    //확인
 				document.detailForm.action="/photo/deletePhoto";
 			}else{   //취소
     			return false;
 			}
		}
		$(function(){
			$("#addPhoto").on("click", function(){
				if($('form[name="fileForm"]').css("display") == "none"){
				    $('form[name="fileForm"]').show();
				} else {
				    $('form[name="fileForm"]').hide();
				}	
			});
		});/* 
		function buttonClick(){
			if($("fileForm").css("display") == "none"){
			    $("fileForm").show();
			} else {
			    $("fileForm").hide();
			};
		}
		 */
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
  				<!-- diary toolbar로 빼도 될 듯 -->
  				  	<div class="col-md-3">
						<div class="list-group">
							<button type="button" class="btn btn-link disabled">~ 사진, 사진을 보자 ~</button>
							<button type="button" id="addPhoto" class="btn btn-outline-info"> + 사진등록</button><br/>
							  	<form name="fileForm" action="/photo/addPhoto" method="post" enctype="multipart/form-data" style="display:none;">
							        <input multiple="multiple" type="file" name="file"/>
							        <!-- <input type="text" name="photoAddr" /> -->
							        <input type="text" id="photoName" name="photoAddr" style="height: 38pt;" placeholder="주소를 입력해주세요" value=""/>
							        <input type="submit" class="btn btn-outline-info" value="사진등록" />
							    </form><br/>
							<a href="/photo/getPhotoMap" class="list-group-item list-group-item-action"><center>내 사진 지도</center></a>
							<a href="/photo/listPhoto" class="list-group-item list-group-item-action active"><center>내 사진 목록&nbsp&nbsp${totalCount}</center></a>
							<a href="/photo/photoBin" class="list-group-item list-group-item-action"><center>사진 휴지통</center></a>
						</div>
	
				</div>
				
				<div class="col-md-9">
  					<div class="list-group">
  					<a href="#" class="list-group-item list-group-item-action active">It's My Album</a><br/><br/>

		          <div class="row"> 
					<c:set var="i" value="0" />
					<c:forEach var = "photo" items = "${ photoList }">
						<c:set var="i" value="${ i+1 }" />
						<div class="col-md-4">
							<div class="card bg-secondary mb-3" style="max-width: 20rem; height: 20rem;">
								<div class="card-header">
<%-- 									<img src="../resources/images/marker_blue.png" height="12px"
										align="middle">&nbsp;&nbsp;${ diary.location } <br> --%>
									<input type="hidden" id="updateGroupName" value="${photo.photoName}">
									<small style="">${ photo.photoName}</small>
								</div>
								<div class="card-body">
									<h5 class="card-title" id ="${photo.photoNo}">${photo.photoName}</h5>
									<img class="card-img-top" src="../resources/images/photos/${photo.photoName}" alt=" "/>
									<p class="card-text" id="content">
									<p class="card-text" style="text-align:right;"><small class="text-muted">삭제</small></p>
									<p class="card-text" style="text-align:right;"><small class="text-muted">이름수정</small></p>
								<div class="groupNo" style="display:none;">${photo.photoNo}</div>
									
								</div>
							</div>
						</div>
					</c:forEach>

			    </div>
		            
					</div>
				</div>
			
			</div>
  		</div>
	</body>
	
	
	
	
</html>