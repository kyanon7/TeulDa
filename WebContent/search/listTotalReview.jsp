<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>나의 후기 목록</title>

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.6.0/dist/lux/bootstrap.min.css" integrity="sha256-n1LAsYCohTi3YOpx8/Jhgf1i6BLuraa4Bnx/qTd4Vs0=" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/rateyo@2.3.5/src/jquery.rateyo.css" integrity="sha256-NGkqAxC1CKM2ILB67FglDNhS5Sd2kKAacTcoWKznSZU=" crossorigin="anonymous">
		
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

		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha256-/ijcOLwFf26xEYAjW75FizKVo5tnTYiQddPZoLUHHZ8=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha256-7dA7lq5P94hkBsWdff7qobYkp9ope/L5LQy2t/ljPLo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/rateyo@2.3.5/src/jquery.rateyo.js" integrity="sha256-Sq0rSsEMzpXVg0elKKGMr0h0buMHMdRApm944Lh6XoA=" crossorigin="anonymous"></script>
		

		<script defer>

			document.addEventListener('DOMContentLoaded', () => {
				const searchButton = document.querySelector("button[type='button'].btn.btn-primary");
				searchButton.addEventListener('click', () => { fncGetList(1) });
			});

			document.addEventListener('DOMContentLoaded', () => {
				const stars = document.querySelectorAll('.getReview');
				stars.forEach(function(each, index){
					let star = each.querySelector("div[style='display:none']").textContent.replace(/[\n\r]+|[\s]{2,}/g, ' ').trim();
					$(".rateYo").eq(index).rateYo({
						rating: star,
						readOnly: true,
						starWidth: "17.5px"
					});
				});
			});

			document.addEventListener('DOMContentLoaded', () => {
				const sort = document.querySelectorAll(".breadcrumb-item");
				sort.forEach(each => {
					each.addEventListener('click', () => {	
						document.getElementById('searchSorting').value = each.value;
						fncGetList(1);
					});
				})
			});

			document.addEventListener('DOMContentLoaded', () => {
				const card = document.querySelectorAll('.card .card-body');
				card.forEach(each => {
					each.addEventListener('click', () => {
						const reviewNo = each.querySelector('.getReview').getAttribute('id');
						location.href = "/review/getReview?reviewNo="+reviewNo;
					});
				});
			});

			function fncGetList(currentPage){
				let pageNo = document.querySelector('#currentPage')
				pageNo.value = currentPage;

				const form = document.querySelector("form");
				form.setAttribute("method", "POST");
				form.setAttribute("action", "/review/listTotalReview");
				form.submit();
			}

		</script>

		</head>
	<body>

	<header>
		<jsp:include page="../layout/toolbar.jsp"/>
	</header>
	<br />
	<br />

	<form name="detailForm">

		<div class="container">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link" href="/diary/listTotalDiary">DIARY</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="/review/listTotalReview?searchKeyword=${ search.searchKeyword }">REVIEW</a>
				</li>
				<li class="nav-item">
					<a class="nav-link"  href="/user/listUserTotal">USER</a>
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
									<option value="4"
											${ ! empty search.searchCondition && search.searchCondition==4 ? "selected" : "" }>전체</option>
									<option value="0"
											${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
									<option value="1"
											${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>내용</option>
									<option value="2"
											${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>작성자 닉네임</option>
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
						  <span class="badge badge-info">TOTAL ${ resultPage.totalCount }</span>
					  </div>
					  <div class="col-md-4"></div>
					  <div class="col-md-6">
						<ol class="breadcrumb" style="float: right;">
							<li role="button" class="breadcrumb-item" value="0"><a
								${ ! empty search.searchSorting && search.searchSorting==0 ? "style=font-weight:350;" : "" }>
								최근 작성 순</a></li>
							<li role="button" class="breadcrumb-item" value="1"><a
								${ ! empty search.searchSorting && search.searchSorting==1 ? "style=font-weight:350;" : "" }>
								별점 높은 순</a></li>
						</ol>
						<input type="hidden"
							name="searchSorting" id="searchSorting"
							value="${ search.searchSorting }">
						<!-- <li> 클릭 시 해당 value 값 input type text 에 넣기  -->
					</div> 
				</div>
			  </div>
			
			<c:set var="i" value="0" />
			<c:forEach var="review" items="${ list }">
				<c:set var="i" value="${ i+1 }" />
				<div class="card">
					  	<div role="button" class="card-body" data-toggle="tooltip" data-placement="auto" title="${ review.reviewPlace }">
						  	<div class="row">
							  	<div class="col-md-8">
								  	<h6><img src="../resources/images/user.png" height="30px">&nbsp; ${ review.nickname }</h6>
									<div class="getReview" id="${ review.reviewNo }">
										<h4 class="card-title">${ review.reviewPlace }</h4>
										<h6 class="card-subtitle mb-2 text-muted"><img src="../resources/images/marker_blue.png" height="11px"
											align="middle">&nbsp;${ review.reviewPlace }</h6>
										<p class="card-text" id="content"><c:out value='${review.reviewContents.replaceAll("\\\<.*?\\\>","")}' /></p>
										<div class="card-text">${ fn:substring(review.reviewDate, 0, 16) } | 평점 <div id="rateYo" class="rateYo" style="display: inline-block;"><div style="display:none">${review.star}</div></div></div>
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
			
			<input type="hidden" id="currentPage" name="currentPage" value="0"/>
			<jsp:include page="../common/pageNavigator.jsp"/>
			
		</div>
		</form> 
	</body>
</html>