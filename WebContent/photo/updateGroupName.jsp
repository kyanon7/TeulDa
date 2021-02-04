<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>앨범명 수정</title>
	    
	   	<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
		<style>
		</style>
		<script>
		
		$(function() {

			$("button:contains('수정')").on("click", function() {
				$.ajax(
						{
							url : "/photo/rest/updateGroupName" ,
							method : "POST" ,
							dataType : "text" ,
							data : {
								groupNo : ${ groupNo }, 
								groupName : $("#updateGroupName").val()
							},
							success : function(result) {
								if (result == "Success") {
									alert("앨범이름이 수정되었습니다.");
									window.opener.location.reload(); // 부모창 새로고침하고 팝업창(자식창) 닫기
									window.close(); // 팝업창 닫기 
								} else {
									alert("앨범이름이 수정되지 않았습니다.");
								}
							}
							
				});
			});
	
		});
	
		
		</script>
	
	</head>

	<body>

	<div>
		<input type="text" id="updateGroupName" name="updateGroupName" style="height: 38pt;" placeholder="앨범명을 입력해주세요" value=""/>
		<!-- <input type="text" readonly="" class="form-control-plaintext" id="groupName" placeholder="앨범명을 입력해주세여."> -->
		<button type="button" class="btn btn-outline-info">수정</button>
		<button type="button" class="btn btn-outline-danger" onClick="window.close();">취소</button>
  	</div>

	</body>
</html>