<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>그룹 선택</title>
	    
	   	<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
		<style>
		.container 
		{
			margin : 0 auto;
			txet-align : center;
			padding : 20px 160px;
		}
		</style>
		<script>
		$(function() {

			$("button:contains('그룹 이동')").on("click", function() {
				$.ajax(
						{
							url : "/diary/rest/updateDiaryGroup" ,
							method : "POST" ,
							dataType : "text" ,
							data : {
								groupNo : $("input:radio[name=optionsRadios]:checked").val(), 
								diaryNo : ${ diaryNo }
							},
							success : function(result) {
								if (result == "Success") {
									alert("선택하신 그룹으로 이동되었습니다.");
									window.opener.location.reload(); // 부모창 새로고침하고 팝업창(자식창) 닫기
									window.close(); // 팝업창 닫기 
								} else {
									alert("그룹이 이동되지 않았습니다.");
								}
							}
							
				});
			});
			
// 			$("button:contains('그룹 이동')").on("click", function () {
// 				alert("선택하신 그룹으로 이동되었습니다.");
// 				// 자식창(팝업창)에서 부모창 컨트롤 (페이지 이동, 이동한 페이지로 값 전달) : opener.parent.location 
// 				opener.parent.location = "/diary/updateDiaryGroup?groupNo="+$("input:radio[name=optionsRadios]:checked").val()
// 								+"&diaryNo="+$("input:hidden").val();
// 				window.close(); // 팝업창 닫기 
// 			});

		});
		</script>
	
	</head>

	<body>

	<div class="container">
		 <div class="row"> 
					<c:set var="i" value="0" />
					<c:forEach var = "group" items = "${ diaryGroupList }">
						<c:set var="i" value="${ i+1 }" />
						<div class="col-xl-3">
						<input type="radio" class="form-check-input" name="optionsRadios" id="${ group.groupNo }" value="${ group.groupNo }"> 
							<div class="card bg-secondary mb-3" style="max-width: 20rem; max-height: 10rem;">
								<div class="card-header" style="color:black">
									<input type="hidden" id="updateGroupName" value="${group.groupName}">
									<small style="">${group.groupDate}</small>
								</div>
								<div class="card-body">
								<h6>${ group.groupName eq 'default2' ? '그룹 미지정' : group.groupName }</h6>
								</div>
							</div>
						</div>
					</c:forEach>

			    </div>
		
		<button type="button" class="btn btn-primary btn-sm">그룹 이동</button>
		<button type="button" class="btn btn-primary btn-sm" onclick="window.close()">취소</button>
		
	</div>

  	
	</body>
</html>