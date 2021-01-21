<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>목록으로 보기</title>

		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>		

	</head>
	<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top header-transparent">
    	<jsp:include page="/layout/toobar.jsp"/>
	</header>
	<!-- End Header -->
  
		<div class="col-md-2">
			<ul class="list-group">
			  <li class="list-group-item d-flex justify-content-between align-items-center">
			    <a href="#">지도로 보기</a>
			    <span class="badge badge-primary badge-pill">14</span>
			  </li>
			  <li class="list-group-item d-flex justify-content-between align-items-center">
			    <a href="#">목록으로 보기</a>
			    <span class="badge badge-primary badge-pill">2</span>
			  </li>
			  <li class="list-group-item d-flex justify-content-between align-items-center">
			    <a href="#">사진 휴지통</a>
			    <span class="badge badge-primary badge-pill">1</span>
			  </li>
			</ul>
		</div>
	</body>
</html>