<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>내 글 보기</title>

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


<script type="text/javascript">

	//닉네임 누르면 프로필로 이동
	$(function(){
	
			$(".ct_list_pop td:nth-child(3)").on("click", function(){
				self.location = "/user/getUserNick?nickname=" + $(this).attr('id')
			});
		});

function fncGetList(currentPage) {

	/* var postCategory='${post.postCategory}' */

	$("#currentPage").val(currentPage);
	
	
	$("form[name='detailForm']").attr("method", "POST").attr("action",
			"/post/listPostBynickname").submit();

}

	
	$(function(){
		$(".ct_list_pop td:nth-child(5)").on("click", function(){
			self.location = "/post/getPost?postNo="+$(this).attr('id')			
		});
	});
	
	$(function(){
		$("a:contains('내 글 보기')").on("click", function(){
			self.location = "/post/listPostBynickname?postCategory=1&nickname=${sessionScope.user.nickname}"
		});
	});
	
	$(function(){
		$("a:contains('내 댓글 보기')").on("click", function(){
			self.location = "/post/listMyComment?nickname=${sessionScope.user.nickname}"	
		});
	});
	
	
	
	$(function() {

		$("button:contains('Search')").on("click", function() { // 검색 버튼

			$("#searchSorting").val($(this).attr('value'));

			fncGetList(1);
			/* self.loacation = "/post/listPost?postCategory=${postCategory}$searchCondition="+$(this).attr('value')+"&searchKeyword="+$(this).attr('value')	 */
		});
	});

	$(function() {

		$(".breadcrumb-item").on("click", function() {

			$("#searchSorting").val($(this).attr('value'));

			fncGetList(1); // currentpage : 1 

			/* self.location = "/post/listPost?currentPage=1&postCategory=${postCategory}&searchSorting="+$(this).attr('value') */
			/* 	$("#searchSorting").val($(this).attr('value'));
				$("#postCategory").val($(this).attr('value'));
				fncGetList(1); */
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

	
			<div class="row">
			<div class="col-md-1">
			</div>
				<!-- diary toolbar로 빼도 될 듯 -->
				<div class="col-md-2">
					<%-- 		<jsp:include page="../post/leftbar.jsp"/>
  				</div> --%>
					<div class="list-group">
						<a href="/post/listPost?postCategory=1" type="button"
							class="btn btn-info active">자유게시판</a>

						<c:if test="${ !empty user }">
							<a type="button" href="/post/addPost"
								class="btn btn-outline-info">+ 새 글 작성</a>
							<br />
						</c:if>
							<a href="/post/listPostBynickname?postCategory=6&nickname=${sessionScope.user.nickname}"
								class="list-group-item list-group-item-action" type="button">모든 게시물</a> 
							<a href="/post/listPostBynickname?postCategory=1&nickname=${sessionScope.user.nickname}"
								class="list-group-item list-group-item-action" type="button">여행지 정보공유</a> 
							<a href="/post/listPostBynickname?postCategory=2&nickname=${sessionScope.user.nickname}"
								class="list-group-item list-group-item-action " type="button">맛집 정보공유</a> 
							<a href="/post/listPostBynickname?postCategory=3&nickname=${sessionScope.user.nickname}"					
								class="list-group-item list-group-item-action " type="button">숙소 정보공유</a>
							 <a href="/post/listPostBynickname?postCategory=4&nickname=${sessionScope.user.nickname}"
								class="list-group-item list-group-item-action " type="button">Q&A</a>
							<a href="/post/listPostBynickname?postCategory=5&nickname=${sessionScope.user.nickname}"
								class="list-group-item list-group-item-action " type="button">잡담</a>
					</div>
				</div>

				<div class="col-md-9">
					<div class="row">
					<div class="col-md-2">

						<span class="badge badge-info">PAGE ${ resultPage.currentPage},
							TOTAL ${ resultPage.totalCount }</span>  <input type="hidden" 
							id="postCategory" name="postCategory" value="${postCategory}"/>  

						<input type="hidden" name="nickname" id="nickname"
							value="${nickname}">

						<ol class="breadcrumb">
							<li class="breadcrumb-item" value="0"><a
								${ ! empty search.searchSorting && search.searchSorting==0 ? "style=font-weight:350;" : "" }>최신순</a></li>
							<li class="breadcrumb-item" value="1"><a
								${ ! empty search.searchSorting && search.searchSorting==1 ? "style=font-weight:350;" : "" }>조회순</a></li>
						</ol>

						<input type="hidden" name="searchSorting" id="searchSorting"
							value="${ search.searchSorting }">
						<!-- <li> 클릭 시 해당 value 값 input type text 에 넣기  -->

					</div>
					<div class="col-md-7">
						<c:if test="${ !empty user }">
							<a type="button" id="${nickname}" class="btn btn-outline-info">내 글 보기</a>
							<a type="button" id="${nickname}" class="btn btn-outline-info">내 댓글 보기</a>
						</c:if>
					</div>
				</div>

				<div class="row">
					<div class="col-md-2">
						<div class="form-group">
							<select class="custom-select" name="searchCondition">
								<option value="0"
									${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>작성자</option>
								<option value="1"
									${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>제목</option>
								<option value="2"
									${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>내용</option>
							</select>
						</div>
					</div>
					<div class="col-md-7">
						<input class="form-control mr-sm-2" name="searchKeyword"
							type="text" placeholder="Search" id="inputDefault"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<div class="col-md-3">
						<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
					</div>
				</div>



				<div class="row">

						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">글번호</th>
									<td></td>
									<th scope="col">작성자</th>
									<td></td>
									<th scope="col">제목</th>
									<td></td>
									<th scope="col">등록일자</th>
									<td></td>
									<th scope="col">조회수</th>
									<td></td>
								</tr>
							</thead>
							<tbody>
								<c:set var="i" value="0" />
								<c:forEach var="post" items="${list}">
									<c:set var="i" value="${i+1}" />
									<tr class="ct_list_pop">
										<td align="left">${post.postNo}</td>
										<td></td>
										<td align="left" id="${post.nickname}">${post.nickname}</td>
										<td></td>
										<td align="left" id="${post.postNo}">${post.postTitle}</td>
										<td></td>
										<td align="left">${fn:substring(post.postDate, 0, 10)}</td>
										<td></td>
										<td align="left">${post.viewCount}</td>
									</tr>
								</c:forEach>
								<tr>
								</tr>

							</tbody>

						</table>
						<input type="hidden" id="currentPage" name="currentPage" value="" />
						<!-- PageNavigation Start... -->
						<jsp:include page="../common/pageNavigator.jsp" />
						<!-- PageNavigation End... -->
</div>
					</div>
				</div>
		
	</form>
</body>
</html>