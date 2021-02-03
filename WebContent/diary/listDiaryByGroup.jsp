<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>${ diaryList[0].groupName eq 'default2' ? '그룹 미지정' : diaryList[0].groupName }</title>
	    
	   	<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
		<style>
		/* content 3줄 이상이면 자름 */
		p {
			overflow: hidden;
			text-overflow: ellipsis;
			display: -webkit-box;
			-webkit-line-clamp: 3; /* 라인수 */
			-webkit-box-orient: vertical;
			word-wrap: break-word;
			line-height: 1.2em;
			height: 3.5em;
		/* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
		}
		</style>
		<script>
		$(function() {

			$(".getDiary").on("click",function() {
				self.location = "/diary/getDiary?diaryNo="+ $(this).attr('id') + "&status=own";
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
				<ul class="list-group">
					<li class="list-group-item d-flex justify-content-between align-items-center">
						${ diaryList[0].groupName eq 'default2' ? '그룹 미지정' : diaryList[0].groupName }
						<span class="badge badge-primary badge-pill">${ totalCount }</span>
					</li>
				</ul><br> 
				
					<div class="row">
						<c:set var="i" value="0" />
						<c:forEach var="diary" items="${ diaryList }">
							<c:set var="i" value="${ i+1 }" />
							<div class="col-md-4">
								<div class="card bg-secondary mb-3"
									style="max-width: 20rem; height: 15rem;">
									<div class="card-header">
										<img src="../resources/images/marker_blue.png" height="12px"
											align="middle">&nbsp;&nbsp;${ diary.location } <br>
										<small>${ diary.startDate } - ${ diary.endDate }</small>
										<img src="../resources/images/folder.png" height="13px" align="middle" style="float:right;">
									</div>
									<div class="card-body">

										<div class="getDiary" id="${ diary.diaryNo }">
											<h5 class="card-title">${ diary.title }</h5>
											<p class="card-text" id="content">
												<%-- 									${ diary.content } --%>
												<c:out value='${diary.content.replaceAll("\\\<.*?\\\>","")}' />
											</p>
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