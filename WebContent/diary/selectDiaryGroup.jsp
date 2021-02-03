<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>그룹 선택</title>
	    
	   	<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap CDN -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
		<style>
		</style>
		<script>
		</script>
	
	</head>

	<body>

	<div class="container">
		<div class="row">
			
			<div class="form-group">
			<c:set var="i" value="0" />
			<c:forEach var="group" items="${ diaryGroupList }">
				<c:set var="i" value="${ i+1 }" />
					
					<label class="form-check-label">
          				<input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
          				${ group.groupName eq 'default2' ? '그룹 미지정' : group.groupName }
        			</label> <br> 
				
			</c:forEach>
			</div>
		</div>
	</div>

  	
	</body>
</html>