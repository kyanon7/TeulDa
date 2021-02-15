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
		.form-control form-control-sm { width:100px; }
		#addHashTag { width: 300px; margin: 0px auto; text-align: center; }
		#hashTagList input { text-align: center; width: 100px; }
		</style>
		<script>
		
		var i = 0; // 해시태그 갯수 count 위함 
		
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
			
			/* 파일 업로드 */
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
			}  
			
			$('#currency').change(function() { // 지출내역 화폐 관련 
				var state = $('#currency option:selected').val();

				if (state == 'KRW') {
					$('.input-group-prepend span').html('₩');
				} else if (state == 'USD') {
					$('.input-group-prepend span').html('$');
				} else if (state == 'JPY') {
					$('.input-group-prepend span').html('¥');
				} else if (state == 'EUR') {
					$('.input-group-prepend span').html('€');
				} else if (state == 'AUD') {
					$('.input-group-prepend span').html('A$');
				} else {
					$('.input-group-prepend span').html('');
				}
			});
			
		});
		
		function addDiary() {
			$("form").attr("method", "POST").attr("action", "/diary/addDiary").submit();
		}
		
		$(function () {
			
			// 제목, 여행 시작날짜, 여행 종료 날짜 조건 걸어줘서 널값이면 등록 안되게 함  
			$("button:contains('등록')").on("click", function() {
				if ($("input[name='title']").val() == "") {
					alert("제목은 반드시 입력하셔야 합니다!"); 
				} else if ($("input[name='startDate']").val() == "") {
					alert("여행 시작날짜를 반드시 입력하셔야 합니다!"); 
				} else if ($("input[name='endDate']").val() == "") {
					alert("여행 종료날짜를 반드시 입력하셔야 합니다!"); 
				} else {
					alert("등록이 완료되었습니다!"); 
					addDiary();
				}
			}); 
			
			$("img[src='../resources/images/marker_blue.png']").on("click", function() { // 아이콘 사진 변경시 src 수정해주기 
				history.go(-1);
			});		
		});
		
		$(function () {
			$("#addHashTag").on("keypress", function (e) {
            	var self = $(this);
            	
            	// input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
            	if (e.key === "Enter" || e.keyCode == 32) {

                	var tagValue = "#" + self.val(); // 값 가져오기
                	tagValue = tagValue.replace(/\,/g, ''); // 콤마 삭제 
                	
                	// 값이 없으면 동작 ㄴㄴ
               		if (tagValue !== "") {
              	
                		$('#hashTagList').append (                        
                      		'<input name="hashTagList['+ i +'].hashTagName" value='+  tagValue  +' class="form-control form-control-sm" type="text" id="hashTag" maxlength="10" readonly>&nbsp;'                    
                    	); // end append  
                    	
                    	//alert(tagValue);
                    	self.val(""); // 들어있는 태그 비워줌
                    	i++;
                	}
                	e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
            	}
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
			<!-- ======= Diary Left ToolBar ======= -->
			<div class="col-md-3">
  				<jsp:include page="../diary/leftbar.jsp" />
			</div>
			<!-- End ToolBar -->

			<div class="col-md-9">
				<form name="addDiary">

					<input type="text" name="title" class="form-control" placeholder="제목"><br>
					<div class="row">
						<div class="col-md-12">
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
					</div><br>
					<div class="row">
						<div class="col-md-6">
							<label class="control-label">&nbsp; 여행 시작날짜</label>
							<input type="date" name="startDate" class="form-control" data-placeholder="여행 시작날">
						</div>
						<div class="col-md-6">
							<label class="control-label">&nbsp; 여행 종료날짜</label>
							<input type="date" name="endDate" class="form-control" data-placeholder="여행 종료날">
						</div>
					</div>
					<br>
					<!-- form 안에 에디터를 사용하는 경우 -->
					<textarea id="summernote" name="content"></textarea>
					<br>
							
					<hr class="my-4">
							
					<h5>EXPENSES</h5>
					<div class="form-group">
						<div class="row">
							<div class="col-md-6">
								<label class="control-label">통화 선택</label>
								<div class="form-group">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"></span>
										</div>
										<select class="form-control" id="currency" name="currency">
												<option value="NONE">통화</option>
												<option value="KRW">KRW</option>
												<option value="USD">USD</option>
												<option value="JPY">JPY</option>
												<option value="EUR">EUR</option>
												<option value="AUD">AUD</option>
										</select>
										<div class="input-group-append">
											<span class="input-group-text"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<label class="control-label">교통비</label>
								<div class="form-group">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"></span>
										</div>
										<input type="text" value="0" class="form-control" name="transBill">
										<div class="input-group-append">
											<span class="input-group-text"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label">숙박비</label>
								<div class="form-group">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"></span>
										</div>
										<input type="text" value="0" class="form-control" name="roomBill">
										<div class="input-group-append">
											<span class="input-group-text"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<label class="control-label">식비</label>
								<div class="form-group">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"></span>
										</div>
										<input type="text" value="0" class="form-control" name="foodBill">
										<div class="input-group-append">
											<span class="input-group-text"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label">관광비</label>
								<div class="form-group">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"></span>
										</div>
										<input type="text" value="0" class="form-control" name="tourBill">
										<div class="input-group-append">
											<span class="input-group-text"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<label class="control-label">쇼핑비</label>
								<div class="form-group">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"></span>
										</div>
										<input type="text" value="0" class="form-control" name="shopBill">
										<div class="input-group-append">
											<span class="input-group-text"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<hr class="my-4">
							
							<h5>HASHTAG</h5>					
								<input placeholder="태그 입력 후 Enter 또는 Space Bar (10글자 이하)" 
								    	class="form-control form-control-sm" type="text" id="addHashTag" maxlength="10">&nbsp;
								    	
								<div class="row" id="hashTagList">
								    	
								</div>   
							
					
<!-- 					<div class="row"> -->
<!-- 						<h5>기념품</h5> -->
<!-- 					</div> -->
					<hr class="my-4">
					
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
    							<button type="button" class="btn btn-primary btn-sm" style="float: right;" >등록</button>
							</div>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	<br>
	</body>
</html>