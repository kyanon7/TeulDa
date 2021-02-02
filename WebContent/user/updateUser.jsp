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
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
            margin-top: 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn-primary" ).on("click" , function() {
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
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
					
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
			});
			 
		});	
		
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
	

<div class="col-lg-10"><!-- 길이지정 -->
<div class="bs-component"><!-- 컴포넌트는 부트스트랩에서 정의한 UI 요소로 버튼, 경고창, 네비게이션바 와 같이 화면 구성에 필요한 요소들을 정의해둔 클래스 집합 입니다 -->
<form data-dpmaxz-fid="4">
  <fieldset>
  
  	<br/><br/>
	<h1 class="text-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Join Our Site!</h1>
	
	<h3 class="text-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;필수입력정보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
    
    
	
	<div class="form-group has-danger">
		  <label class="form-control-label" for="inputInvalid">이메일</label>
		  <input type="text"  class="form-control is-invalid" id="inputInvalid" value="${user.email }" readonly>
		  <div class="invalid-feedback">이메일은 수정할 수 없습니다.</div>
		</div>
		
	<div class="form-group has-danger">
		  <label class="form-control-label" for="inputInvalid">닉네임</label>
		  <input type="text"  class="form-control is-invalid" id="inputInvalid" value="${user.nickname}" readonly>
		  <div class="invalid-feedback">닉네임은 수정할 수 없습니다.</div>
		</div>
	
	<div class="form-group has-danger">
		  <label class="form-control-label" for="inputInvalid">전화번호</label>
		  <input type="text"  class="form-control is-invalid" id="inputInvalid" value="${user.phone}" readonly>
		  <div class="invalid-feedback">휴대전화번호는 수정할 수 없습니다.</div>
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
	</div>
	
	    

    <div class="form-group">
      <label for="exampleInputFile">File input</label>
      <input class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp" type="file" data-dpmaxz-eid="7">
      <small class="form-text text-muted" id="fileHelp">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>
    </div>
   
     
     
   <div class="form-group">
		    <div class="text-center">
    <button class="btn btn-primary" type="submit">Submit</button>
    <a class="btn btn-secondary" href="#" role="button">cancel</a>
		    </div>
		  </div>

  </fieldset>
  
</form>
</div>

		  
		  

		  
		
		 
	    </form>
 	
	<!--  화면구성 div Start /////////////////////////////////////-->
	
	
 	
</body>

</html>