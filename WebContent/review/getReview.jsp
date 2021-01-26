<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>후기 보기</title>

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
		
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

		<script type="text/javascript">
			window.addEventListener('DOMContentLoaded', function(){
				if('${review.nickname}' !== '${sessionScope.user.nickname}'){
					document.querySelector('.edit').setAttribute('class', 'btn btn-primary btn-sm edit invisible');
				}
			});

			window.addEventListener('DOMContentLoaded', function(){
				document.querySelector(".edit").addEventListener('click', function(){
					location.href = "/review/updateReview?reviewNo=${review.reviewNo}";
				});
				
				document.querySelector(".list").addEventListener('click', function(){
					location.href = "/review/listReview";
				});
			});

			$(function () {
				$("#rateYo").rateYo({
					rating: "${review.star}",
					readOnly: true,
					starWidth: "20px"
				});
			});

		</script>
		
	</head>
	<body>

		<header>
			<jsp:include page="../layout/toolbar.jsp"/><br />
		</header>

		<br />

		<div class="container-fullwidth align-items-center">
			<div class="row">
				<div class="col-lg-3">
				</div>

				<div class="col-lg-6">

					<form name="form">
						<fieldset>
							<legend>후기</legend><br />

							<div class="select-img"><img src="${review.reviewPhoto}" style="width: 90%;"/></div>

							<div class="form-group" wfd-id="361">
								<label for="inputPlace" wfd-id="362"></label>
								<small class="form-text text-muted">장소</small>
								<!-- <input type="place" class="form-control" id="inputPlace" aria-describedby="palceHelp" placeholder="예) 서울시 강남구, 부산 해운대 앞바다" wfd-id="516"> -->
								<div style="line-height: 50%;"><br /></div>
								<p>${review.reviewPlace}</p>
							</div>
							<div class="form-group" wfd-id="351">
								<label for="textarea" wfd-id="352"></label>
								<small class="form-text text-muted">후기 내용</small>
								<div style="line-height: 50%;"><br /></div>
								<!-- <textarea class="form-control" id="textarea" rows="3" wfd-id="527">${review.reviewContents}</textarea> -->
								<p>${review.reviewContents}</p>
								<br />
							</div>

							<div class="row">
								<div class="col-md-1"> </div>
								<small class="form-text text-muted">나의 평점</small>
								<div class="col-md-3">
									<div id="rateYo"></div>
								</div>
								<div class="col-md-4"></div>
									<button type="button" class="btn btn-primary btn-sm edit" >후기 수정</button>&nbsp;&nbsp;
									<button type="button" class="btn btn-primary btn-sm list" >후기 목록</button>
							</div>
							<br />

						</fieldset>
					</form>
					

				</div>

				<div class="col-lg-3">
				</div>


			</div>
		</div>

	</body>
</html>