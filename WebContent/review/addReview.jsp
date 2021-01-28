<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>후기 쓰기</title>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.6.0/dist/lux/bootstrap.min.css" integrity="sha256-n1LAsYCohTi3YOpx8/Jhgf1i6BLuraa4Bnx/qTd4Vs0=" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/rateyo@2.3.5/src/jquery.rateyo.css" integrity="sha256-NGkqAxC1CKM2ILB67FglDNhS5Sd2kKAacTcoWKznSZU=" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/multiUploadFields.css">

		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha256-7dA7lq5P94hkBsWdff7qobYkp9ope/L5LQy2t/ljPLo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/rateyo@2.3.5/src/jquery.rateyo.js" integrity="sha256-Sq0rSsEMzpXVg0elKKGMr0h0buMHMdRApm944Lh6XoA=" crossorigin="anonymous"></script>
		<script src="../resources/js/multiUploadFields.js"></script>

		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<style>
			.select-img img {
				max-width: 100%;
				max-height: auto;
				display: block;
				margin: auto;
			}

		</style>

		<script type="text/javascript">

		window.addEventListener('DOMContentLoaded', function(){

			const up = document.getElementById('up');
			const fileImage = document.querySelector('.select-img img');

			up.addEventListener('change', function(){
				if(this.files && this.files[0]) {
					let reader = new FileReader;
					reader.onload = function(data) {
					fileImage.setAttribute('src', data.target.result);
					fileImage.setAttribute('style', 'width: 90%');
					}
				
				reader.readAsDataURL(this.files[0]);
				}else {
					fileImage.setAttribute('src', "");
				}
			});
		});

		window.addEventListener('DOMContentLoaded', function(){
			const submit = document.querySelector("button[type='submit']");
			const form = document.querySelector("form");

			submit.addEventListener('click', function(){
				form.setAttribute("method", "POST");
				form.setAttribute("action", "/review/addReview");
				form.submit();
			});
		});

		window.addEventListener('DOMContentLoaded', function(){
			const cancel = document.querySelector(".cancel");

			cancel.addEventListener('click', function(){
				location.href = "/review/listReview";
			});
		});

		let normalFill = $("#rateYo").rateYo("option", "fullStar"); //returns true
		$("#rateYo").rateYo("option", "fullStar", true); //returns a jQuery Element

		window.addEventListener('DOMContentLoaded', function(){
			$("#rateYo").rateYo({
				rating: 2,
				fullStar: true,
				starWidth: "20px"
			});
			let star = $("#rateYo").rateYo().rateYo("rating");
			document.form.star.value = star;
		});

		window.addEventListener('DOMContentLoaded', function(){
			$("#rateYo").click(function () {
				let star = $("#rateYo").rateYo().rateYo("rating");
				document.form.star.value = star;
			});
		});

		// window.addEventListener('DOMContentLoaded', function(){
		// 	new daum.Postcode({
		// 		oncomplete: function(data) {
		// 			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		// 			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
		// 		}
		// 	}).open();
		// });
			

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
						<legend>후기 작성</legend><br />

						<div class="select-img"><img src="" /></div>

						<div class="form-group" wfd-id="361">
							<label for="inputPlace" wfd-id="362"><!--장소--></label>
							<small class="form-text text-muted">장소</small>
							<input type="place" class="form-control" id="inputPlace" name="reviewPlace" aria-describedby="palceHelp" placeholder="예) 서울시 강남구, 부산 해운대 앞바다" wfd-id="516">
							<input type="hidden" name="isAllowed" value="f"/>
							<!-- <small id="placeHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
						</div>
						<div class="form-group" wfd-id="351">
							<label for="textarea" wfd-id="352"><!--본문--></label>
							<small class="form-text text-muted">후기 내용을 200자 내외로 여기에 적어주세요.</small>
							<textarea class="form-control" id="textarea" name="reviewContents" rows="3" wfd-id="527"></textarea>
						</div>

						<div class="container-fullwidth">
							<div class="row">
							  <div class="col-sm-offset-2 col-sm-12"><br><br>
						  <div class="form-group">
						  <div class="input-group">
							<input type="text" class="form-control" readonly>
						  <div class="input-group-btn">
							<span class="fileUpload btn btn-success">
								<span class="upl" id="upload">Upload single file</span>
								<!-- <input type="file" class="upload up" id="up" onchange="readURL(this);" /> -->
								<input type="file" class="upload up" id="up" name="reviewPhoto"/>
							  </span><!-- btn-orange -->
						   </div><!-- btn -->
						   </div><!-- group -->
						   </div><!-- form-group -->
								</div>
							  </div>
							</div>

						<div class="row">
							<div class="col-md-1"> </div>
							<small class="form-text text-muted">나의 평점</small>
							<div class="col-md-3">
								<div id="rateYo"></div><input type="hidden" name="star" />
							</div>
							<div class="col-md-4"></div>
								<button type="submit" class="btn btn-primary btn-sm" >후기 등록</button>&nbsp;&nbsp;
								<button type="button" class="btn btn-primary btn-sm cancel" >취소</button>
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