<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stock sell decision 매도 결정하는 페이지</title>
<link rel="stylesheet" href="css/StocksellDc.css">
</head>
<body>
	<header id="ansimH">
		<h1>안심증권 > 매도 결정 페이지</h1>
	</header>
	<div id="box_green">
		<div id="box_white">
			<div id="sin">신일전자</div>
			<br>
			<div id="currentPrice">현재가격</div>
			<br>
			<div id="currentP">
				<p>2880원</p>
			</div>
			<br>
			<div id="Q">몇 주를 판매할까요?</div>
			<br>
			<div id="available">
				<p>판매 가능 수량 1주</p>
			</div>
			<br>
				<div id="Enter">
					<input type="text" class="EnterA" placeholder="수량입력"
						style="width: 240px; font-size: 30pt;">

				</div>
				<a href="http://localhost:8079/Stocksellcheck"> <input
					type="submit" class="w-btn w-btn-green" value="완료"></a>


		
		</div>
	</div>
</body>
</html>