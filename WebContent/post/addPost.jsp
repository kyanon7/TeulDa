<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


   <title>새 글 작성</title>
   
   <header>
			<jsp:include page="../layout/toolbar.jsp"/>
	</header>
	
<!-- include libraries(jQuery, bootstrap) -->


<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	</head>
		
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<!-- include summernote css/js-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	<!-- include summernote-ko-KR -->
	<script src="/resources/js/summernote-ko-KR.js"></script>	
		

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>
</head>
<body>

<div class="container">
  			<div class="row">
  				<!-- diary toolbar로 빼도 될 듯 -->
  				<div class="col-md-3">
  					<div class="list-group">
  					<button type="button" class="btn btn-info disabled">자유게시판</button>
  					<button type="button" class="btn btn-outline-info">+ 새 글 작성</button><br/>
  					<a href="#" class="list-group-item list-group-item-action active">여행지 정보공유</a>
  					<a href="#" class="list-group-item list-group-item-action">맛집 정보공유</a>
  					<a href="#" class="list-group-item list-group-item-action">숙소 정보공유</a>
  					<a href="#" class="list-group-item list-group-item-action">Q&A</a>
  					<a href="#" class="list-group-item list-group-item-action">잡담</a>
					</div>
				</div>


				<div class="col-md-9">
				<div style="width: 100%;">
				<form method="post" action="/write">
				<input type="text" name="title" style="width: 40%;" placeholder="제목"/>
				<br><br> 
				<textarea id="summernote" name="content"></textarea>
				<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
			</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>