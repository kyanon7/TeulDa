<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>나의 후기 목록</title>

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.6.0/dist/lux/bootstrap.min.css" integrity="sha256-n1LAsYCohTi3YOpx8/Jhgf1i6BLuraa4Bnx/qTd4Vs0=" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/rateyo@2.3.5/src/jquery.rateyo.css" integrity="sha256-NGkqAxC1CKM2ILB67FglDNhS5Sd2kKAacTcoWKznSZU=" crossorigin="anonymous">
		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha256-7dA7lq5P94hkBsWdff7qobYkp9ope/L5LQy2t/ljPLo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/rateyo@2.3.5/src/jquery.rateyo.js" integrity="sha256-Sq0rSsEMzpXVg0elKKGMr0h0buMHMdRApm944Lh6XoA=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/react@17.0.1/umd/react.development.js" integrity="sha256-vgei20o/SJ6umW3ivqyJho3ehzJtQ0/7RXS6Z17uC9A=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/react-dom@17.0.1/umd/react-dom.development.js" integrity="sha256-qMfhc+Y8DYwzdUxp1SsKc0nlW57lOIeoPaZ5pZs+MqA=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/babel-standalone@6.26.0/babel.min.js" integrity="sha256-FiZMk1zgTeujzf/+vomWZGZ9r00+xnGvOgXoj0Jo1jA=" crossorigin="anonymous"></script>

		<script defer type="text/babel">
			const container = document.getElementById('container');

			console.log("${search}");

			class NavTabs extends React.Component{

				render(){
					return ReactDOM.createPortal(
					<ul className="nav nav-tabs">
						<li className="nav-item">
							<a className="nav-link" href="/diary/listTotalDiary">DIARY</a></li>
						<li className="nav-item">
							<a className="nav-link active" href="/review/listTotalReview">REVIEW</a></li>
						<li className="nav-item">
							<a className="nav-link" >USER</a></li>
						<li className="nav-item">
							<a className="nav-link" href="/diary/listTotalHashTag">HASHTAG</a></li>
					</ul>,
					container
					);
				}
			}

			class FormGroup extends React.Component{

				render(){
					return(
						<div className="row">
							<div className="col-md-2">
								<div className="form-group">

								</div>
							</div>
						</div>
					)
				}
			}

			ReactDOM.render(
				<FormGroup/>,
				container
			);

		</script>

		</head>
	<body>

	<header>
		<jsp:include page="../layout/toolbar.jsp"/>
	</header>
	<br />
	<br />

	<form>
		<div id="container" class="container"><br></div>
	</form>
	</body>
</html>