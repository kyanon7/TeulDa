<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>Insert title here</title>
	</head>
	<body>
		<!--  diary left toobar -->
  		<div class="list-group">
  			<button type="button" class="btn btn-info disabled">기록</button>
  			<button type="button" class="btn btn-outline-info">+ 새 기록 작성</button><br/>
  			<a href="#" class="list-group-item list-group-item-action active">여행 타임라인</a>
  			<a href="#" class="list-group-item list-group-item-action">내 기록 지도</a>
  			<a href="#" class="list-group-item list-group-item-action">내 기록 목록</a>
  			<a href="#" class="list-group-item list-group-item-action">북마크 기록 목록</a>
  			<a href="#" class="list-group-item list-group-item-action">스크랩 기록 목록</a>
  			<a href="#" class="list-group-item list-group-item-action">기록 휴지통</a>
		</div>
	</body>
	
	<script type="text/javascript">
	$(function() {
		
		$("button:contains('+ 새 기록 작성')").on("click", function () {
			self.location = "/diary/selectMap.jsp";
		});
	 });
	</script>
</html>