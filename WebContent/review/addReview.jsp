<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>후기 쓰기</title>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
		<link rel="stylesheet" href="../resources/css/multiUploadFields.css">

		<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
		<script src="../resources/js/multiUploadFields.js"></script>


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