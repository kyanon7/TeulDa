<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>게시글 조회</title>
	    
	    	    <!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
		<!-- Summer note lite CDN -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
   		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	

		<script type="text/javascript">
		
		$(document).ready(function() {
			  $('#summernote').summernote({
		    	placeholder: '게시글을 남겨주세요',
		    	 height: 450,     
	   		     minHeight: null,
	   		     maxHeight: null,
	   		     focus: true, 
	    	     lang : 'ko-KR'
	  		});
		});
		
		function fncUpdatePost(){
			
		$("form").attr("method","POST").attr("action","/post/updatePost").submit();
		
		}
		
		$(function () {
			
			$("button:contains('수정')").on("click", function() {
				fncUpdatePost();
			});		
			$("button:contains('취소')").on("click", function() {
				history.go(-1);	
		});
	});
			
		</script>
	</head>
	<body>
 		 <header>
			<jsp:include page="../layout/toolbar.jsp"/>
		</header><br/><br/>
		
		<div class ="container">
			<div class="row">
				<div class="col-md-2">
				<jsp:include page="../post/leftbar.jsp" />
			</div>
		
		<div class="row">
		<div class="col-md-10">
				<form name="addPost">
			
					<select class="form-control" name="postCategory" style="width: 200px; height: 50px;">
							<option value="1">여행지 정보공유</option>
							<option value="2">맛집 정보공유</option>
							<option value="3">숙소 정보공유</option>
							<option value="4">Q&A</option>
							<option value="5">잡담</option>
					</select>	
						<br/>		
										
					<input type="hidden" name="postNo" value="${ post.postNo }"/> 
					
					<input type="text" name="postTitle" class="form-control" placeholder="제목 (반드시 입력)" value="${ post.postTitle }"><br>
					
					<textarea id="summernote" name="postContents" >${ post.postContents }</textarea>
					<br>
		
			<button type="button" class="btn btn-info">수정</button>	
			<button type="button" class="btn btn-info">취소</button>
		</form>
		</div>
		</div>
	</div>
	</div>