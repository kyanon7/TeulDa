<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>기록 작성</title>
	    
	    <!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
		<!-- Summer note lite CDN -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
   		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
		<style>
		h5 { text-align: center; }
		th { text-align: center; }
		td { text-align: center; }
		.form-control form-control-sm { "width:100px;" }
		</style>
		<script>
		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				  height: 550,                 // 에디터 높이
				  minHeight: null,             // 최소 높이
				  maxHeight: null,             // 최대 높이
				  focus: true,                 // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",			   // 한글 설정
				  placeholder: '여행 기록을 자유롭게 남겨주세요',	//placeholder 설정
				  callbacks: {	// 이미지를 업로드할 때 사용하는 callback 함수
						onImageUpload : function(files) {
							uploadSummernoteImageFile(files[0], this);
						},
						onPaste: function (e) { // 복사한 사진을 ctrl+v로 붙여넣을때 사용하는 onPaste 함수 
							// 기본값을 사용하면 복붙시 base64로 인코딩된 src 이미지 파일과 
							// onImageUpload에서 구현한 url 기반의 이미지 파일이 두개가 들어가는 버그가 생김. 따라서 아래와 같이 재설정을 해준다 
							var clipboardData = e.originalEvent.clipboardData;
							if (clipboardData && clipboardData.items && clipboardData.items.length) {
								var item = clipboardData.items[0];
								if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
									e.preventDefault();
								}
							}
						}
				  }
			});
			
			/* 파일 업로드
			function uploadSummernoteImageFile(file, editor) {
					data = new FormData();
					data.append("file", file);
					$.ajax({
						data : data,
						type : "POST",
						url : "/diary/rest/uploadSummernoteImageFile",
						contentType : false,
						processData : false,
						success : function(data) {
            				//항상 업로드된 파일의 url이 있어야 한다.
							$(editor).summernote('insertImage', data.url);
						}
					});
			}  */
			
			$('#currency').change(function() { // 추후 수정예정 - 지출내역 화폐 관련 
				var state = $('#currency option:selected').val();
				var currency = $('#showCurrency').val();
				if (state == 'KRW') {
					$('#showCurrency').val('₩');
				} else if (state == 'USD') {
					$('#showCurrency').val('$');
				} else if (state == 'JPY') {
					$('#showCurrency').val('¥');
				} else if (state == 'EUR') {
					$('#showCurrency').val('€');
				} else if (state == 'AUD') {
					$('#showCurrency').val('A$');
				} else {
					$('#showCurrency').val('');
				}
			});
			
		});
		
		function addDiary() {
			$("form").attr("method", "POST").attr("action", "/diary/addDiary").submit();
		}
		
		$(function () {
			
			$("button:contains('등록')").on("click", function() {
				addDiary();
			});
			
			$("img[src='../resources/images/marker_blue.png']").on("click", function() { // 아이콘 사진 변경시 src 수정해주기 
				history.go(-1);
			});		
		});
		
		</script>
	</head>
	<body>
	  	<!-- ======= Header ======= -->
		<header>
			<jsp:include page="../layout/toolbar.jsp"/>
		</header><br/><br/>
		<!-- End Header -->

	<div class="container">
		<div class="row">
			<!-- ======= Left ToolBar ======= -->
			<div class="col-md-3">
				<jsp:include page="../diary/leftbar.jsp" />
			</div>
			<!-- End ToolBar -->

			<div class="col-md-9">
				<form name="addDiary">

					<input type="text" name="title" class="form-control" placeholder="제목 (반드시 입력)"><br>
					<div class="row">
						<div class="col-md-8">
							<div class="row">
								<div class="col-md-1">
									<img src="../resources/images/marker_blue.png" height="40px">
								</div>
								<div class="col-md-11">
									<input class="form-control" name="location" type="text" value="${ param.location }" readonly>
									<input class="form-control" name="latitude" type="hidden" value="${ param.latitude }">
									<input class="form-control" name="longitude" type="hidden" value="${ param.longitude }">
								</div>
							</div>
						</div>
						<div class="col-md-2">
							<input type="text" name="startDate" class="form-control" placeholder="여행 시작날">
						</div>
						<div class="col-md-2">
							<input type="text" name="endDate" class="form-control" placeholder="여행 종료날">
						</div>
					</div>
					<br>
					<!-- form 안에 에디터를 사용하는 경우 -->
					<textarea id="summernote" name="content"></textarea>
					<br>
					<div class="row">
						<div class="col-md-6">
							<h5>지출내역</h5>
							<table class="table table-hover">
								<thead>
									<tr class="table-light">
										<th scope="col">분 류</th>
										<th scope="col">금 액</th>
										<th scope="col"><select class="form-control" name="currency" style="width: 100px; height: 50px;">
												<option value="NONE">통화</option>
												<option value="KRW">KRW</option>
												<option value="USD">USD</option>
												<option value="JPY">JPY</option>
												<option value="EUR">EUR</option>
												<option value="AUD">AUD</option>
										</select></th>
									</tr>
								</thead>
								<tbody>
									<tr class="table-light">
										<th scope="row">교통비</th>
										<td><input class="form-control form-control-sm" type="text" name="transBill" style="width: 100px;"></td>
										<td><input class="form-control form-control-sm" type="text" id="showCurrency" style="width: 100px;" readonly></td>
									</tr>
									<tr class="table-light">
										<th scope="row">숙박비</th>
										<td><input class="form-control form-control-sm" type="text" name="roomBill" style="width: 100px;"></td>
										<td><input class="form-control form-control-sm" type="text" id="showCurrency" style="width: 100px;" readonly></td>
									</tr>
									<tr class="table-light">
										<th scope="row">식비</th>
										<td><input class="form-control form-control-sm" type="text" name="foodBill" style="width: 100px;"></td>
										<td><input class="form-control form-control-sm" type="text" id="showCurrency" style="width: 100px;" readonly></td>
									</tr>
									<tr class="table-light">
										<th scope="row">관광비</th>
										<td><input class="form-control form-control-sm" type="text" name="tourBill" style="width: 100px;"></td>
										<td><input class="form-control form-control-sm" type="text" id="showCurrency" style="width: 100px;" readonly></td>
									</tr>
									<tr class="table-light">
										<th scope="row">쇼핑비</th>
										<td><input class="form-control form-control-sm" type="text" name="shopBill" style="width: 100px;"></td>
										<td><input class="form-control form-control-sm" type="text" id="showCurrency" style="width: 100px;" readonly></td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="col-md-6">
							<h5>해시태그 (임시구현)</h5>
							<div class="row">
								<input name="hashTagList[0].hashTagName" class="form-control form-control-sm" type="text" id="hashTag" maxlength="10" style="width: 100px;">&nbsp;
								<input name="hashTagList[1].hashTagName" class="form-control form-control-sm" type="text" id="hashTag" maxlength="10" style="width: 100px;">&nbsp; 
								<input name="hashTagList[2].hashTagName" class="form-control form-control-sm" type="text" id="hashTag" maxlength="10" style="width: 100px;">&nbsp; 
								<input name="hashTagList[3].hashTagName" class="form-control form-control-sm" type="text" id="hashTag" maxlength="10" style="width: 100px;">&nbsp;  
							</div>
						</div>
					</div>
					
					<div class="row">
						<h5>기념품</h5>
					</div>
					
					<div class="row">
						<div class="col-md-9"></div>
						<div class="col-md-3">
							<div class="row">
								<div class="custom-control custom-radio">
      								<input type="radio" value = "t" id="customRadio1" name="isPublic" class="custom-control-input" checked="">
      								<label class="custom-control-label" for="customRadio1">공개</label>
    							</div>
    							&nbsp;&nbsp;
    							<div class="custom-control custom-radio">
      								<input type="radio" value = "f" id="customRadio2" name="isPublic" class="custom-control-input">
      								<label class="custom-control-label" for="customRadio2">비공개</label>
    							</div>
    							&nbsp;&nbsp;
    							<button type="button" class="btn btn-outline-info">등록</button>
							</div>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>

	기록 작성 화면 ! 
  	<br>
  	여행지 위치 : ${ param.location }
  	<br>
  	여행지 위도 : ${ param.latitude }
  	<br>
  	여행지 경도 : ${ param.longitude }
  	<br>
  	
  	
	</body>
</html>