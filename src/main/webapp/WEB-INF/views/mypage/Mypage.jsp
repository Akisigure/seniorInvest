<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Mypage 마이페이지</title>
<link rel="stylesheet" href="css/Mypage.css">
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Style -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<header id="header">
		<img src="img/logoR.png" alt="로고" id="logo">
		<nav id="navigation">
			<ul id="menu">
				<li><a href="#">주식 검색(매수)</a></li>
				<li><a href="#">테마뉴스</a></li>
				<li><a href="#">공시</a></li>
				<li><a href="#">공지사항 | Q&A </a></li>
			</ul>
		</nav>
	</header>
	<form>
		<div id="boxBalance" style="display: inline-block; , width: 50%;">
			<div id=BaL>나의 잔액 ></div>
			<span class="BalNum"> 
			<fmt:formatNumber value="${Balance.balance}" type="number"></fmt:formatNumber>원</span>
		</div>
		<div id="boxAccount" style="display: inline-block; , width: 30%;">
			<div id=Acc>나의 계좌번호 ></div>
			<span class="bankN">${Balance.accountid}</span>
		</div>

		<div id="stockEA">
			<div id="Sto">보유수량 ></div>
			<div class="content">
				<div class="table-responsive custom-table-responsive">
					<!--  전체 회색 박스 -->

					<table class="table custom-table">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">종목명</th>
								<th scope="col">보유수량</th>
								<th scope="col">현재가</th>
								<th scope="col">수익률</th>
							</tr>
						</thead>
						<tbody>
							<!--  ${StockEA} -->
							<c:forEach items="${StockEA}" var="stock">
								<tr>
									<th scope="row"></th>
									<td>${stock.itmsNm }</td>
									<td>${stock.stockEA}</td>
									<td>${stock.mkp}</td>
									<td>${stock.rofreturn }</td>
									<td><a href="StocksellDc?srtnCd=${stock.srtnCd }&tradeNo=${stock.tradeNo}">
										<input type="button" class="w-btn" value="매도">
									</a></td>
								</tr>
							</c:forEach>
							<tr class="spacer">
								<td colspan="100"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>