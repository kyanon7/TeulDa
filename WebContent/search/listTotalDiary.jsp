<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>통합검색 - Diary</title>

<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css"
	integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>

<style>
/* content 3줄 이상이면 자름 */
#content {
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
function fncGetList() {
	
	$("form[name='detailForm']").attr("method", "POST").attr("action", "/diary/listTotalDiary").submit();

}

$(function() {

	$("button:contains('Search')").on("click", function() { // 검색 버튼
		fncGetList(); 
	});

	$(".breadcrumb-item").on("click", function() { // 정렬

		// <li> 클릭 시 해당 value 값 input type text 에 넣기
		$("#searchSorting").val($(this).attr('value'));
		fncGetList();  
	});

	$(".getDiary").on("click",function() {
		self.location = "/diary/getDiary?diaryNo="+ $(this).attr('id');
	});

	$(".card-text span").on("click",function() {
		self.location = "/diary/listTotalHashTag?hashTagName="+$(this).children('input').val().replace('#', '');
	});

});
</script>

</head>

<body>
	<!-- ======= Header ======= -->
	<header>
		<jsp:include page="../layout/toolbar.jsp" />
	</header>
	<br />
	<br />
	<!-- End Header -->

	<form name="detailForm">

	<div class="container">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" href="/diary/listTotalDiary">DIARY</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/review/listTotalReview">REVIEW</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/user/listUserTotal">USER</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/diary/listTotalHashTag">HASHTAG</a>
			</li>
		</ul>
		<br>
		<div class="form-group">
			<div class="row">
				<div class="col-md-2">
					<div class="form-group">
							<select class="custom-select" name="searchCondition">
								<option value="0"
										${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>전체</option>
								<option value="1"
										${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>제목</option>
								<option value="2"
										${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>내용</option>
								<option value="3"
										${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>장소</option>
								<option value="4"
										${ ! empty search.searchCondition && search.searchCondition==4 ? "selected" : "" }>작성자 닉네임</option>
							</select> 
					</div>
				</div>
				<div class="col-md-8">
  					<input type="text" name="searchKeyword" class="form-control"
								placeholder="검색어 입력" id="inputDefault"
								value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
  				</div>
  				<div class="col-md-2">
  					<button type="button" class="btn btn-primary">Search</button>
  				</div>
  			</div>
  			
  			<div class="row">
  				<div class="col-md-2">
  					<span class="badge badge-info">TOTAL ${ totalCount }</span>
  				</div>
  				<div class="col-md-4"></div>
  				<div class="col-md-6">
					<ol class="breadcrumb" style="float: right;">
						<li class="breadcrumb-item" value="0"><a
							${ ! empty search.searchSorting && search.searchSorting==0 ? "style=font-weight:350;" : "" }>
							최근 작성 순</a></li>
						<li class="breadcrumb-item" value="1"><a
							${ ! empty search.searchSorting && search.searchSorting==1 ? "style=font-weight:350;" : "" }>
							조회수 높은 순</a></li>
					</ol>
					<input type="hidden"
						name="searchSorting" id="searchSorting"
						value="${ search.searchSorting }">
					<!-- <li> 클릭 시 해당 value 값 input type text 에 넣기  -->
				</div> 
			</div>
  		</div>
		
		<c:set var="i" value="0" />
		<c:forEach var="diary" items="${ diaryList }">
			<c:set var="i" value="${ i+1 }" />
			<div class="card">
  				<div class="card-body">
  					<div class="row">
  						<div class="col-md-8">
  							<h6><img src="../resources/images/user.png" height="30px">&nbsp; ${ diary.nickname }</h6>
  								<div class="getDiary" id="${ diary.diaryNo }">
    								<h4 class="card-title">${ diary.title }</h4>
   									<h6 class="card-subtitle mb-2 text-muted"><img src="../resources/images/marker_blue.png" height="11px"
											align="middle">&nbsp;${ diary.location }</h6>
    								<p class="card-text" id="content"><c:out value='${diary.content.replaceAll("\\\<.*?\\\>","")}' /></p>
   				    				<p class="card-text">${ diary.writeDate } | 조회수 ${ diary.viewCount } 회</p> 
   				    			</div> 
   				    			<div class="card-text">
									<c:set var="j" value="0" />
										<c:forEach var = "hashTag" items = "${ diary.hashTagList }">
											<c:set var="j" value="${ j+1 }" />
											<span class="badge badge-info" id="listDiary">
												<input type="hidden" value="${ hashTag.hashTagName }">
												${ hashTag.hashTagName }
											</span>&nbsp;&nbsp;
										</c:forEach>
								</div>
    					</div> 
    					<div class="col-md-4">
    						<img src="../resources/images/photos/1612502602096145025276_885042925594069_2502250546813722604_n.jpg" style="float:right;" width="200px" height="200px">
    					</div>
    				</div>
  				</div>
			</div>
		<br>
		</c:forEach>
		
		
	</div>
	</form> 

</body>
</html>