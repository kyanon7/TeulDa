<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>마이페이지-기록 왼쪽 툴바</title>
	</head>
	<body>
		<!--  diary left toobar -->
  		<div class="list-group">
  			<button type="button" class="btn btn-info disabled">기록</button>
  			<button type="button" class="btn btn-outline-info">+ 새 기록 작성</button><br/>
<!--   			<a href="#" class="list-group-item list-group-item-action">여행 타임라인</a> -->
  			<a href="#" class="list-group-item list-group-item-action">내 기록 지도</a>
  			<a href="#" class="list-group-item list-group-item-action">내 기록 목록</a>
  			<a href="#" class="list-group-item list-group-item-action">내 기록 그룹</a>
  			<a href="#" class="list-group-item list-group-item-action">북마크 기록 목록</a>
  			<a href="#" class="list-group-item list-group-item-action">기록 휴지통</a>
		</div>
	</body>
	
	<script type="text/javascript">
	$(function() {
		
		$("button:contains('+ 새 기록 작성')").on("click", function () {
			self.location = "/diary/selectMap.jsp";
		});
		
		$("a:contains('여행 타임라인')").on("click", function () {
			self.location = "/diary/timeline.jsp";
		});
		
		$("a:contains('내 기록 지도')").on("click", function () {
			self.location = "/diary/getDiaryMap.jsp";
		});
		
		$("a:contains('내 기록 목록')").on("click", function () {
			self.location = "/diary/listDiary";
		});
		
		$("a:contains('내 기록 그룹')").on("click", function () {
			self.location = "/diary/listDiaryGroup";
		});
		
		$("a:contains('북마크 기록 목록')").on("click", function () {
			self.location = "/bookmark/listBookmark?nickname=${sessionScope.user.nickname}";
		});
		
		$("a:contains('기록 휴지통')").on("click", function () {
			self.location = "/diary/listDeleteDiary";
		});
		
	 });
	</script>
</html>