<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html>
	
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
    	 body >  div.container{ 
            margin-top: 50px;
        }
        
        body > div.select-img{ 
             width: 100%;
    height: 100%;
    object-fit: cover
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $("button:contains('회원정보수정')" ).on("click" , function() {
					self.location = "/user/updateUser?email=${user.email}"
				});
		});
		console.log("${user.nickname}")
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "button:contains('회원탈퇴')" ).on("click" , function() {
					 var msg = "정말로 탈퇴하시겠습니까?";

					 var flag = confirm(msg);

					 if(flag==true) {
					 $("form").attr("method" , "GET").attr("action" , "/user/deleteUser?email=${user.email}").submit();
					 alert("탈퇴되었습니다.");
					 }
					 else {alert("취소하였습니다.");}
					});
			});
		
		
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<form>
		<input type="hidden" name="email" value="${user.email}" />
		<div class="page-header">
	       <h2 class="text-left">${user.nickname}님의 공간</h2>
	    </div>
	    
	    <div class="box" style="background: #BDBDBD;">
	    <div class="select-img"><img src="${user.profilePhoto}" style="width: 10%;"/></div>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>닉네임</strong></div>
			<div class="col-xs-8 col-md-4">${user.nickname}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>이 름</strong></div>
			<div class="col-xs-8 col-md-4">${user.name}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>거주지</strong></div>
			<div class="col-xs-8 col-md-4">${user.address}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>관심지역</strong></div>
			<div class="col-xs-8 col-md-4">${user.likePlace}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>휴대전화번호</strong></div>
			<div class="col-xs-8 col-md-4">${ !empty user.phone ? user.phone : ''}	</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>이 메 일</strong></div>
			<div class="col-xs-8 col-md-4">${user.email}</div>
		</div>
		
		<hr/>
		

		

		
		<div class="form-group">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-outline-primary">회원정보수정</button>
	  			<button type="button" class="btn btn-outline-danger">회원탈퇴</button>
	  		</div>
		</div>
		

		
		<br/>
		</form>
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>