<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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
	<script defer type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/user/listUserTotal").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		
		
		
		//============= email 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser?email="+$(this).text().trim();
			});
						
			//==> email LINK Event End User 에게 보일수 있도록 

			
		});	
		 $(function() {

				$("button:contains('검색')").on("click", function() { 

					fncGetList(1);
				});
			});
		 
		 $(function() {
			 $("li.breadcrumb-item").on("click", function() { // 정렬
					// <li> 클릭 시 해당 value 값 input type text 에 넣기
					$("#searchSorting").val($(this).attr('value'));
					fncGetList();  
				});
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
						//이름클릭=get
					
			});
			
			//==> email LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
		
	
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	<br />
	<br />
   	<form name="detailForm">

	<div class="container">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link" href="/diary/listTotalDiary?searchKeyword=${ search.searchKeyword }">DIARY</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/review/listTotalReview?searchKeyword=${ search.searchKeyword }">REVIEW</a>
			</li>
			<li class="nav-item">
				<a class="nav-link active"  href="/user/listUserTotal?searchKeyword=${ search.searchKeyword }">USER</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/diary/listTotalHashTag?hashTagName=${ search.searchKeyword }">HASHTAG</a>
			</li>
		</ul>
		<br>
		<div class="form-group">
			<div class="row">
				<div class="col-md-2">
					<div class="form-group">
							<select class="custom-select" name="searchCondition">
								<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>전체</option>
								<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>닉네임</option>
								<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>거주지</option>
								<option value="3" ${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>관심지역</option>			
							</select> 
					</div>
				</div>
				<div class="col-md-8">
  					<input type="text" name="searchKeyword" class="form-control"
								placeholder="검색어 입력" id="inputDefault"
								value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
  				</div>
  				<div class="col-md-2">
  					<button type="button" class="btn btn-primary">검색</button>
  				</div>
  			</div>
  			
  			<div class="row">
  				<div class="col-md-2">
  					<span class="badge badge-info">TOTAL ${resultPage.totalCount}</span>
  				</div>
  				<div class="col-md-4"></div>
  				<div class="col-md-6">
					<ol class="breadcrumb" style="float: right;">
						<li class="breadcrumb-item" value="0"><a
							${ ! empty search.searchSorting && search.searchSorting==0 ? "style=font-weight:350;" : "" }>
							이메일 순 정렬</a></li>
						<li class="breadcrumb-item" value="1"><a
							${ ! empty search.searchSorting && search.searchSorting==1 ? "style=font-weight:350;" : "" }>
							닉네임 순 정렬</a></li>
						<li class="breadcrumb-item" value="2"><a
							${ ! empty search.searchSorting && search.searchSorting==2 ? "style=font-weight:350;" : "" }>
							이름 순 정렬</a></li>
					</ol>
					<input type="hidden"
						name="searchSorting" id="searchSorting"
						value="${ search.searchSorting }">
					<!-- <li> 클릭 시 해당 value 값 input type text 에 넣기  -->
				</div> 
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
      			<th scope="col">거주지</th>
      			<th scope="col">관심지역</th>
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
			  <td align="left">${user.address}</td>
			  <td align="left">${user.likePlace}</td>
			  
			  	
			  	<input type="hidden" value="${user.email}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
	  	<div class="wrap">
	   	<!-- PageNavigation Start... -->

		<!-- PageNavigation End... -->
		</div>

 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 
	
</body>

</html>