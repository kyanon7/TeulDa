<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>나의 후기 목록</title>

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.6.0/dist/lux/bootstrap.min.css" integrity="sha256-n1LAsYCohTi3YOpx8/Jhgf1i6BLuraa4Bnx/qTd4Vs0=" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/rateyo@2.3.5/src/jquery.rateyo.css" integrity="sha256-NGkqAxC1CKM2ILB67FglDNhS5Sd2kKAacTcoWKznSZU=" crossorigin="anonymous">
		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha256-7dA7lq5P94hkBsWdff7qobYkp9ope/L5LQy2t/ljPLo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/rateyo@2.3.5/src/jquery.rateyo.js" integrity="sha256-Sq0rSsEMzpXVg0elKKGMr0h0buMHMdRApm944Lh6XoA=" crossorigin="anonymous"></script>


		<script type="text/javascript">

			document.addEventListener('DOMContentLoaded', () => {
				const reviewNo = document.querySelectorAll('.review td:nth-child(2)');
				reviewNo.forEach(function(each){
					let target = each.querySelector('a');
					target.addEventListener('click', function(){
						let getReview = each.querySelector('div').textContent.replace(/[\n\r]+|[\s]{2,}/g, ' ').trim();
						location.href = "/review/getReview?reviewNo="+getReview;
					});
				});
			});
			
			document.addEventListener('DOMContentLoaded', () => {
				const writeDown = document.querySelector("button[type='button'].btn.btn-primary")
				writeDown.addEventListener('click', function(){
					location.href = "/review/addReview";
				});
			});

			document.addEventListener('DOMContentLoaded', () => {
				const stars = document.querySelectorAll('.review td:nth-child(4)');
				stars.forEach( (each, index) => {
					let star = each.querySelector("div[style='display:none']").textContent.replace(/[\n\r]+|[\s]{2,}/g, ' ').trim();
					$(".rateYo").eq(index).rateYo({
						rating: star,
						readOnly: true,
						starWidth: "20px"
					});
				});
			});

			// document.addEventListener('DOMContentLoaded', () => {
			// 	const rowSelect = document.querySelectorAll('tr.review');
			// 	rowSelect.forEach( each => {
			// 		each.addEventListener('mouseenter', e => {
			// 			console.log(e);
			// 		});
			// 	});
			// });
			
			function fncGetList(currentPage){
				let pageNo = document.querySelector('#currentPage')
				pageNo.value = currentPage;
				
				const form = document.querySelector("form");
				form.setAttribute("method", "POST");
				form.submit();
			}

		</script>

	</head>
	<body>

	<header>
		<jsp:include page="../layout/toolbar.jsp"/><br />
	</header>

	<form>
		<div class="row">
			<br />
		</div>
		<div class="container-fullwidth align-items-center">

			<div class="row">
				<div class="col-lg-2">
				</div>

				<div class="col-lg-8">

					<legend>나의 후기</legend><br />
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="text-center" scope="col">글 번호</th>
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
									<td>
										<div style="display:none">${review.reviewNo}</div>
										<span class="d-inline-block text-truncate" style="max-width: 400px;"><a href="#" >${review.reviewContents}</a>
									</td>
									<td class="text-center">${fn:substring(review.reviewDate, 0, 10)}</td>
									<td class="text-center"><div style="margin: 0 auto" id="rateYo" class="rateYo"><div style="display:none">${review.star}</div></td>
								</tr>
							</c:forEach>
					</table>
					<div class="row justify-content-end">
						<button type="button" class="btn btn-primary btn-sm" >후기 쓰기</button>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>

					<input type="hidden" id="currentPage" name="currentPage" value="0"/>
					<jsp:include page="../common/pageNavigator.jsp"/>

				</div>

				<div class="col-lg-2">
				</div>

			</div>
		
		</div>
	</form>
	</body>
</html>