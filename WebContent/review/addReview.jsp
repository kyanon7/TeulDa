<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>후기 쓰기</title>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">

		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

	</head>
	<body>

		<header>
			<jsp:include page="../layout/toolbar.jsp"/><br />
		</header>

		<br />
	</div>
	<div class="container-fullwidth align-items-center">
		<div class="row">
			<div class="col-lg-2">
			</div>

			<div class="col-lg-8">

				<form wfd-id="337">
					<fieldset>
					  <legend>후기 작성</legend><br />
					  <div class="form-group" wfd-id="361">
						<label for="inputPlace" wfd-id="362">장소</label>
						<input type="place" class="form-control" id="inputPlace" aria-describedby="palceHelp" placeholder="장소" wfd-id="516">
						<small id="placeHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
					  </div>
					  <div class="form-group" wfd-id="351">
						<label for="exampleTextarea" wfd-id="352"><!--본문--></label>
						<small class="form-text text-muted">후기 내용을 200자 내외로 여기에 적어주세요.</small>
						<textarea class="form-control" id="exampleTextarea" rows="3" wfd-id="527"></textarea>
					  </div>
					  <div class="form-group" wfd-id="349">
						<label for="exampleInputFile" wfd-id="350">사진 첨부</label>
						<input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp" wfd-id="514">
					  </div>
					  <button type="submit" class="btn btn-primary" wfd-id="581">Submit</button>
					</fieldset>
				  </form>
				  

			</div>

			<div class="col-lg-2">
			</div>


		</div>
	</div>

	</body>
</html>