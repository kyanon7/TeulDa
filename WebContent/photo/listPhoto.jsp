<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8" />
	    <title>내 앨범목록</title>

		<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
		<script>
		function buttonClick(){
			if($("#makeAlbum").css("display") == "none"){
			    $("#makeAlbum").show();
			} else {
			    $("#makeAlbum").hide();
			};
		}
		
		$(function(){
			
			$("p:contains('삭제')").on("click", function () {
				$.ajax(
						{
							url : "/photo/rest/updateGroupStatus" ,
							method : "POST" ,
							dataType : "text" ,
							data : {
								groupNo : $(this).children('input').val()
							},
							success : function(result) {
								if (result == "Success") {
									alert("그룹이 삭제되었습니다.");
									location.reload(); // 리로드 안하고 할 수 있게 해보기 
								} else {
									alert("그룹이 삭제되지 않았습니다.");
								}
							}
							
				});
				
			});
		})
		
 		$(function(){
			$('button:contains("만들기")').on("click", function(){
				alert($("#groupName").val());
				if($("#groupName").val() == ""){
				alert("앨범명을 입력해주세요");	
				}else{
				self.location = "/photo/addGroup?groupName="+$("#groupName").val();
				}
			});
		});
		
		
		$(function(){
			$("p:contains('이름수정')").on("click", function(){
				window.open("/photo/updateGroupName?groupNo="+$(this).children('input').val(), "updateGroupName", "width=350, height=150, left=550, top=250");
			})
		})
		
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
							<button type="button" id="listPhoto" class="btn btn-link disabled">~ 앨범, 앨범을 보자 ~</button>
							<button type="button" id="addAlbum" class="btn btn-outline-info" onclick="buttonClick();"> + 새 앨범</button><br/>
						<span id="makeAlbum" style="display:none;">
							<input type="text" id="groupName" name="groupName" style="height: 38pt;" placeholder="앨범명을 입력해주세요" value=""/>
							<!-- <input type="text" readonly="" class="form-control-plaintext" id="groupName" placeholder="앨범명을 입력해주세여."> -->
							<button type="button" class="btn btn-outline-info">만들기</button>
						</span><br/>
							<a href="/photo/listPhoto" class="list-group-item list-group-item-action active"><center>내 앨범 목록&nbsp&nbsp${totalCount}</center></a>
							<a href="/photo/photoBin" class="list-group-item list-group-item-action"><center>사진 휴지통</center></a>
						</div>
	
				</div>
				
				<div class="col-md-9">
  					<div class="list-group">
  					<a href="#" class="list-group-item list-group-item-action active">It's My Album</a><br/><br/>

		          <div class="row"> 
					<c:set var="i" value="0" />
					<c:forEach var = "group" items = "${ groupList }">
						<c:set var="i" value="${ i+1 }" />
						<div class="col-md-4">
							<div class="card bg-secondary mb-3" style="max-width: 20rem; height: 12rem;">
								<div class="card-header" style="color:black">
									<input type="hidden" id="updateGroupName" value="${group.groupName}">
									<small style="">앨범 생성일 : ${ group.groupDate}</small>
								</div>
								<div class="card-body">
									<a href="/photo/album?groupNo=${group.groupNo}">
									<h5 class="card-title" id ="${group.groupNo}">${ group.groupName eq 'default1' ? '그룹 미지정' : group.groupName }</h5></a>
									<p class="card-text" id="content">
									<p class="card-text" style="text-align:right;"><small class="text-muted">삭제</small>
									<input type="hidden" value="${ group.groupNo }" style="float:right;"></p>
									<p class="card-text" style="text-align:right;"><small class="text-muted">이름수정</small>
									<input type="hidden" value="${ group.groupNo }" style="float:right;"></p>
								<div class="groupNo" style="display:none;">${group.groupNo}</div>
									
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