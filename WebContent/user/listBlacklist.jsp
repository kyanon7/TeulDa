<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
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
        
        .wrap{width:40%; text-align:center; margin:0px auto;}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-outline-primary" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
		
		//============= email 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser?email="+$(this).text().trim();
			});
						
			//==> email LINK Event End User 에게 보일수 있도록 

			
		});	
		
		
		//============= email 에 회원정보보기  Event  처리 (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(".badge.badge-light" ).on("click" , function() {

					var email = $(this).next().val();
				
					$.ajax( 
							{
								url : "/user/json/getUser/"+email ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									var displayValue = "<h6>"
																+"아이디 : "+JSONData.email+"<br/>"
																+"이  름 : "+JSONData.name+"<br/>"
																+"이메일 : "+JSONData.email+"<br/>"
																+"ROLE : "+JSONData.role+"<br/>"
																+"닉네임 : "+JSONData.nickname+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+email+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			});
			
			//==> email LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> 아래와 같이 정의한 이유는 ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
		
	
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	 
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<div class="row">
	<div class="col-xl-12">
	
		<div class="page-header text-center">
	       <h2 class>BLACK LIST</h2>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		   <%--  <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		<br>전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div> --%>
		    
		    
				  
				  
				 
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover">
      
        <thead>
   			 <tr>
      			<th align="center" scope="col">No</th>
      			<th scope="col">이메일</th>
      			<th scope="col">이름</th>
      			<th scope="col">닉네임</th>
      			<th scope="col">신고당한 횟수</th>
      			<th scope="col">상태</th>
    		</tr>
  		</thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="user" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr class="table-light">
			  <td align="left">${ i }</td>
			  <td align="left"  title="Click : 회원정보 확인">${user.email}</td>
			  <td align="left">${user.name}</td>
			  <td align="left">${user.nickname}</td>
			  <td align="left">${user.reportCount}</td>
			  <td align="left">
			  
			  <c:if test="${user.status eq '0'.charAt(0)}">
			    <c:out value="활성화" />
			  </c:if>
			  
			  <c:if test="${user.status eq '1'.charAt(0)}">
			    <c:out value="정지" />
			  </c:if>
			  
			  <c:if test="${user.status eq '2'.charAt(0)}">
			    <c:out value="휴면" />
			  </c:if>
			 
			  
			  
			  </td>
		
			  	
			  	<input type="hidden" value="${user.email}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
	  <small class="form-text text-muted" id="explain">신고당한 횟수가 10회 이상 인 회원들이 표시됩니다 .</small>
	  
	  	<div class="wrap">
	   	<!-- PageNavigation Start... -->

		<!-- PageNavigation End... -->
		</div>

		</div>
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 
	
</body>

</html>