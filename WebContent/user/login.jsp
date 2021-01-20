<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.5.3/lux/bootstrap.css" >
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.5.3/lux/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
            margin-top: 50px;
        }
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

		//============= "로그인"  Event 연결 =============
		$( function() {
			
			$("#email").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#email").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#password").focus();
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		//============= 회원원가입화면이동 =============
		$( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a:contains('SIGN UP')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
	</script>		
	
</head>

<body>
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
	
		 	 	<br/><br/>
				 	
		 	 		<h1 class="text-center">LOGIN</h1>

		  			<form>
		  			
					<div class="form-group">
  						<label for="email" class="col-form-label">ID</label>
  						<input type="text" class="form-control" placeholder="ID" name="email" id="email" >
					</div>
					  					  
					<div class="form-group">
  						<label for="password" class="col-form-label">PASSWORD</label>
  						<input type="password" class="form-control" placeholder="PASSWORD" name="password" id="password">
					</div>
					  <br><br>
					  
					  <div class="form-group">
					    <div class="text-center">
					      <button type="button" class="btn btn-outline-primary">LOGIN</button>
					      &nbsp;&nbsp;&nbsp;&nbsp;
					      <a class="btn btn-outline-secondary" href="#" role="button">SIGN UP</a>
					    </div>
					  </div>
					  
					  
					</form>
			   	</div>
			

  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>