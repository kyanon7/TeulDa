<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>나의 후기 목록</title>
		

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
	</head>
	<body>

	<div class="jumbotron" wfd-id="126">
		<h1 class="display-3">Hello, world!</h1>
		<p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
		<hr class="my-4">
		<p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
		<p class="lead">
		  <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
		</p>
	</div>

	<div class="row">
		<div class="col-lg-2">
		  <div class="bs-component">
			<ul class="list-group">
			  <li class="list-group-item d-flex justify-content-between align-items-center">
				Cras justo odio
				<span class="badge badge-primary badge-pill">14</span>
			  </li>
			  <li class="list-group-item d-flex justify-content-between align-items-center">
				Dapibus ac facilisis in
				<span class="badge badge-primary badge-pill">2</span>
			  </li>
			  <li class="list-group-item d-flex justify-content-between align-items-center">
				Morbi leo risus
				<span class="badge badge-primary badge-pill">1</span>
			  </li>
			</ul>
		  </div>
		</div>
		<div class="col-lg-4">
		  <div class="bs-component">
			<div class="list-group">
			  <a href="#" class="list-group-item list-group-item-action active">Cras justo odio</a>
			  <a href="#" class="list-group-item list-group-item-action">Dapibus ac facilisis in</a>
			  <a href="#" class="list-group-item list-group-item-action disabled">Morbi leo risus</a>
			</div>
		  </div>
		</div>
		<div class="col-lg-4">
		  <div class="bs-component">
			<div class="list-group">
			  <a href="#" class="list-group-item list-group-item-action flex-column align-items-start active">
				<div class="d-flex w-100 justify-content-between">
				  <h5 class="mb-1">List group item heading</h5>
				  <small>3 days ago</small>
				</div>
				<p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
				<small>Donec id elit non mi porta.</small>
			  </a>
			  <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
				<div class="d-flex w-100 justify-content-between">
				  <h5 class="mb-1">List group item heading</h5>
				  <small class="text-muted">3 days ago</small>
				</div>
				<p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
				<small class="text-muted">Donec id elit non mi porta.</small>
			  </a>
			</div>
		  </div>
		</div>
	  </div>

	</body>
</html>