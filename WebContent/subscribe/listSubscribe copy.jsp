<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko-KR">

	<head>
		<meta charset="UTF-8" />
		<title>나의 후기 목록</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.6.0/dist/lux/bootstrap.min.css" integrity="sha256-n1LAsYCohTi3YOpx8/Jhgf1i6BLuraa4Bnx/qTd4Vs0=" crossorigin="anonymous">

    <style>
      .card-columns {
          column-count: 4;
      }
    </style>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha256-7dA7lq5P94hkBsWdff7qobYkp9ope/L5LQy2t/ljPLo=" crossorigin="anonymous"></script>
    
		<script type="text/javascript">


		</script>

	</head>
	<body>
		  <!-- ======= Header ======= -->
		  <header>
			<jsp:include page="../layout/toolbar.jsp"/>
		  </header>
      <br />
		  <!-- End Header -->

	<!-- <div class="row">
		<div class="col-lg-2">
		  <div class="bs-component">
			<ul class="list-group">
				<li class="h3 nav-header disabled"><a>구독</a></li>
				<c:set var = "i" value = "0" />
				<c:forEach var = "subscribe" items = "${subscribeList}">
					<c:set var = "i" value = "${i+1}" />
				  <li class="list-group-item d-flex justify-content-between align-items-center" style="border: none">
					<a href="#">${subscribe.subTargetNickname}</a>
				<span class="badge badge-primary badge-pill">X</span>
			  </li>
			</c:forEach>
			</ul>
		  </div>
    </div> -->
    
  <div class="row">


    <div class="col-lg-2">
      <div class="list-group">
        <ul class="list-group"><li class="h4 list-group-item disabled border-0" >구독</li></ul>
        <c:set var = "i" value = "0" />
        <c:forEach var = "subscribe" items = "${subscribeList}">
          <c:set var = "i" value = "${i+1}" />
          <a href="#" class="list-group-item list-group-item-action border-0">${subscribe.subTargetNickname}</a>
        </c:forEach>
      </div>
    </div>
    
    <div class="col-lg-10 border-0" style="background-color: rgb(247, 247, 247);"><br />
      
      <div class="h4">이번 주</div><br />
        <div class="card-columns">
          <c:set var = "i" value = "0" />
          <c:forEach var = "diary" items = "${diaryListWeekBefore}">
            <c:set var = "i" value = "${i+1}" />
            <div class="card" style="width: 18rem">
              <img class="card-img-top" src="..." alt="${diary.thumbnail}">
              <div class="card-body">
                <h5 class="card-title">${diary.title}</h5>
                <!-- <p class="card-text">${diary.content}</p> -->
                <p class="card-text"><small class="text-muted">${diary.location}</small></p>
                <p class="card-text"><small class="text-muted">${diary.writeDate}</small></p>
                <p class="card-text"><small class="text-muted">조회수 ${diary.viewCount}회</small></p>
            </div>
          </div>
        </c:forEach>


      </div>
      <hr />
      
      <div class="h4">이번 달</div><br />
      <div class="card-columns">
        <c:set var = "i" value = "0" />
        <c:forEach var = "diary" items = "${diaryListMonthBefore}">
          <c:set var = "i" value = "${i+1}" />
          <div class="card" style="width: 18rem">
            <img class="card-img-top" src="..." alt="${diary.thumbnail}">
            <div class="card-body">
              <h5 class="card-title">${diary.title}</h5>
              <!-- <p class="card-text">${diary.content}</p> -->
              <p class="card-text"><small class="text-muted">${diary.location}</small></p>
              <p class="card-text"><small class="text-muted">${diary.writeDate}</small></p>
              <p class="card-text"><small class="text-muted">조회수 ${diary.viewCount}회</small></p>
          </div>
        </div>
      </c:forEach>

          



      </div>
      <hr />

      <div class="h4">이전</div><br />
      <div class="card-columns">
        <c:set var = "i" value = "0" />
        <c:forEach var = "diary" items = "${diaryListBefore}">
          <c:set var = "i" value = "${i+1}" />
          <div class="card" style="width: 18rem">
            <img class="card-img-top" src="..." alt="${diary.thumbnail}">
            <div class="card-body">
              <h5 class="card-title">${diary.title}</h5>
              <!-- <p class="card-text">${diary.content}</p> -->
              <p class="card-text"><small class="text-muted">${diary.location}</small></p>
              <p class="card-text"><small class="text-muted">${diary.writeDate}</small></p>
              <p class="card-text"><small class="text-muted">조회수 ${diary.viewCount}회</small></p>
          </div>
        </div>
        </c:forEach>


      </div>

    </div>
	</div>
  
	</body>
</html>