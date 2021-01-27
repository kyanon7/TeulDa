<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko-KR">

	<head>
		<meta charset="UTF-8" />
		<title>나의 후기 목록</title>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">

    <style>
      .card-columns {
          column-count: 4;
      }
    </style>

		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

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
        <div class="bs-component">
        <ul class="list-group">
          <li class="h3 nav-header disabled"><a>구독</a></li>
          <c:set var = "i" value = "0" />
          <c:forEach var = "subscribe" items = "${subscribeList}">
            <c:set var = "i" value = "${i+1}" />
            <li class="list-group-item d-flex justify-content-between align-items-center" style="border: none">
            <a href="#">${subscribe.subTargetNickname}</a>
          <!-- <span class="badge badge-primary badge-pill">X</span> -->
          </li>
        </c:forEach>
        </ul>
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