<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container d-flex align-items-center">

	<div class="logo mr-auto">
		<h1 class="text-light"><a href="../index.jsp"><span>TeulDa</span></a></h1>
		<!-- Uncomment below if you prefer to use an image logo -->
		<!-- <a href="index.html"><img src="resources/assets/img/logo.png" alt="" class="img-fluid"></a>-->
	</div>

	<nav class="nav-menu d-none d-lg-block">
		<ul>
		<li class="active"><a href="../index.jsp">Home</a></li>
		<li><a href="#portfolio">Top 10 </a></li>
		<li class="drop-down"><a href="">Community</a>
			<ul>
			<li><a href="#">자유게시판</a></li>
			<li><a href="#">도장찍기</a></li>
			<li><a href="#">채팅</a></li>
			</ul>
		</li>
		<li class="drop-down"><a href="">MyPage</a>
			<ul>
			<li><a href="#">기록</a></li>
			<li><a href="#">앨범</a></li>
			<li><a href="#" id="review">후기</a></li>
			<li><a href="#">구독</a></li>
			</ul>
		</li>
		<li class="active"><a href="../user/login.jsp">Login</a></li>
		<li><a href="#contact">Sign Up</a></li>
		<li><a href="#contact">사람 아이콘</a></li>
		</ul>
		
	</nav><!-- .nav-menu -->

</div>