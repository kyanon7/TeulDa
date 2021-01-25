<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


   <title>새 글 작성</title>

		<!— jQuery CDN —>
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!— Bootstrap CDN —>
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
		<!— Summer note lite CDN —>
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
   		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
   		
   		
	<script type="text/javascript">
	
	function fncAddPost(){
		
 		var postCategory = $("#postCategory option:selected").val();
		var postTitle = $("input[name:'title']").val();	
		var postConetents= $("textarea[name:'content']").val();	
	
	
		if(postCategory == null || postCategory.length<1){
			alert("게시판 유형은 반드시 선택하여야 합니다.");
			return;
		}
		if(postTtile == null || postTtile.length<1){
			alert("제목은 반드시 입력하여야 합니다.");
			return;
		}
	
	$("form").attr("method","POST").attr("action","/post/addPost").submit();
}

		
		$(function(){
			$("button:contains('등록')").on("click", function(){
				fncAddPost();
			});
		});

	</script>
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
	<jsp:include page="../layout/toolbar.jsp"/>


	<div class="container">
	<form>	
	
  			<div class="row">
  				<div class="col-md-2">
  					<div class="list-group">
  					<a type="button" href="/post/listPost" class="btn btn-info abled">자유게시판</a>
  					<a type="button" href="/post/addPost" class="btn btn-outline-info">+ 새 글 작성</a><br/>
  					<a href="#" class="list-group-item list-group-item-action active">여행지 정보공유</a>
  					<a href="#" class="list-group-item list-group-item-action">맛집 정보공유</a>
  					<a href="#" class="list-group-item list-group-item-action">숙소 정보공유</a>
  					<a href="#" class="list-group-item list-group-item-action">Q&A</a>
  					<a href="#" class="list-group-item list-group-item-action">잡담</a>
					</div>
				</div>
			
 				 <div class="form-group">
 				 <div class="col-md-3">
   					<select id="postCategory" class="custom-select">
    				<option>게시판 유형</option>
   			  	    <option  value="1" >여행지 정보공유</option>
    				<option  value="2">맛집 정보공유</option>
      				<option  value="3">숙소 정보공유</option>
      				<option  value="4">Q&A</option>
      				<option  value="5">잡담</option>
  				  </select>
  				</div>

		
				<div class="col-md-9">
				<div style="width: 100%;">
				<br>
				<input type="text" name="title" style="width: 40%;" placeholder="제목"/>
				<br><br> 
				<textarea id="summernote" name="content"></textarea>
				<!-- <input id="subBtn" type="button" value="등록" style="float: right;"/>
				<input id="cancleBtn" type="button" value="취소" style="float: right;"/> -->
				
				<button class="btn btn-info" type="button">등록</button>
				<button class="btn btn-info" type="button">취소</button>
			</div>
		</div>
	</div>
</div>
</form>
</div>
</body>
</html>