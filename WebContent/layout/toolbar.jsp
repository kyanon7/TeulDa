<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script defer type="text/javascript">

	document.addEventListener("DOMContentLoaded", () => {
		if(document.getElementById('chat')){
			document.getElementById('chat').addEventListener('click', () => {
			
				fetch('/user/rest/getUser/${user.email}', {
					method: 'GET',
					headers: {
						"Content-Type": "application/json"
					},
					credentials : "same-origin"
				})
				.then(res => res.json())
				.then(result => {

					location.href = `https://powerful-inlet-24111.herokuapp.com?nickname=\${result.nickname}`
					
					// let form = document.createElement('form');
					// form.setAttribute("charset", "UTF-8");
					// form.setAttribute("method", "POST");
					// form.setAttribute("action", "http://localhost:3000/");
					// form.setAttribute("nickname", result.nickname);
					// form.setAttribute("password", result.password);
					// document.body.appendChild(form);
					// form.submit();
				})
				.catch(err => {
					
				});
			});
		}
	});

</script>

<div class="container-fullwidth align-items-center">

   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="#">TeulDa</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation" >
        <span class="navbar-toggler-icon" ></span>
      </button>
      
      
     <c:if test="${ empty user }">
	      <div class="collapse navbar-collapse" id="navbarColor02" >
	           <ul class="navbar-nav mr-auto" >
	            <li class="nav-item active" >
	            <a class="nav-link" href="/">Home
	               <span class="sr-only" >(current)</span>
	            </a>
	            </li>
	            <li class="nav-item">
	            <a class="nav-link" href="#">Top 10</a>
	            </li>
	            <li class="nav-item dropdown" >
	               <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Community</a>
	               <div class="dropdown-menu" >
	               <a class="dropdown-item" href="/post/listPost?postCategory=1">자유게시판</a>
	               </div>
	            </li>
	         </ul>
	         <ul class="navbar-nav ml-auto" >
	            <li class="nav-item">
	               <a class="nav-link" href="/user/login/">Login</a>
	            </li>
	            <li class="nav-item">
	               <a class="nav-link" href="/user/addUser/">Sign Up</a>
	            </li>
	        </ul>
	        <!-- <form class="form-inline my-2 my-lg-0" >
	         <input class="form-control mr-sm-2" type="text" placeholder="Search" >
	         <button class="btn btn-secondary my-2 my-sm-0" type="submit" >Search</button>
	        </form> -->
	      </div>
      </c:if>
      
      
      <c:if test="${ ! empty user }">
      	
	      <div class="collapse navbar-collapse" id="navbarColor02" >
	           <ul class="navbar-nav mr-auto" >
	            <li class="nav-item active" >
	            <a class="nav-link" href="/">Home
	               <span class="sr-only" >(current)</span>
	            </a>
	            </li>
	            <li class="nav-item">
	            <a class="nav-link" href="#">Top 10</a>
	            </li>
	            <li class="nav-item dropdown" >
	               <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Community</a>
	               <div class="dropdown-menu" >
	               <a class="dropdown-item" id="post" href="/post/listPost?postCategory=1">자유게시판</a>
	               <a class="dropdown-item" href="#">도장찍기</a>
	               <div class="dropdown-divider"></div>
	               <a class="dropdown-item" id="chat" href="#">채팅</a>
	               </div>
	            </li>
	            <li class="nav-item dropdown" >
	               <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">My Page</a>
	               <div class="dropdown-menu" >
	               <a class="dropdown-item" href="/diary/selectMap.jsp">기록</a>
	               <a class="dropdown-item" id="photo" href="/photo/listPhoto">앨범</a>
	               <a class="dropdown-item" id="review" href="/review/listReview">후기</a>
	               <a class="dropdown-item" id="subscribe" href="/subscribe/listSubscribe">구독</a>
	               </div>
	            </li>
	         </ul>
	         <ul class="navbar-nav ml-auto" >
	            <li class="nav-item">
	               <a class="nav-link" href="/user/logout/">Logout</a>
	            </li>
	            
	            <c:if test="${sessionScope.user.role eq '0'.charAt(0)}">
			      	<a class="nav-link" id="user"  href="/user/listUser">User List</a>
      			</c:if><!-- 관리자용 유저리스트 -->
      			
      			<c:if test="${sessionScope.user.role eq '0'.charAt(0)}">
			      	<a class="nav-link" id="user"  href="/user/listBlacklist">BlackList</a>
      			</c:if><!-- 관리자용 블랙리스트 -->
      			
      			<c:if test="${sessionScope.user.role eq '1'.charAt(0)}">
			      	<a class="nav-link" id="user"  href="/user/listUserPublic">User List</a>
      			</c:if><!-- 사용자용 리스트(공개 및 사용자 리스트) -->
	            
	            <li class="nav-item">
	               <a class="nav-link" href="/user/getUser?email=${sessionScope.user.email}"><img src="../resources/images/profile-user.svg" width="25" height="25" alt=""></a>
	            </li>
	        </ul>
	        <!-- <form class="form-inline my-2 my-lg-0" >
	         <input class="form-control mr-sm-2" type="text" placeholder="Search" >
	         <button class="btn btn-secondary my-2 my-sm-0" type="submit" >Search</button>
	        </form> -->
	      </div>
      </c:if>
      
   </nav>

</div>