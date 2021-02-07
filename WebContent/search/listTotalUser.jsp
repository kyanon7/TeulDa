<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>통합검색</title>

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
</style>
<script>
	
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

	<div class="container">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" data-toggle="tab" href="/diary/listTotalDiary">DIARY</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#reviews">REVIEW</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#users">USER</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#hashtags">HASHTAG</a>
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
										${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>작성자 닉네임</option>
							</select> 
					</div>
				</div>
				<div class="col-md-8">
  					<input type="text" class="form-control" placeholder="검색어를 입력하세요" id="inputDefault">
  				</div>
  				<div class="col-md-2">
  					<button type="button" class="btn btn-primary">검색</button>
  				</div>
  			</div>
  			
  			<div class="row">
  				<div class="col-md-2">
  					<span class="badge badge-info">TOTAL ${ resultPage.totalCount }</span>
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
				</div> 
			</div>
  		</div>
		
		<div class="card">
  			<div class="card-body">
  				<div class="row">
  				
  				<div class="col-md-8">
  					<h6><img src="../resources/images/user.png" height="30px">&nbsp; 닉네임</h6>
    				<h4 class="card-title">제목</h4>
   					<h6 class="card-subtitle mb-2 text-muted"><img src="../resources/images/marker_blue.png" height="11px"
											align="middle">&nbsp;여행지 장소</h6>
    				<p class="card-text">기록 내용~~~~~~~~~~~~~~3줄 짤리게</p>
   				    <p class="card-text">조회수 0회</p> 
    			</div> 
    			<div class="col-md-4">
    				<img src="../resources/images/photos/1612502602096145025276_885042925594069_2502250546813722604_n.jpg" style="float:right;" width="150px" height="150px">
    			</div>
    			</div>
  			</div>
		</div>
		
		
	</div>


</body>
</html>