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


<!-- Forms -->
<div class="col-lg-10"><!-- 왼쪽길이지정 -->
      
      <div class="bs-docs-section">
        <div class="row">
          <div class="col-lg-12">
            <div class="page-header">
            <br>
              <h1 id="forms" ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Join Our Site!</h1>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-6">
            <div class="bs-component">
              <form>
                <fieldset>
                 
                  
                  <div class="form-group">
			  		<label for="email" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;E-mail</label>	
			  		
			  		<input type="text" class="form-control" placeholder="E-mail" name="email" id="email" >
			  		<small class="form-text text-danger" id="emailHelp">필수입력사항입니다.</small>	  	
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
			
				</div>
                
            
                    
                  </fieldset>
                  
                 

                
              </form>
            </div>
          </div>
          <div class="col-lg-4 offset-lg-1">
            <form class="bs-component">
              
              <div class="form-group">
			  		<label for="address" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;주소</label>	
			  		<input type="text" class="form-control" placeholder="주소" name="address" id="address" >
			  </div>
			  
			   <div class="form-group">
			  		<label for="likePlace" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;관심지역</label>	
			  		<input type="text" class="form-control" placeholder="관심지역" name="likePlace" id="likePlace" >
			  </div>
			    
			  <div class="form-group">
                    <label for="exampleInputFile">File input</label>
                    <input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
                    <small id="fileHelp" class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>
                  </div>
                  
                    <fieldset class="form-group">
                    <legend>계정 공개/비공개 선택</legend>
                    <div class="form-check">
                      <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                        	공개
                      </label>
                    </div>
                    <div class="form-check">
                      <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
                       		비공개
                      </label>
                    </div>
                    <br><br>
				<button class="btn btn-primary" type="submit">Submit</button>
          

            </form>

            
          </div>
        </div>
      </div>
      </div>