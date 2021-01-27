<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
               <a class="dropdown-item" href="#">채팅</a>
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