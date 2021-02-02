<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>내 기록 그룹</title>
	    
	   	<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
		<style>
		</style>
		<script>
			$(function() {

				$("button:contains('생성')").on("click", function() {
					$.ajax({
						url : "/diary/rest/addDiaryGroup",
						method : "POST",
						dataType : "text",
						data : {
							groupName : $("#groupName").val()
						},
						success : function(result) {
							if (result == "Success") {
								alert("그룹 생성이 완료되었습니다.");
								location.reload(); // 리로드 안하고 할 수 있게 해보기 
							} else {
								alert("그룹 생성이 완료되지 않았습니다.");
							}
						}
					})
				});
				
				$(".listDiaryByGroup").on("click", function() {
					self.location = "/diary/listDiaryByGroup?groupNo="+ $(this).attr('id');
				});
				
				$("p:contains('삭제')").on("click", function () {
					$.ajax(
							{
								url : "/diary/rest/deleteDiaryGroup" ,
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
			<!-- ======= Diary Left ToolBar ======= -->
			<div class="col-md-3">
  				<jsp:include page="../diary/leftbar.jsp" />
			</div>
			<!-- End ToolBar -->

			<div class="col-md-9">

					<div class="form-group">
						<label class="col-form-label" for="inputDefault">원하는 기록을 묶어 그룹별로 보관할 수 있습니다.</label>
						<div class="row">
							<div class="col-md-3">
								<input type="text" class="form-control"
									placeholder="그룹명을 입력하세요." id="groupName" style="width: 210px;">
								&nbsp;
							</div>
							<div class="col-md-3">
								<button type="button" class="btn btn-info">생성</button>
							</div>
						</div>
					</div>

					<div class="row">
						<c:set var="i" value="0" />
						<c:forEach var="group" items="${ diaryGroupList }">
							<c:set var="i" value="${ i+1 }" />


							<div class="col-md-4">
								<div class="card bg-light mb-3" style="max-width: 20rem;">
									<div class="listDiaryByGroup" id="${ group.groupNo }">
									<div class="card-header">
										${ group.groupName eq 'default2' ? '그룹 미지정' : group.groupName }
										<span class="badge badge-primary badge-pill" style="float:right;">${ group.contentCount }</span>
									</div>
									<div class="card-body">
										<c:if test="${ group.contentCount == 0 }">
											<p class="card-text" style="text-align:right;"><small class="text-muted">삭제</small>
											<input type="hidden" value="${ group.groupNo }" style="float:right;"></p>
										</c:if>
									</div>
									</div>
								</div>
							</div>

						</c:forEach>
					</div>
					

			</div>
		</div>
	</div>

  	
	</body>
</html>