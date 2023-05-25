<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Stock sell decision 매도 결정하는 페이지</title>
<link rel="stylesheet" href="css/StocksellDc.css">
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
	<div id="box_green">
		<div id="box_white">
			<div id="stockName">

				<p class="SN">${CPstock.itmsNm}</p>
			</div>
			<br>
			<div id="currentPrice">현재가격</div>
			<br>
			<div id="currentP">
				<p>${CPstock.mkp }</p>
			</div>

			<br>
			<div id="Q">몇 주를 판매할까요?</div>
			<br>

			<div id="available">
				<p>판매 가능 수량 ${CPstock.stockEA}주</p>
			</div>

			<script>
				$(function() {
					var availableEA = ${CPstock.stockEA}	; // 보유 수량
					var quantityInput = document.querySelector('.EnterA'); // 수량 입력 요소
					var form = document.querySelector('form'); // 전송 폼

					form.addEventListener('submit', function(e) { // 전송 이벤트 감지
						e.preventDefault(); // 제출 이벤트 중지
						var stockEA = Number(quantityInput.value); // 수량 가져오기
						if (isNaN(stockEA) || stockEA <= 0)  { // 0 이하의 수량 입력하면 경고
							alert("판매할 수량을 1 이상으로 입력하세요.");
						} else if (stockEA > availableEA) { // 보유 수량 이상 입력하면 경고
							alert("보유한 수량(" + availableEA + "주)보다 많은 수량을 입력할 수 없습니다.");
						} else { // 그 외에는 폼 제출
							form.submit();
						}
					});
				});
			</script>

			<br>
			<div id="Enter">
				<form action="/Stocksellcheck" method="POST">
					<input type="text" class="EnterA" placeholder="수량입력" name="quantity" style="width: 240px; font-size: 30pt;"> 
					<input type="hidden" name="srtnCd" value="${CPstock.srtnCd}"> 
					<input type="hidden" name="mkp" value="${CPstock.mkp}"> 
					<input type="hidden" name="itmsNm" value="${CPstock.itmsNm}"> 
					<input type="hidden" name="tradeNo" value="${tradeNo}"> 
					<input type="submit" class="w-btn w-btn-green" value="완료">

				</form>
			</div>
		</div>
	</div>

</body>
</html>