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
			const form = document.querySelector('form');

			console.log("${search}");

			class NavTabs extends React.Component{

				render(){
					return (
					<ul className="nav nav-tabs">
						<li className="nav-item">
							<a className="nav-link" href="/diary/listTotalDiary">DIARY</a></li>
						<li className="nav-item">
							<a className="nav-link active" href="/review/listTotalReview">REVIEW</a></li>
						<li className="nav-item">
							<a className="nav-link" >USER</a></li>
						<li className="nav-item">
							<a className="nav-link" href="/diary/listTotalHashTag">HASHTAG</a></li>
					</ul>
					);
				}
			}

			class FormGroup extends React.Component{

				render(){
					return(
						<div className="form-group">
							<div className="row">
								<SearchCondition/>
								<SearchKeyword/>
								<SearchButton/>
							</div>
						</div>
					);
				}
			}

			class UnderFormGroup extends React.Component{

				render(){
					return(
						<div className="row">
							<TotalCount/>
							<div className="col-md-4"></div>
							<SearchSorting/>
						</div>
					);
				}
			}

			class SearchCondition extends React.Component{

				render(){
					return(
						<div className="col-md-2">
							<select className="custom-select" name="searchConditon"/>
						</div>
					)
				}
			}

			class SearchKeyword extends React.Component{

				render(){
					return(
						<div className="col-md-8">
							<input className="form-control" type="text" name="searchKeyword" 
									placeholder="검색어 입력" id="inputDefault" value=""/>
						</div>
					);
				}
			}

			class SearchButton extends React.Component{

				render(){
					return(
						<div className="col-md-2">
							<button className="btn btn-primary" type="button">Search</button>
						</div>
					);
				}
			}

			class TotalCount extends React.Component{

				render(){
					return(
						<div className="col-md-2">
							<span className="badge badge-info">TOTAL ${ totalCount }</span>
						</div>
					)
				}
			}

			class SearchSorting extends React.Component{

				render(){
					return(
						<div className="col-md-6">
							<ol className="breadcrumb">
								<li className="breadcrumb-item" value="0">
									<a>최근 작성 순</a></li>
								<li className="breadcrumb-item" value="1">
									<a>조회수 높은 순</a></li>
							</ol>
							<input type="hidden" name="searchSorting" id="searchSorting" value="${ search.searchSorting }"/>
						</div>
					);
				}
			}

			ReactDOM.render(
				<div className="container">
					<NavTabs/><br />
					<FormGroup/>
					<UnderFormGroup/>
				</div>,
				form
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
		<ul className="nav nav-tabs"></ul>
	</form>
	</body>
</html>