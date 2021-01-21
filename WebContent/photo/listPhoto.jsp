<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
	    <title>목록으로 보기</title>

		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>		
	</head>
	<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top header-transparent">
    	<jsp:include page="/layout/toobar.jsp"/>
	</header>
	<!-- End Header -->
  
  	<section>
  		<jsp:include page="/photo/photoLeft.jsp"></jsp:include>
  	</section>
  	<div class="col-md-9">
	<table class="table table-hover" align="right">
	  <thead>
	    <tr>
	      <th scope="row">Default</th>
	      <td>Column content</td>
	      <td>Column content</td>
	      <td>Column content</td>
	    </tr>
	  </tbody>
	</table>
	</div>
	</body>
</html>