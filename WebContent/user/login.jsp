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
				          <input class="form-check-input" type="checkbox" value="" checked="">
				          	아이디 기억&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				        </label>
				        <label class="form-check-label">
				          <input class="form-check-input" type="checkbox" value="" checked="">
				          	로그인 유지
				        </label>
				      </div>
					  
					  <div class="form-group">
					    <div class="text-right">
					      <button type="button" class="btn btn-outline-success">로그인</button>
					      &nbsp;&nbsp;&nbsp;
					      <a class="btn btn-outline-primary" href="#" role="button">회원가입</a>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="text-center">
					      <button type="" class="btn btn-outline-danger">Google Login</button>
					    </div>
					    &nbsp;&nbsp;
					    <div class="text-center">
					      <button type="" class="btn btn-outline-warning">&nbsp;Kakao Login&nbsp;</button>
			
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