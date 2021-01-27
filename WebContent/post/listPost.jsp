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
		
		
	<script type="text/javascript">
	
	$(function(){
		$(".ct_list_pop td:nth-child(5)").on("click", function(){
			self.location = "/post/getPost?postNo="+$(this).attr('id')			
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
  				<!-- diary toolbar로 빼도 될 듯 -->
  				<div class="col-md-2">
  					<jsp:include page="../post/leftbar.jsp"/>
  				</div>
  					
  					<%-- <div class="list-group">
  					<button type="button" class="btn btn-info disabled">자유게시판</button>
  					
  					<c:if test="${ !empty user }">
  					<a type="button" href="/post/addPost" class="btn btn-outline-info">+ 새 글 작성</a><br/>
  					</c:if>
  					
  					<a href="/post/listPost?postCategory=1" class="list-group-item list-group-item-action active" type="button">여행지 정보공유</a>
  					<a href="/post/listPost?postCategory=2" class="list-group-item list-group-item-action " type="button">맛집 정보공유</a>
  					<a href="/post/listPost?postCategory=3" class="list-group-item list-group-item-action " type="button">숙소 정보공유</a>
  					<a href="/post/listPost?postCategory=4" class="list-group-item list-group-item-action " type="button">Q&A</a>
  					<a href="/post/listPost?postCategory=5" class="list-group-item list-group-item-action " type="button">잡담</a>
					</div>
				</div> --%>
				
			
				<div class=".col-md-10">
					<ol class="breadcrumb">
 						 <li class="breadcrumb-item"><a href="#">최신순</a></li>
  						 <li class="breadcrumb-item"><a href="#">조회순</a></li>
  				   </ol>
  						  <form class="form-inline">
    						  <input class="form-control mr-sm-2" type="text" placeholder="Search">
    						  <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
   						 </form>
   					<c:if test="${ !empty user }"> 
   					<a type="button" href="#" class="btn btn-outline-info">내 글 보기</a>
  					<a type="button" href="#" class="btn btn-outline-info">내 댓글 보기</a>
  					</c:if>
   						  <div class="form-group">
   							 <select class="custom-select">
    						  <option selected="">Open this select menu</option>
     						 <option value="1">제목</option>
     						 <option value="2">내용</option>
     					 <option value="3">제목+내용</option>
     					 <option value="4">작성자</option>
   					 </select>
				
					<!-- <div class=".col-md-6"> -->
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
 				<c:set var = "i" value = "0"/>
  					<c:forEach var = "post" items = "${list}">
  						<c:set var = "i" value = "${i+1}" />
  						<tr class="ct_list_pop">
								<td align="left">${post.postNo}</td>
								<td></td> 
								<td align="left">${post.nickname}</td>
								<td></td>
								<td align="left" id="${post.postNo}">${post.postTitle}</td>
								<td></td>			
								<td align="left">${post.postDate}</td>
  								<td></td>			
								<td align="left">${post.viewCount}</td>
  					</tr>
  					</c:forEach>	
    			<tr>
				</tr>
				</tbody>
				</table>
				</div>
		</div>
	</div>
</div>
 	
 	<div class="row">
 	<div class=".col-md-3 .col-md-offset-3">
  <ul class="pagination">
    <li class="page-item disabled">
      <a class="page-link" href="#">&laquo;</a>
    </li>
    <li class="page-item active">
      <a class="page-link" href="#">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">3</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">4</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">5</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">&raquo;</a>
    </li>
  </ul>
</div>

</div>
	</body>
	
	
	
	
</html>