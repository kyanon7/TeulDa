<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
<body>
			<div class="list-group">
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
				
</body>
</html>