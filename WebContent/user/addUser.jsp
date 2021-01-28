<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8" />
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
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
			var photo=$("input[name='profilePhoto']").val();
		
			
			
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
<form data-dpmaxz-fid="4">
  <fieldset>
  
  	<br/><br/>
	<h1 class="text-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Join Our Site!</h1>
	
	<h3 class="text-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;필수입력정보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
    
    
    <div class="form-group">
  		<label for="email" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;E-mail</label>	
  		<div class="col-sm-4">
  		<input type="text" class="form-control" placeholder="E-mail" name="email" id="email" >
  		<small class="form-text text-muted" id="emailHelp">We'll never share your email with anyone else.</small>
  		</div>
	</div>
    
   

    <div class="form-group">
  		<label for="password" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</label>
  		<div class="col-sm-4">
  		<input type="text" class="form-control" placeholder="password" name="password" id="password" >
  		</div>
	</div>
    
    <div class="form-group">
  		<label for="name" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;이름</label>
  		<div class="col-sm-4">
  		<input type="text" class="form-control" placeholder="name" name="name" id="name" >	
		</div>
	</div>
	
	<div class="form-group">
  		<label for="nickname" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;닉네임</label>
  		<div class="col-sm-4">
  		<input type="text" class="form-control" placeholder="nickname" name="nickname" id="nickname" >
		</div>
	</div>
	
	<div class="form-group">
  		<label for="phone" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;전화번호</label>
  		<div class="col-sm-4">
  		<input type="text" class="form-control" placeholder="phone" name="phone" id="phone" >
		</div>
	</div>
	
	    

    <div class="form-group">
      <label for="exampleInputFile">File input</label>
      <input class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp" type="file" data-dpmaxz-eid="7">
      <small class="form-text text-muted" id="fileHelp">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>
    </div>
   
     
     
   
    <button class="btn btn-primary" type="submit">Submit</button>
   
  </fieldset>
  
</form>
</div>
</div>
</body>