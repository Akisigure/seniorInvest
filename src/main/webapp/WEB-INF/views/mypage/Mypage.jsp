<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Mypage 마이페이지</title>
<link rel="stylesheet" href="css/Mypage.css">
<meta charset="UTF-8">

</head>
<body>
	<nav class="crumbs">
		<ul>
			<li><a href="#">로그아웃</a></li>
			<li><a href="#">마이페이지</a></li>
		</ul>
	</nav>

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
			<span class="BalNum"> <fmt:formatNumber
					value="${Balance.balance}" type="number"></fmt:formatNumber>원
			</span>
		</div>
		<div id="boxAccount" style="display: inline-block; , width: 30%;">
			<div id=Acc>나의 계좌번호 ></div>
			<span class="bankN">${Balance.accountid}</span>
		</div>

		<div id="stockEA">
			<div id="Sto">보유수량 ></div>
			<div id="table">
				<br> <br>
				<table>
					<thead>
						<tr>
							<th>종목명</th>
							<th>보유수량</th>
							<th>현재가</th>
							<th>수익률</th>
						</tr>
					</thead>
					<tbody>
						<!--  ${StockEA} -->
						<c:forEach items="${StockEA}" var="stock">
							<tr>
								<td>${stock.itmsNm }</td>
								<td>${stock.stockEA}</td>
								<td>${stock.mkp}</td>
								<td>${stock.rofreturn }</td>
								<td><a
									href="StocksellDc?srtnCd=${stock.srtnCd }&tradeNo=${stock.tradeNo}">
										<input type="button" value="매도">
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<
			</div>
		</div>
	</form>
</body>
</html>