<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>게시글 조회</title>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css"
	integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<!-- Google 지도 API 사용 스크립트 추가 -->

<script>
	

		//댓글 등록
	$(function(){
		
		$("button:contains('등록')").on("click", function(){
	         
	         $.ajax({
	         url : "/post/rest/addComment",   
	         type : "POST",
	         //dataType : "text",
	         headers: {
	            "Content-Type": "application/json"
	         },
	         data : JSON.stringify({
	               
	            postNo : "${ post.postNo }",
	            /* postNo : $("#postNo").val(), */
	            commentContents : $('#commentContents').val()
	         
	         
	         }),
			success : function(result){
				
				if (result == "Success") {
					alert("댓글이 등록되었습니다.");
				 location.reload();
				} else{
					alert("댓글이 등록되지 않았습니다.");
				}
			}
		});
	});
});
		


	//댓글 수정	
	$("#updateComment").on("click", function () {
		
		 var commentNo = $('#commentNo').val()
	/* 	 var updateCommentContents =  $('#updateCommentContents').val(); */

		 
		 $("#commentNo").val(commentNo);
		/*  $("#updateCommentContents").val(updateCommentContents); */
	});

	//댓글 수정
	$(function(){
		
		 var commentNo = $('#commentNo').val()
		/*  var updateCommentContents =  $('#updateCommentContents').val(); */
		
		$("#finalupdate").on("click", function(){
			
			alert("버튼 클릭됨");
			
			$.ajax({
			url : "/post/rest/updateComment",	
			type : "POST",
			headers: {
	            "Content-Type": "application/json"
	         },
			data : JSON.stringify({	
				
				commentNo : commentNo, 
				commentContents : $('#updateCommentContents').val()
			}), 
			dataType : "text",
			success : function(result){
				
				if (result == "Success") {
					alert("댓글이 수정되었습니다.");
					$("#modifyModal").modal("hide"); // Modal 닫기
					location.reload();
				} else{
					alert("댓글이 수정되지 않았습니다.");
				}
			}
		});
	});
});
	
	
		
	//댓글 삭제		
	$(function(){
		
		$("button:contains('삭제')").on("click", function(){
			
			alert("버튼 클릭됨");
			
			$.ajax({
			url : "/post/rest/deleteComment",	
			type : "POST",
	         //dataType : "text",
	         headers: {
	            "Content-Type": "application/json"
	         },
	         data : JSON.stringify({
	               
	           commentNo : $('#commentNo').val()
	         
	         
	         }), 
			
			success : function(result){
				
				if (result == "Success") {
					alert("댓글이 삭제되었습니다.");
					location.reload();
				} else{
					alert("댓글이 삭제되지 않았습니다.");
				}
			}
		});
	});
});
		

	
			
		//게시글 삭제, 수정
		$(function(){
			$("button:contains('게시글 수정')").on("click", function(){
				self.location = "/post/updatePost?postNo=${post.postNo}"			
			});
			
			$("button:contains('취소')").on("click", function(){
				self.location = "/post/listPost?postCategory=6"
			});
			
			/* $("button:contains('등록')").on("click", function(){
				fncAddComment();
			});  */
			});	
		
		
		//게시물 삭제
		$(function(){
			$("out").on("click", function(){
				
				 var msg = "정말 삭제하시겠습니까?";

				 var flag = confirm(msg);

				 if(flag==true){
				
				self.location = "/post/deletePost?postNo=${post.postNo}"
				 }
			});
			
		}); 
		
	</script>
</head>


<body>
	<header>
		<jsp:include page="../layout/toolbar.jsp" />
	</header>
	<br />
	<br />

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="../post/leftbar.jsp" />
			</div>

			<div class="row">

				<div class="col-md-10">

					<c:if test="${post.postCategory eq '0'.charAt(0)}">
						<h4>자유 게시글</h4>
					</c:if>
					<c:if test="${post.postCategory eq '1'.charAt(0)}">
						<h4>여행지 정보공유</h4>
					</c:if>
					<c:if test="${post.postCategory eq '2'.charAt(0)}">
						<h4>맛집 정보공유</h4>
					</c:if>
					<c:if test="${post.postCategory eq '3'.charAt(0)}">
						<h4>숙소 정보공유</h4>
					</c:if>
					<c:if test="${post.postCategory eq '4'.charAt(0)}">
						<h4>Q&A</h4>
					</c:if>
					<c:if test="${post.postCategory eq '5'.charAt(0)}">
						<h4>잡담</h4>
					</c:if>


					<br />
					<br />
					<div class="card border-secondary md-6" style="width: 55rem;">
						<div class="card-header">글번호 : ${post.postNo} &emsp;&emsp;
							작성자 : ${post.nickname} &nbsp; &nbsp; 작성일자 :
							${fn:substring(post.postDate, 0, 10)}
							&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							&nbsp; &nbsp;&nbsp; &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							조회수 : ${post.viewCount}</div>
						<div class="card-body"></div>
						<div class="card-title">
							<h4>${post.postTitle}</h4>
						</div>
						<p class="card-text">${post.postContents}</p>
					</div>
					<br />
					<br />


					<button class="btn btn-info" type="submit">게시글 수정</button>
					<out class="btn btn-info" type="submit">삭제</out>
					<button class="btn btn-info" type="button">취소</button>


					<!-- 	<form name="addComment" id="addComment"> -->

					<h4>댓글</h4>
					<br />
					<br /> <input type="text" name="commentContents"
						id="commentContents" class="form-control"
						placeholder="댓글을 작성해주세요." maxlength="200" /> <br />
					<br />
					<button class="btn btn-info" type="submit">등록</button>
					<input type="hidden" value="${ post.postNo }" />
					<!-- </form> -->

					<div class="toast show" role="alert" aria-live="assertive"
						aria-atomic="true" id="comment">
						<c:set var="i" value="0" />
						<c:forEach var="comment" items="${commentList}">

							<c:set var="i" value="${i+1}" />
							<div class="toast-header">
								<strong class="mr-auto">${comment.nickname}</strong> <small>${comment.commentDate}</small>

								<c:if test="${ sessionScope.user.nickname == comment.nickname }">
									<button type='button' class='badge badge-info'
										data-toggle='modal' data-target='#modifyModal'>수정</button>
									<input type="hidden" id="commentNo" value="${comment.commentNo}">
									<br />
									<button type='button' class="badge badge-danger"
										id="deleteComment">삭제</button>
									<%-- <input type="hidden" id="commentNo"
										value="${comment.commentNo}"> --%>
								</c:if>


							</div>
							<div class="toast-body">${comment.commentContents}</div>

						</c:forEach>
					</div>


					<%--  <table class="table table-hover">
 	   <tbody>
 	   			<c:set var = "i" value = "0" />
					<c:forEach var = "post" items = "${list}">
						<c:set var = "i" value = "${i+1}" />
 				 <tr class="table-info">
     			 <th scope="row">${post.nickname}</th>
     			 <td>${post.commentList} </td>
     			 <td>Column content</td>
     			 <td>${comment }</td>
      			 </tr>
      			 </c:forEach> --%>
					<!-- 	</tbody>
    </table> -->
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modifyModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">댓글 수정</h3>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="updateCommentContents">수정 댓글 내용</label>
						 <input type="text" name="updateCommentContents"
							id="updateCommentContents" class="form-control"
							placeholder="수정할 댓글을 작성해주세요." maxlength="200" />
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" id="finalupdate" class="btn btn-info">수정</button>
					<button type="button" class="btn btn-default pull-left"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>