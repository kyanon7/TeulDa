<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>나의 후기 목록</title>

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">

		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
		
		<script type="text/javascript">

			window.addEventListener('DOMContentLoaded', function(){
				const reviewNo = document.querySelectorAll('.review td:nth-child(2)');
				reviewNo.forEach(function(each){
					each.addEventListener('click', function(){
						let getReview = this.querySelector('div').textContent.replace(/[\n\r]+|[\s]{2,}/g, ' ').trim();
						location.href = "/review/getReview?reviewNo="+getReview;
					});
				});
			});
			
			window.addEventListener('DOMContentLoaded', function(){
				const writeDown = document.querySelector("button[type='button'].btn.btn-primary")
				writeDown.addEventListener('click', function(){
					location.href = "/review/addReview";
				});
			});

			window.addEventListener('DOMContentLoaded', function(){
				let starList = new Array();
				const stars = document.querySelectorAll('.review td:nth-child(4)');
				stars.forEach(function(each){
					let star = each.querySelector("div[style='display:none']").textContent.replace(/[\n\r]+|[\s]{2,}/g, ' ').trim();
					starList.push(parseInt(star));
				});

				for (var i = 0; i < stars.length; i++) {
					$(".rateYo").eq(i).rateYo({
						rating: starList[i],
						readOnly: true,
						starWidth: "20px"
					});
				}
			});

		</script>

	</head>
	<body>

	<header>
		<jsp:include page="../layout/toolbar.jsp"/><br />
	</header>

	<div class="row">
		<br />
	</div>
	<div class="container-fullwidth align-items-center">

		<div class="row">
			<div class="col-lg-2">
			</div>

			<div class="col-lg-8">


				<table class="table table-striped">
					<thead>
						<tr>
							<th class="text-center" scope="col">번호</th>
							<th class="text-center" scope="col">후기</th>
							<th class="text-center" scope="col">작성일</th>
							<th class="text-center" scope="col">나의 평점</th>
						</tr>
					</thead>
					<tbody>
						<c:set var = "i" value = "0" />
						<c:forEach var = "review" items = "${list}">
							<c:set var = "i" value = "${i+1}" />
							<tr class="review">
							<th class="text-center" scope="row">${review.reviewNo}</th>
								<td><a href="#" >${fn:substring(review.reviewContents, 0, 29)}...</a>
								<div style="display:none">${review.reviewNo}</div></td>
								<td class="text-center">${fn:substring(review.reviewDate, 0, 10)}</td>
								<td class="text-center"><div style="margin: 0 auto" id="rateYo" class="rateYo"><div style="display:none">${review.star}</div></td>
							</tr>
						</c:forEach>
				</table>
				<div class="row justify-content-end">
					<button type="button" class="btn btn-primary btn-sm" >후기 쓰기</button>&nbsp;&nbsp;&nbsp;&nbsp;
				</div>

				<div class="row justify-content-center">
					<ul class="pagination">
					  <li class="page-item disabled">
						<a class="page-link" >&laquo;</a>
					  </li>
					  <li class="page-item active" >
						<a class="page-link" href="#">1</a>
					  </li>
					  <li class="page-item" wfd-id="238">
						<a class="page-link" href="#">2</a>
					  </li>
					  <li class="page-item" wfd-id="237">
						<a class="page-link" href="#">3</a>
					  </li>
					  <li class="page-item" wfd-id="236">
						<a class="page-link" href="#">4</a>
					  </li>
					  <li class="page-item" wfd-id="235">
						<a class="page-link" href="#">5</a>
					  </li>
					  <li class="page-item" >
						<a class="page-link" href="#">&raquo;</a>
					  </li>
					</ul>
				  </div>
				  

			</div>


			<div class="col-lg-2">
			</div>


		</div>
	
	</div>

	</body>
</html>