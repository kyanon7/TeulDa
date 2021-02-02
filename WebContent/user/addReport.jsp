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
				fncAddReport();
			});
		});	
		
		console.log(targetNick);
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		
		function fncAddReport() {
			
			var reporterNick = "${sessionScope.user.nickname}";
			var reason=$("input[name='reason']").val();
			var reportType=$("input[name='reportType']").val();
			var reportPhoto=$("input[name='reportPhoto']").val();
			var targetNick="${targetNick}";
			
		
			
			
			
		


		 $("form").attr("method" , "POST").attr("action" , "/user/addReport").submit();
		}
		
		
			</script>	
   

</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->

    	<jsp:include page="/layout/toolbar.jsp"/>
	
   	<!-- ToolBar End /////////////////////////////////////-->
<div class="col-lg-10"><!-- 길이지정 -->
	
  <input type="hidden" name="reporterNick" value="${user.nickname}" />
  <input type="hidden" name="targetNick" value="${targetNick}" />
<div class="bs-component"><!-- 컴포넌트는 부트스트랩에서 정의한 UI 요소로 버튼, 경고창, 네비게이션바 와 같이 화면 구성에 필요한 요소들을 정의해둔 클래스 집합 입니다 -->
<form data-dpmaxz-fid="4">
  <fieldset>
  	<input type="hidden" name="reporterNick" value="${user.nickname}" />
  	<input type="hidden" name="targetNick" value="${targetNick}" />
  
  	<br/><br/>
	<h1 class="text-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신고</h1>
	
	
    
    <div class="form-group">
  		<label for="Reason" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;신고사유</label>	
  		<div class="col-sm-4">
  		<input type="text" class="form-control" placeholder="신고사유를 입력해 주세요" name="reason" id="reason" >
  		</div>
	</div>
    
    
    
    
    <table class="table table-hover">
									<label for="reportType" class="col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;신고유형</label>	
										<th scope="col"><select class="form-control" name="reportType" style="width: 150px; height: 50px;">
												<option value="욕설">욕설</option>
												<option value="음란물 배포">음란물 배포</option>
												<option value="광고성 글">광고성 글</option>
												<option value="도배">도배</option>
										</select></th>
									</tr>
								</table>
  


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