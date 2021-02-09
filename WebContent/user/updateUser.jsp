<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
	
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
            margin-top: 60px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn-outline-primary" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		
		$(function() {
		 $('').mouseover(function(){
		    $('body').append('<p>이메일, 닉네임, 전화번호는 바꾸실 수 없습니다.</p>')
		  })
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		
		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			var name=$("input[name='name']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			
			if(name == null || name.length <1){
				alert("이름은 반드시 입력하셔야 합니다.");
				return;
			}
			
			if(pw == null || pw.length <1){
				alert("비밀번호는 반드시 입력하셔야 합니다.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}
				
		
			
			
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
		    <label for="address" class="class="col-form-label">거주지 주소</label>
		      <input type="text" class="form-control" id="address" name="address"  value="${user.address}" placeholder="변경거주지">
		  </div>
		  
		  <div class="form-group">
		    <label for="likePlace" class="class="col-form-label">관심 지역</label>
		      <input type="text" class="form-control" id="likePlace" name="likePlace"  value="${user.likePlace}" placeholder="변경관심지역">
		  </div>
		  
		  
		  <input type="hidden" name="is_public" value="${user.isPublic}" />
		  <input type="hidden" name="status" value="${user.status}" />
		  <input type="hidden" name="role" value="${user.role}" />

		  
		  <div class="form-group">
		    <div class="text-center">
		      <button type="button" class="btn btn-outline-primary"  >수정</button>
			  &nbsp;&nbsp;&nbsp;&nbsp;
			  <a class="btn btn-outline-secondary" href="javascript:history.go(-1)" role="button">취소</a>
		    </div>
		  </div>
		 
	    </form>
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>