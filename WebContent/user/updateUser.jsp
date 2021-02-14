<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.6.0/dist/lux/bootstrap.min.css" integrity="sha256-n1LAsYCohTi3YOpx8/Jhgf1i6BLuraa4Bnx/qTd4Vs0=" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/rateyo@2.3.5/src/jquery.rateyo.css" integrity="sha256-NGkqAxC1CKM2ILB67FglDNhS5Sd2kKAacTcoWKznSZU=" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/multiUploadFields.css">

		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha256-7dA7lq5P94hkBsWdff7qobYkp9ope/L5LQy2t/ljPLo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/rateyo@2.3.5/src/jquery.rateyo.js" integrity="sha256-Sq0rSsEMzpXVg0elKKGMr0h0buMHMdRApm944Lh6XoA=" crossorigin="anonymous"></script>
		<script src="../resources/js/multiUploadFields.js"></script>
	    <!-- <<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	jQuery CDN
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		Bootstrap CDN
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
	 -->
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
            margin-top: 50px;
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
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn-outline-primary" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		//=============이메일" 유효성Check  Event 처리 =============
		 
		
		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			var name=$("input[name='name']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}
				
			var value = "";	
			if( $("input[name='phone2']").val() != ""  &&  $("input[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}
			
			//Debug...
			//alert("phone : "+value);
			$("input:hidden[name='phone']").val( value );
				
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
	
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="text-center">개인정보 수정</h1>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form">
		
		  <div class="form-group has-danger">
		    <label for="email" class="col-form-label" for="inputInvalid">이메일</label>
		      <input type="text" class="form-control is-invalid" id="email" name="email" value="${user.email }" readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">이메일 수정불가</strong>
		      </span>
		  </div>
		  
		  <div class="form-group has-danger">
		    <label for="nickname" class="col-form-label" for="inputInvalid">닉네임</label>
		      <input type="text" class="form-control is-invalid" id="nickname" name="nickname" value="${user.nickname }" readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">닉네임 수정불가</strong>
		      </span>
		  </div>
		  
		   <div class="form-group has-danger">
		    <label for="phone" class="col-form-label" for="inputInvalid">전화번호</label>
		      <input type="text" class="form-control is-invalid" id="phone" name="phone" value="${user.phone}" readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">전화번호 수정불가</strong>
		      </span>
		  </div>
		
		  <div class="form-group">
		    <label for="password" class="col-form-label">비밀번호</label>
		    <input type="password" class="form-control" id="password" name="password" placeholder="변경비밀번호">
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-form-label">비밀번호 확인</label>
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="변경비밀번호 확인">
		  </div>
		  
		  <div class="form-group">
		    <label for="name" class="col-form-label">이름</label>
		      <input type="text" class="form-control" id="name" name="name" value="${user.name}" placeholder="변경회원이름">
		  </div>
		  
		  <div class="form-group">
		    <label for="address" class="class="col-form-label">주소</label>
		      <input type="text" class="form-control" id="address" name="address"  value="${user.address}" placeholder="거주지">
		  </div>
		  
		  <div class="form-group">
		    <label for="likePlace" class="class="col-form-label">관심지역</label>
		      <input type="text" class="form-control" id="likePlace" name="likePlace"  value="${user.likePlace}" placeholder="관심지역">
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
			<input type="file" class="upload up" id="up" name="imageFile"/>
		  </span><!-- btn-orange -->
	   </div><!-- btn -->
	   </div><!-- group -->
	   </div><!-- form-group -->
			</div>
		  </div>
		</div>     
		  
		  
		  

          <input type="hidden" name="is_public" value="${user.isPublic}" />
		  <input type="hidden" name="status" value="${user.status}" />
		  <input type="hidden" name="role" value="${user.role}" />
		  
		  

		  
		  <div class="form-group">
		    <div class="text-center">
		      <button type="button" class="btn btn-outline-primary"  >수정</button>
			  &nbsp;&nbsp;&nbsp;&nbsp;
			  <a class="btn btn-outline-secondary" href="#" role="button">취소</a>
		    </div>
		  </div>
		 
	    </form>
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>