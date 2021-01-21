<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

		<head>
		<meta charset="UTF-8" />
		<title>자유게시판</title>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">

    <style>
      .card-columns {
          column-count: 4;
      }
    </style>

		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

	</head>
	
	<body>
		  <!-- ======= Header ======= -->
		  <header>
			<jsp:include page="../layout/toolbar.jsp"/>
		  </header>
		  <hr />
		
		<script type="text/javascript">
		
function fncGetPostList(currentPage){
	
	$("#currentPage").val(currentPage)
	$("form").attr("method","POST").attr("action","/post/getPostList?postCategory=${postCategory}").submit();
}
		$(function(){
			$(".table-active").on("click", function(){
				
				fncGetPostList(1);
			});
		});
		
	</script>
 </head>
 
 
 
 
 <body>
 
 <div class="bs-docs-section">
          <div class="col-lg-3 mr-auto">
              <h1 id="tables">자유게시판</h1>
            </div>

 	 <div class="col-lg-2 mr-auto">
	 <div class="list-group">
 	 	 <a href="#" class="list-group-item list-group-item-action active">새 글 쓰기</a>
 		 <a href="#" class="list-group-item list-group-item-action">여행지 정보공유</a>
 		 <a href="#" class="list-group-item list-group-item-action">맛집 정보공유</a>
 		 <a href="#" class="list-group-item list-group-item-action">숙소 정보공유</a>
  	     <a href="#" class="list-group-item list-group-item-action">Q&A</a>
   	     <a href="#" class="list-group-item list-group-item-action">잡담</a>
	</div>
</div>
</div>



   <div class="col-lg-10  mr-auto">
  <table class="table table-hover">
  <tr>
  	<td colspan="11">
  		전체  ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지
  	</td>
  </tr>
  <thead>
    <tr>
      <th scope="col">글번호</th>
      <th scope="col">작성자</th>
      <th scope="col">제 목</th>
      <th scope="col">작성일자</th>
      <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody>
  <c:set var="i" value="0"/>
  	<c:forEach var="post" items="${list}">
  		<c:set var="i" value="${i+1}"/>
    <tr class="table-active">
      <th scope="row">${ i }</th>
      <td id="${post.nickname}"></td>
      <td id="${post.title}"></td>
      <td id="${post.post_date}"></td>
      <td id="${post.view_count}"></td>
    </tr>
   </c:forEach>
</table>
</div>

	</body>