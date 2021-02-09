<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>후기 보기</title>

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.6.0/dist/lux/bootstrap.min.css" integrity="sha256-n1LAsYCohTi3YOpx8/Jhgf1i6BLuraa4Bnx/qTd4Vs0=" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/rateyo@2.3.5/src/jquery.rateyo.css" integrity="sha256-NGkqAxC1CKM2ILB67FglDNhS5Sd2kKAacTcoWKznSZU=" crossorigin="anonymous">
		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha256-7dA7lq5P94hkBsWdff7qobYkp9ope/L5LQy2t/ljPLo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/rateyo@2.3.5/src/jquery.rateyo.js" integrity="sha256-Sq0rSsEMzpXVg0elKKGMr0h0buMHMdRApm944Lh6XoA=" crossorigin="anonymous"></script>

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
					history.back();
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