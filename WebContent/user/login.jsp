	<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>


    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
    <title>Login Demo - Kakao JavaScript SDK</title>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

	
	
	<meta charset="utf-8" />
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="752230544000-qsman26p8dm7thqn27vb9etjnvg4ecu8.apps.googleusercontent.com.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
	
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
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(document).ready(function() {
		    var userInputId = getCookie("userInputId");
		    var setCookieYN = getCookie("setCookieYN");
		    
		    if(setCookieYN == 'Y') {
		        $("#idSaveCheck").prop("checked", true);
		    } else {
		        $("#idSaveCheck").prop("checked", false);
		    }
		    
		    $("#loginid").val(userInputId); 
		    
		    //로그인 버튼 클릭
		    $('#loginbtn').click(function() {
		        if($("#idSaveCheck").is(":checked")){ 
		            var userInputId = $("#loginid").val();
		            setCookie("userInputId", userInputId, 60); 
		            setCookie("setCookieYN", "Y", 60);
		        } else {
		            deleteCookie("userInputId");
		            deleteCookie("setCookieYN");
		        }
		        
		        document.fform.submit();
		    });
		});
	
		//쿠키값 Set
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + 
		    exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
	
		//쿠키값 Delete
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
	
		//쿠키값 가져오기
		function getCookie(cookie_name) {
		    var x, y;
		    var val = document.cookie.split(';');
		    
		    for (var i = 0; i < val.length; i++) {
		        x = val[i].substr(0, val[i].indexOf('='));
		        y = val[i].substr(val[i].indexOf('=') + 1);
		        x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
		        
		        if (x == cookie_name) {
		          return unescape(y); // unescape로 디코딩 후 값 리턴
		        }
		    }
		}


	
	

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

	<!-- ToolBar Start /////////////////////////////////////-->

    	<jsp:include page="/layout/toolbar.jsp"/>
	
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
	
		 	 	<br/><br/>
				 	
		 	 		<h1 class="text-center">LOGIN</h1>

		  			<form>
		  			
					<div class="form-group">
  						<label for="email" class="col-form-label">E-mail</label>
  						<input type="text" class="form-control" placeholder="E-mail" name="email" id="email" >
					</div>
					  					  
					<div class="form-group">
  						<label for="password" class="col-form-label">PASSWORD</label>
  						<input type="password" class="form-control" placeholder="PASSWORD" name="password" id="password">
					</div>
					  <br>
					  
					  <div class="form-check">
				        <label class="form-check-label">
				          <input class="form-check-input" type="checkbox" value="" >
				          	아이디 기억&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				        </label>
				        <label class="form-check-label">
				          <input class="form-check-input" type="checkbox" value="" >
				          	로그인 유지
				        </label>
				      </div>
					  
					  <div class="form-group">
					    <div class="text-right">
					      <button type="" class="btn btn-outline-success">로그인</button>
					      &nbsp;&nbsp;&nbsp;
					      <a class="btn btn-outline-primary" href="/user/addUser" role="button">회원가입</a>
					    </div>
					  </div>
					  
					  
					  
					   <a id="kakao-login-btn"></a>
						    <a href="http://developers.kakao.com/logout"></a>
						    <script type='text/javascript'>
						        //<![CDATA[
						        // 사용할 앱의 JavaScript 키를 설정해 주세요.
						        Kakao.init('3ac72698ea3c0b511e72a414411b60cd');
						        // 카카오 로그인 버튼을 생성합니다.
						        Kakao.Auth.createLoginButton({
						            container: '#kakao-login-btn',
						            success: function (authObj) {
						                alert(JSON.stringify(authObj));
						            },
						            fail: function (err) {
						                alert(JSON.stringify(err));
						            }
						        });
						        
						      //]]>
						    </script>
					  
					  
					  
					  
					  
					   <div></div>
						    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark">dfd</div>
						    <script>
						        function onSignIn(googleUser) {
						            // Useful data for your client-side scripts:
						            var profile = googleUser.getBasicProfile();
						            console.log("ID: " + profile.getId()); // Don't send this directly to your server!
						            console.log('Full Name: ' + profile.getName());
						            console.log('Given Name: ' + profile.getGivenName());
						            console.log('Family Name: ' + profile.getFamilyName());
						            console.log("Image URL: " + profile.getImageUrl());
						            console.log("Email: " + profile.getEmail());
						
						            // The ID token you need to pass to your backend:
						            var id_token = googleUser.getAuthResponse().id_token;
						            console.log("ID Token: " + id_token);
						        };
						    </script>
					  
					  <div class="form-group">
					    <div class="text-center">
					      <button type="button" class="btn btn-outline-danger">Google Login</button>
					    </div>
					    &nbsp;&nbsp;
					    <div class="text-center">
					      <button type="button" class="btn btn-outline-warning">&nbsp;Kakao Login&nbsp;</button>
			
					    </div>
					  </div>
					  
					  
					  
					  
					</form>
			   	</div>
			

  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>




























<%-- <%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>로그인</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncLogin() {
		var id=document.loginForm.email.value;
		var pw=document.loginForm.password.value;
		if(id == null || id.length <1) {
			alert('ID 를 입력하지 않으셨습니다.');
			document.loginForm.email.focus();
			return;
		}
		
		if(pw == null || pw.length <1) {
			alert('패스워드를 입력하지 않으셨습니다.');
			document.loginForm.password.focus();
			return;
		}
	    document.loginForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000" >

<form name="loginForm"  method="post" action="/user/login" target="_parent">

<div align="center">

<TABLE WITH="100%" HEIGHT="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
<TD ALIGN="CENTER" VALIGN="MIDDLE">

<table width="650" height="390" border="5" cellpadding="0" cellspacing="0" bordercolor="#D6CDB7">
  <tr> 
    <td width="10" height="5" align="left" valign="top" bordercolor="#D6CDB7">
    	<table width="650" height="390" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="305">
            <img src="/images/logo-spring.png" width="305" height="390">
          </td>
          <td width="345" align="left" valign="top" background="/images/login02.gif">
          	<table width="100%" height="220" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="30" height="100">&nbsp;</td>
                <td width="100" height="100">&nbsp;</td>
                <td height="100">&nbsp;</td>
                <td width="20" height="100">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="50">&nbsp;</td>
                <td width="100" height="50">
                	<img src="/images/text_login.gif" width="91" height="32">
                </td>
                <td height="50">&nbsp;</td>
                <td width="20" height="50">&nbsp;</td>
              </tr>
              <tr> 
                <td width="200" height="50" colspan="4">
                </td>
              </tr>              
              <tr> 
                <td width="30" height="30">&nbsp;</td>
                <td width="100" height="30">
                	<img src="/images/text_id.gif" width="100" height="30">
                </td>
                <td height="30">
                  <input 	type="text" name="email"  class="ct_input_g" 
                  				style="width:180px; height:19px"  maxLength='50'/>          
          		</td>
                <td width="20" height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="30">&nbsp;</td>
                <td width="100" height="30">
                	<img src="/images/text_pas.gif" width="100" height="30">
                </td>
                <td height="30">                    
                    <input 	type="password" name="password" class="ct_input_g" 
                    				style="width:180px; height:19px"  maxLength="50" >
                </td>
                <td width="20" height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="20">&nbsp;</td>
                <td width="100" height="20">&nbsp;</td>
                <td height="20" align="center">
      				<table width="136" height="20" border="0" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td width="56">
                            	<a href="javascript:fncLogin();">
                            		<img src="/images/btn_login.gif" width="56" height="20" border="0">
                            	</a>
                            </td>
                            <td width="10">&nbsp;</td>
                            <td width="70">
                            	<a href="addUser.jsp;">
                            		<img src="/images/btn_add.gif" width="70" height="20" border="0">
                            	</a>
                            </td>
                          </tr>
                    </table>
                  </td>
                  <td width="20" height="20">&nbsp;</td>
                </tr>
            </table>
         </td>
       </tr>                            
      </table>
      </td>
  </tr>
</table>
</TD>
</TR>
</TABLE>
</div>

</form>

</body>
</html>

<script type="text/javascript">
	document.loginForm.email.focus();
</script>
 --%>