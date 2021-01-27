<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>후기 보기</title>

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
		
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

		<script type="text/javascript">
			window.addEventListener('DOMContentLoaded', function(){
				if('${review.nickname}' !== '${sessionScope.user.nickname}'){
					document.querySelector('.delete').setAttribute('class', 'btn btn-primary btn-sm delete invisible');
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

			window.addEventListener('DOMContentLoaded', function(){
				const deleteReview = document.querySelector('div.modal-footer').querySelector("button[type='button'].btn.btn-primary");
				deleteReview.addEventListener('click', function(){

					fetch('/review/rest/deleteReview/${review.reviewNo}', {
						method: 'GET',
						headers: {
							"Content-Type": "application/json"
						},
						credentials : "same-origin"
					})
					.then(res => res.json())
					.then(result => {
						if(result){
							alert('후기가 삭제되었습니다.');
							location.href = "/review/listReview";
						}else{
							alert('후기 삭제에 실패했습니다.');
							location.reload = "/review/getReview?reviewNo=${review.reviewNo}";	
						}
					})
					.catch(err =>{
						alert('후기 삭제에 실패했습니다.');
						location.reload = "/review/getReview?reviewNo=${review.reviewNo}";
					});
				});
			});

			window.addEventListener('DOMContentLoaded', function(){
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
								<div style="line-height: 50%;"><br /></div>
								<p>${review.reviewPlace}</p>
							</div>
							<div class="form-group" wfd-id="351">
								<label for="textarea" wfd-id="352"></label>
								<small class="form-text text-muted">후기 내용</small>
								<div style="line-height: 50%;"><br /></div>
								<p>${review.reviewContents}</p>
								<br />
							</div>

							<div class="row">
								<div class="col-md-1"> </div>
								<small class="form-text text-muted">나의 평점</small>
								<div class="col-md-3">
									<div id="rateYo"></div>
								</div>
								<div class="col-md-3"></div>
									<button type="button" class="btn btn-primary btn-sm delete" data-toggle="modal" data-target="#deleteReview">후기 삭제</button>&nbsp;&nbsp;
									<button type="button" class="btn btn-primary btn-sm edit" >후기 수정</button>&nbsp;&nbsp;
									<button type="button" class="btn btn-primary btn-sm list" >후기 목록</button>
							</div>
							<br />

						</fieldset>
					</form>
					

				</div>

				<div class="col-lg-3">
				</div>

				<!-- DeleteReview Modal Start-->
				<div class="modal fade" id="deleteReview" tabindex="-1" aria-labelledby="deleteReviewLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="deleteReviewLabel">후기 삭제</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							</div>
							<div class="modal-body">현재 후기를 삭제하시겠습니까?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">삭제 취소</button>
								<button type="button" class="btn btn-primary">삭제</button>
							</div>
						</div>
					</div>
				</div>
				<!-- DeleteReview Modal End-->

				<!-- Result Modal Start -->
				<!-- <button type="button" class="btn btn-primary result sr-only" data-toggle="modal" data-target=".bd-example-modal-sm">result</button>

				<div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="deleteAlertLabel">처리 결과</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							</div>
							<div class="modal-body">후기가 삭제되었습니다.</div>
						</div>
					</div>
				</div> -->
				<!-- Result Modal End -->

			</div>
		</div>

	</body>
</html>