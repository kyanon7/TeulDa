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

		
		<style>
			.col-md-3 {
			  position: relative;
    		  z-index: 1;
			}
			.col-md-9 {
			  position: relative;
    		  z-index: 2;
			}
			.card-img-top {
			  position: relative;
			  z-index: 3;
			}
			.card-img-top {
			  transform: scale(1);
			  -webkit-transform: scale(1);
			  -moz-transform: scale(1);
			  -ms-transform: scale(1);
			  -o-transform: scale(1);
			  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
			}
			.card-img-top:hover {
			  transform: scale(2.7);
			  -webkit-transform: scale(2.7);
			  -moz-transform: scale(2.7);
			  -ms-transform: scale(2.7);
			  -o-transform: scale(2.7);
			  z-index: 4;
			}
			/* .card-body {width:325px; height:280px; overflow:hidden }   /* 부모를 벗어나지 않고 내부 이미지만 확대 */ */
		</style>
		
		<script>

		$(function(){
			$("#addPhoto").on("click", function(){
				if($('form[name="fileForm"]').css("display") == "none"){
				    $('form[name="fileForm"]').show();
				} else {
				    $('form[name="fileForm"]').hide();
				}	
			});
		});
		
		$(function(){
			$("input[type='submit']").on("click", function(){
				alert("click")
				if(("#photoAddr").val() == null){
					alert("주소를 입력해주세요.")
				}
			})
		})
		
		$(function(){
			
			$("p:contains('삭제')").on("click", function () {
				$.ajax(
						{
							url : "/photo/rest/updatePhotoStatus" ,
							method : "POST" ,
							dataType : "text" ,
							data : {
								photoNo : $(this).children('input').val()
							},
							success : function(result) {
								if (result == "Success") {
									alert("사진이 삭제되었습니다.");
									location.reload(); // 리로드 안하고 할 수 있게 해보기 
								} else {
									alert("사진이 삭제되지 않았습니다.");
								}
							}
							
				});
				
			});
		})
		
		$(function(){
			$("img[src='../resources/images/folder.png']").on("click", function() { 
				window.open('/photo/selectPhotoGroup?photoNo='+$(this).attr('id'), "그룹 선택", "width=1200, height=450, left=750, top=250");
			});
		});
		
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
				
			<div class="col-md-3">
				<div class="list-group">
					<button type="button" class="btn btn-link disabled">~ 사진, 사진을 보자 ~</button>
					<button type="button" id="addPhoto" class="btn btn-outline-info"> + 사진등록</button><br/>
						<form name="fileForm" action="/photo/addPhoto" method="post" enctype="multipart/form-data" style="display:none;">
							<input multiple="multiple" type="file" name="file"/>
							<input type="hidden" name="groupNo" value="${groupNo}"/>
							<input type="text" id="photoAddr" name="photoAddr" style="" placeholder="주소를 입력해주세요" value=""/>
							<input type="submit" class="btn btn-outline-info" value="사진등록" />
						</form><br/>
					<a href="/photo/listPhoto" class="list-group-item list-group-item-action active"><center>내 사진 목록&nbsp&nbsp${totalCount}</center></a>
					<a href="/photo/photoBin" class="list-group-item list-group-item-action"><center>사진 휴지통</center></a>
				</div>
			</div>
		
		<div class="col-md-9">
			<div class="list-group">
			<a href="#" class="list-group-item list-group-item-action active">공지!!) 사진 등록이 되지 않을 경우 파일 이름이 한글이 아닌지 확인해 주시기 바랍니다!!</a><br/><br/>
				<div class="row"> 
					<c:set var="i" value="0" />
						<c:forEach var = "photo" items = "${ photoList }">
						<c:set var="i" value="${ i+1 }" />
							<div class="col-md-4">
								<div class="card bg-secondary mb-3" style="max-width: 20rem; height: 25em;">
									<div class="card-header" style="color:black">
										${photo.photoAddr}
										<input type="hidden" id="updateGroupName" value="${photo.photoName}">
										<img src="../resources/images/folder.png" id="${ photo.photoNo }" height="13px" align="middle" style="float:right;">
									</div>
									<div class="card-body">
										<h5 class="card-title" id ="${photo.photoNo}"></h5>
										<img class="card-img-top" src="/albumImage/${photo.photoName}" width="210px" height="210px"/>
										<p class="card-text" id="content">등록일 : ${photo.photoDate }
										<p class="card-text" style="text-align:right;"><small class="text-muted">삭제</small>
										<input type="hidden" value="${ photo.photoNo }" style="float:right;"></p>
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