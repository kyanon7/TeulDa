<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8" />
	    <title>자유게시판</title>

		<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	</head>

	<body>
  		<!-- ======= Header ======= -->
		<header>
			<jsp:include page="../layout/toolbar.jsp"/>
		</header><br/><br/>
		<!-- End Header -->

  		<div class="container">
  		
  			<div class="row">
  				<!-- diary toolbar로 빼도 될 듯 -->
  				<div class="col-md-3">
  					<div class="list-group">
  					<button type="button" class="btn btn-info disabled">자유게시판</button>
  					<a type="button" href="/post/addPost" class="btn btn-outline-info">+ 새 글 작성</a><br/>
  					<a href="#" class="list-group-item list-group-item-action active">여행지 정보공유</a>
  					<a href="#" class="list-group-item list-group-item-action">맛집 정보공유</a>
  					<a href="#" class="list-group-item list-group-item-action">숙소 정보공유</a>
  					<a href="#" class="list-group-item list-group-item-action">Q&A</a>
  					<a href="#" class="list-group-item list-group-item-action">잡담</a>
					</div>
				</div>
				
				<div class="col-md-9">
					<ol class="breadcrumb">
 						 <li class="breadcrumb-item"><a href="#">내 글 보기</a></li>
  						 <li class="breadcrumb-item"><a href="#">내 댓글 보기</a></li>
					</ol>
  					 	<table class="table table-hover">
 					 <thead>
   					 <tr>
    					  <th scope="col">글번호</th>
    					  <th scope="col">작성자</th>
    					  <th scope="col">제목</th>
     					 <th scope="col">등록일자</th>
     					 <th scope="col">조회수</th>
   					 </tr>
  				</thead>
  				<tbody>
  					  <tr class="table-active">
   					   <th scope="row">Active</th>
    				  <td>Column content</td>
    				  <td>Column content</td>
     				 <td>Column content</td>
     				  <td>Column content</td>
   				 </tr>
    			<tr>
				</tr>
				</tbody>
				</table>
				</div>
			
			</div>
  		</div>
	</body>
	
	
	
	
</html>