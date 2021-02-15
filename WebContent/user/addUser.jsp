<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8" />
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.6.0/dist/lux/bootstrap.min.css" integrity="sha256-n1LAsYCohTi3YOpx8/Jhgf1i6BLuraa4Bnx/qTd4Vs0=" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/rateyo@2.3.5/src/jquery.rateyo.css" integrity="sha256-NGkqAxC1CKM2ILB67FglDNhS5Sd2kKAacTcoWKznSZU=" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/multiUploadFields.css">

		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha256-7dA7lq5P94hkBsWdff7qobYkp9ope/L5LQy2t/ljPLo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/rateyo@2.3.5/src/jquery.rateyo.js" integrity="sha256-Sq0rSsEMzpXVg0elKKGMr0h0buMHMdRApm944Lh6XoA=" crossorigin="anonymous"></script>
		<script src="../resources/js/multiUploadFields.js"></script>
	
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
	
	<!-- jQuery CDN -->
		<<!-- script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script> -->
		
		<!-- Bootstrap CDN -->
	    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->

   
   <!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        .select-img img {
				max-width: 100%;
				max-height: auto;
				display: block;
				margin: auto;
			}
        
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	document.addEventListener('DOMContentLoaded', function(){

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
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		
		function fncAddUser() {
			
			var email=$("input[name='email']").val();
			var password=$("input[name='password']").val();
			var name=$("input[name='userName']").val();
			var nickname=$("input[name='nickname']").val();
			var phone=$("input[name='phone']").val();
			var address=$("input[name='address']").val();
			var likeaddr=$("input[name='likePlace']").val();
			var ispublic=$("input[0]").val();
			//var photo=$("input[name='profilePhoto']").val();
		
			
			
			if(email == null || email.length <1){
				alert("이메일은 반드시 입력하셔야 합니다.");
				return;
			}
			
			if(password == null || password.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				return;
			}

			
			
			if(nickname == null || nickname.length <2){
				alert("닉네임은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(phone == null || phone.length <10){
				alert("전화번호는  반드시 입력하셔야 합니다.");
				return;
			}
		


		 $("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		
		
			</script>	
   

</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->

    	<jsp:include page="/layout/toolbar.jsp"/>
	
   	<!-- ToolBar End /////////////////////////////////////-->
<div class="col-lg-10"><!-- 길이지정 -->
<div class="bs-component"><!-- 컴포넌트는 부트스트랩에서 정의한 UI 요소로 버튼, 경고창, 네비게이션바 와 같이 화면 구성에 필요한 요소들을 정의해둔 클래스 집합 입니다 -->
<form data-dpmaxz-fid="4" enctype="multipart/form-data">
  <fieldset>
  
  	<div class="select-img"><img src="" /></div>
  	<br/><br/>
	<h1 class="text-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Join Our Site!</h1>
	
	<h3 class="text-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;필수입력정보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
    
    
    <div class="form-group">
  		<label for="email" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;E-mail</label>	
  		<input type="text" class="form-control" placeholder="E-mail" name="email" id="email" >
	</div>
    
   

    <div class="form-group">
  		<label for="password" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</label>
  		
  		<input type="password" class="form-control" placeholder="password" name="password" id="password" >
  		
	</div>
    
    <div class="form-group">
  		<label for="name" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;이름</label>
  		
  		<input type="text" class="form-control" placeholder="name" name="name" id="name" >	
		
	</div>
	
	<div class="form-group">
  		<label for="nickname" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;닉네임</label>
  		
  		<input type="text" class="form-control" placeholder="nickname" name="nickname" id="nickname" >
		
	</div>
	
	<div class="form-group">
  		<label for="phone" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;전화번호</label>
  		<input type="text" class="form-control" placeholder="phone" name="phone" id="phone" >
		<small class="form-text text-muted" id="emailHelp">11자 이상 입력</small>		
	</div>
		<h3 class="text-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;선택입력정보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
	<div class="form-group">
			  		<label for="address" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;주소</label>	
			  		<input type="text" class="form-control" placeholder="주소" name="address" id="address" >
			  </div>
			  
			  <div class="form-group">
			  		<label for="likePlace" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;관심지역</label>	
			  		<input type="text" class="form-control" placeholder="관심지역" name="likePlace" id="likePlace" >
			  </div>
	
	    

    <!-- <div class="form-group">
      <label for="exampleInputFile">File input</label>
      <input class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp" type="file" data-dpmaxz-eid="7">
      <small class="form-text text-muted" id="fileHelp">프로필 사진 업로드</small>
    </div> -->
   
  <!--  <div class="form-group">
      <label for="exampleInputFile">프로필 사진 등록</label>
      <input multiple="multiple" type="file" class="form-control-file" name="profilePhoto" id="profilePhoto">
    </div> -->
     
	<div class="container-fullwidth">
		<div class="row">
		  <div class="col-sm-offset-2 col-sm-12"><br><br>
	  <div class="form-group">
	  <div class="input-group">
		<input type="text" class="form-control" readonly>
	  <div class="input-group-btn">
		<span class="fileUpload btn btn-success">
			<span class="upl" id="upload">Upload single file</span>
			<input type="file" class="upload up" id="up" name="imageFile"/>
		  </span><!-- btn-orange -->
	   </div><!-- btn -->
	   </div><!-- group -->
	   </div><!-- form-group -->
			</div>
		  </div>
		</div>     
     
      
   
    <button class="btn btn-primary" type="submit">Submit</button>
   
  </fieldset>
  
</form>
</div>
</div>
</body>