<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>게시글 조회</title>
	    		<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
		<!-- Google 지도 API 사용 스크립트 추가 -->
		
		<script type="text/javascript">
		
		
		function fncAddComment(){
			
			$("form").attr("method","POST").attr("action","/post/addComment").submit();
			location.reload(true);
		}
		
		$(function(){
			$("button:contains('등록')").on("click", function(){
				fncAddComment();
		});

	});
		
</script>		
		
	</head>
	<body>
 		 <header>
			<jsp:include page="../layout/toolbar.jsp"/>
		</header><br/><br/>
		
		<div class ="container">
			<div class="row">
				<div class="col-md-2">
				<jsp:include page="../post/leftbar.jsp" />
			</div>
			
		<div class="row">
		
			<div class="col-md-10">
			
			<c:if test="${post.postCategory eq '0'.charAt(0)}">
       				<h4>자유 게시글 </h4>
   			</c:if>
			<c:if test="${post.postCategory eq '1'.charAt(0)}">
       				<h4>여행지 정보공유 </h4>
   			</c:if>
   			<c:if test="${post.postCategory eq '2'.charAt(0)}">
       				<h4>맛집 정보공유 </h4>
   			</c:if>
   			<c:if test="${post.postCategory eq '3'.charAt(0)}">
       				<h4>숙소 정보공유 </h4>
   			</c:if>
   			<c:if test="${post.postCategory eq '4'.charAt(0)}">
       				<h4>Q&A </h4>
   			</c:if>
   			<c:if test="${post.postCategory eq '5'.charAt(0)}">
       				<h4>잡담 </h4>
   			</c:if>
		
			
			<br/><br/>
			<div class="card border-secondary md-6" style="width: 55rem;">
  			<div class="card-header">
  			
  			 작성자 : ${post.nickname} &nbsp; &nbsp; 작성일자 : ${fn:substring(post.postDate, 0, 10)} &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
  			 &nbsp; &nbsp;&nbsp; &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; 조회수 : ${post.viewCount} 
  			</div>
 			 <div class="card-body">
 		
 			 </div> 
  			  <div class="card-title">
  					<h4>${post.postTitle}</h4>
			</div>
  			  <p class="card-text">${post.postContents}</p>
 			 </div>
 			 <br/><br/>
 			 
 	<c:if test="${ !empty user }"> 		 
 		<form name="addComment">
			 <br/><br/>
			  <input type="hidden" name="postNo" value="${ post.postNo }"/>
			 <input type="text" name="commentContents" class="form-control" placeholder="댓글달아봐요~"/>
			 <button class="btn btn-info" type="submit">등록</button>
			 <br/><br/>
			 
		</form>
 			 
 <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true">
	<c:set var="i" value="0"/>	
 		 <c:forEach var="comment" items = "${commentList}">
 		 <c:set var="i" value="${i+1}"/> 
 		 <div class="toast-header">
 		   <strong class="mr-auto">${comment.nickname}</strong>
   			 <small>${comment.commentDate}</small>
   			 
   			 <c:if test="${ sessionScope.user.nickname == comment.nickname }">
   				<span class="badge badge-info">수정</span>
  				<span class="badge badge-danger">삭제</span>
    		</c:if>
    		
  			</div>
 			<div class="toast-body">
  			  ${comment.commentContents}
  			</div>
  		</c:forEach>
	</div>
 	
 	
 	
 <!-- <div class="list-group">
  <a href="#" class="list-group-item list-group-item-action">Cras justo odio</a>
  <a href="#" class="list-group-item list-group-item-action">Dapibus ac facilisis in</a>
  <a href="#" class="list-group-item list-group-item-action">Morbi leo risus</a>
</div> -->
 		<%--  <table class="table table-hover">
 	   <tbody>
 	   			<c:set var = "i" value = "0" />
					<c:forEach var = "post" items = "${list}">
						<c:set var = "i" value = "${i+1}" />
 				 <tr class="table-info">
     			 <th scope="row">${post.nickname}</th>
     			 <td>${post.commentList} </td>
     			 <td>Column content</td>
     			 <td>${comment }</td>
      			 </tr>
      			 </c:forEach> --%>
    <!-- 	</tbody>
    </table> --></c:if>
			 			</div>
					</div>
				</div>
		</div>
	</body>
</html>